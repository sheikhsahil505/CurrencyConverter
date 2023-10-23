package com.currency.service;

import com.currency.model.Currency;
import org.springframework.validation.BindingResult;

import java.util.List;

public interface CurrencyService {
    List<Currency> convertAmount(Currency currency);

    void save(Currency currency);



    List<String> handleBackendError(BindingResult br);



    List<Currency> getByPagination(String pageId, String pageSize);

    List<Currency> filterByKeyword(String keyword);
}
