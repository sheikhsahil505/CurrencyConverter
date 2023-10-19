package com.currency.controller;

import com.currency.model.Currency;
import com.currency.service.CurrencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;


@Controller
public class CurrencyController {


    @Autowired
    private CurrencyService currencyService;

    @RequestMapping("/")
    public String view(){
        return "index";
    }

        @RequestMapping(value = "/convert")
        public String convert(@Valid Currency currency, BindingResult br, Model model){
            if (br.hasErrors()) {
                List<ObjectError> errors = br.getAllErrors();
                model.addAttribute("ErrorFromBackend", errors);
                return "index";
            }else{
                List<Currency> result = currencyService.convertAmount(currency);
                model.addAttribute("result",result);
            return "index";
        }
        }
    @GetMapping(value = "/history/{pageNo}")
    public String getAll(@PathVariable("pageNo") String pageId, Model model) {
        int intId= Integer.parseInt(pageId);
        int total = 10;
        List<Currency> all = currencyService.getAll(intId, total);
        model.addAttribute("result", all);
        return "history";
    }



}
