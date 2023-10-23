package com.currency.controller;

import com.currency.model.Currency;
import com.currency.service.CurrencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


@Controller
public class CurrencyController {

    @Autowired
    private CurrencyService currencyService;

    @RequestMapping("/")
    public String view() {
        return "index";
    }

    // this method for convert currency
    @RequestMapping(value = "/convert")
    public String convert(@Valid Currency currency, BindingResult br, Model model) {
        if (br.hasErrors()) {
            List<String> errorMessages = currencyService.handleBackendError(br);
            model.addAttribute("errors", errorMessages);
        } else {
            List<Currency> result = currencyService.convertAmount(currency);
            model.addAttribute("result", result);

        }
        return "index";
    }

    //        this method fetch history
    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String getAll(Model model) {
        List<Currency> all = currencyService.getAll();
        model.addAttribute("result", all);
        return "history";
    }

    @GetMapping(value = "/pagination")
    public String pagination(@RequestParam("pageNo") String pageNo, @RequestParam("pageSize") String pageSize, Model model) {
        List<Currency> all = currencyService.getByPagination(pageNo, pageSize);
        model.addAttribute("result", all);
        return "history";
    }

    @GetMapping(value = "/search")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        List<Currency> all = currencyService.filterByKeyword(keyword);
        model.addAttribute("result", all);
        return "history";
    }


}
