package com.currency.service;

import com.currency.model.Currency;
import org.springframework.validation.BindingResult;

import java.util.List;

public interface CurrencyService {
    List<Currency> convertAmount(Currency currency);

    void save(Currency currency);

    List<Currency> getAll(String pageId);

    List<String> handleBackendError(BindingResult br);

    List<Currency> getAllBySort(String fieldName);
}
