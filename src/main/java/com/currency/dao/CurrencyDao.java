package com.currency.dao;

import com.currency.model.Currency;

import java.util.List;

public interface CurrencyDao {
    void save(Currency currency);
    List<Currency> getAll(int pageId,int total);
}
