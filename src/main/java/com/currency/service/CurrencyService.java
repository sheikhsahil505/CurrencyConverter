package com.currency.service;

import com.currency.model.Currency;

import java.util.List;

public interface CurrencyService {
    String convertAmount(Currency currency);

    void save(Currency currency);

    List<Currency> getAll();
}
