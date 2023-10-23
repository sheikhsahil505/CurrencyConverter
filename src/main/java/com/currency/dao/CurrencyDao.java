package com.currency.dao;

import com.currency.model.Currency;

import java.util.List;

public interface CurrencyDao {
    void save(Currency currency);


    List<Currency> getAllByPagination(int currentPage, int total);

    List<Currency> filterByKeyword(String keyword);


}
