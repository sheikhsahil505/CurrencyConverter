package com.currency.service;

import com.currency.model.Currency;

import java.util.List;

public interface CurrencyService {
    List<Currency> convertAmount(Currency currency);

    void save(Currency currency);

    List<Currency> getAll(int pageId, int total);
}
