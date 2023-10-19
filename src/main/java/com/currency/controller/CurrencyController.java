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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.RequestContextUtils;

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

        @RequestMapping(value = "/convert" ,method = RequestMethod.POST)
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
    @RequestMapping(value = "/history" ,method = RequestMethod.GET)
    public String getAll( Model model){
        List<Currency> all = currencyService.getAll();
        model.addAttribute("result",all);
        return "history";
    }
    @RequestMapping("/change-language")
    public String changeLanguage(@RequestParam String lang, HttpServletRequest request, HttpServletResponse response) {
        // Set the user's preferred language
        RequestContextUtils.getLocaleResolver(request).setLocale(request, response, new java.util.Locale(lang));

        // Redirect back to the current page
        return "redirect:" + request.getHeader("Referer");
    }
}
