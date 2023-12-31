package com.currency.model;



import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Date;

@Entity
@Table(name = "currency_history")
public class Currency {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "amount")
    @Pattern(regexp = "^[0-9.]*$", message = "validation.amount.backend")
    private String amount;


    @Column(name = "converted_amount")
    private String convertedAmount;

    @Column(name = "date")
    @PastOrPresent(message = "validation.date.backend")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;


    @Column(name = "exchange_rate")
    private String exchangeRate;

    @Column(name = "from_currency")
    @Pattern(regexp = "^(USD|INR|EUR|SAR|CNY|KWD|MYR|NPR|NZD|TJS|VND|MXN|ZAR)$",message ="validation.currency.backend")
    private String fromCurrency;

    @Column(name = "to_currency")
    @Pattern(regexp = "^(USD|INR|EUR|SAR|CNY|KWD|MYR|NPR|NZD|TJS|VND|MXN|ZAR)$",message ="validation.currency.backend" )
    private String toCurrency;
    @Column(name = "time_stamp")
    private String timeStamp;

    public String getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getConvertedAmount() {
        return convertedAmount;
    }

    public void setConvertedAmount(String convertedAmount) {
        this.convertedAmount = convertedAmount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getExchangeRate() {
        return exchangeRate;
    }

    public void setExchangeRate(String exchangeRate) {
        this.exchangeRate = exchangeRate;
    }

    public String getFromCurrency() {
        return fromCurrency;
    }

    public void setFromCurrency(String fromCurrency) {
        this.fromCurrency = fromCurrency;
    }

    public String getToCurrency() {
        return toCurrency;
    }

    public void setToCurrency(String toCurrency) {
        this.toCurrency = toCurrency;
    }

    public Currency() {
    }

    public Currency(Long id, String amount, String convertedAmount, Date date, String exchangeRate, String fromCurrency, String toCurrency, String timeStamp) {
        this.id = id;
        this.amount = amount;
        this.convertedAmount = convertedAmount;
        this.date = date;
        this.exchangeRate = exchangeRate;
        this.fromCurrency = fromCurrency;
        this.toCurrency = toCurrency;
        this.timeStamp = timeStamp;
    }
}

