package com.currency.service;

import com.currency.dao.CurrencyDao;
import com.currency.model.Currency;
import com.currency.util.ConvertCurrency;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class CurrencyServiceImpl implements CurrencyService{
    @Autowired
    private ConvertCurrency convertCurrency;
    @Autowired
    private CurrencyDao currencyDao;
    @Autowired
    private HttpSession session;
    @Autowired
    private MessageSource messageSource;


    @Override
    public List<Currency> convertAmount(Currency currency) {
     return this.convertCurrency.convertAmount(currency);
    }

    @Override
    public void save(Currency currency) {
        currencyDao.save(currency);
    }

    private int getCurrentPageFromSession() {
        Integer currentPage = (Integer) session.getAttribute("currentPage");
        if (currentPage == null) {
            return 1;
        }
        return currentPage;
    }
    private void saveCurrentPageToSession(int currentPage) {
        session.setAttribute("currentPage", currentPage);
    }

    @Override
    public List<Currency> getAll(String pageId) {
        int total = 10;
        if (pageId.equals("next")) {
            int currentPage = getCurrentPageFromSession();
            currentPage++;
            saveCurrentPageToSession(currentPage);
            return this.currencyDao.getAll(currentPage, total);
        } else if (!pageId.equals("1") && !pageId.equals("2") && !pageId.equals("3")) {
           return this.currencyDao.getAllBySort(pageId);
        } else {
            int intId = Integer.parseInt(pageId);
            session.setAttribute("currentPage", intId);
            return this.currencyDao.getAll(intId, total);
        }
    }


    @Override
    public List<String> handleBackendError(BindingResult br) {
        List<ObjectError> errors = br.getAllErrors();
        List<String> errorMessages = new ArrayList<>();
        for (ObjectError error : errors) {
            String errorMessage = messageSource.getMessage(error.getDefaultMessage(), null, LocaleContextHolder.getLocale());
            errorMessages.add(errorMessage);
        }
        return errorMessages;
    }

    @Override
    public List<Currency> getAllBySort(String fieldName) {

        return this.currencyDao.getAllBySort(fieldName);
    }
}
