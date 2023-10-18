package com.currency.service;

import com.currency.dao.CurrencyDao;
import com.currency.model.Currency;
import com.currency.util.ConvertCurrency;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CurrencyServiceImpl implements CurrencyService{
@Autowired
private ConvertCurrency convertCurrency;
@Autowired
    private CurrencyDao currencyDao;
    @Override
    public List<Currency> convertAmount(Currency currency) {
     return this.convertCurrency.convertAmount(currency);
    }

    @Override
    public void save(Currency currency) {
        currencyDao.save(currency);
    }

    @Override
    public List<Currency> getAll() {
        return  this.currencyDao.getAll();
    }
}
