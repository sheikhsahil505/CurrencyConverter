package com.currency.util;

import com.currency.model.Currency;

import java.util.List;

public interface ConvertCurrency {
      List<Currency> convertAmount(Currency currency);
}
