package com.currency.controller;

import com.currency.model.Currency;
import com.currency.service.CurrencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "/convert" ,method = RequestMethod.POST)
    public String convert(@Valid Currency currency, BindingResult br, Model model){
        if (br.hasErrors()) {
            List<ObjectError> errors = br.getAllErrors();
            model.addAttribute("ErrorFromBackend", errors);
            return "index";
        }else{
        String result = currencyService.convertAmount(currency);
        model.addAttribute("result",result);
        return "index";
    }
    }
    @RequestMapping(value = "/history" ,method = RequestMethod.GET)
    public String getAll( Model model){
        List<Currency> all = currencyService.getAll();
        model.addAttribute("result",all);
        return "history";
    }
}
