package com.currency.util;


import com.currency.model.Currency;
import com.currency.service.CurrencyService;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
@Configuration
@PropertySource("classpath:application.properties")
public class ConvertCurrencyImpl implements ConvertCurrency{
    @Autowired
    private CurrencyService currencyService;
    @Value("${api.key}")
    private String apiKey;

    @Override
    public List<Currency> convertAmount(Currency currency) {
        List<Currency> list = new ArrayList<>();
        String amount = currency.getAmount();
        String to = currency.getToCurrency();
        Date date1 = currency.getDate();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = dateFormat.format(date1);


        String from = currency.getFromCurrency();
        String result = null;
        String exchangeRate = null;
       try {
           OkHttpClient client = new OkHttpClient.Builder()
                   .readTimeout(100, TimeUnit.SECONDS)
                   .connectTimeout(10, TimeUnit.SECONDS)
                   .build();

           Request request = new Request.Builder()
                   .url("https://api.apilayer.com/fixer/convert?" +
                           "to=" + to +
                           "&from=" + from +
                           "&amount=" + amount +
                           "&date=" + date)
                   .addHeader("apikey", apiKey)
                   .get()
                   .build();

           Response response = client.newCall(request).execute();

           String responseBody = response.body().string();


           JsonParser jsonParser = new JsonParser();
           JsonElement jsonElement = jsonParser.parse(responseBody);

           if (jsonElement.isJsonObject()) {
               JsonObject jsonObject = jsonElement.getAsJsonObject();
               if (jsonObject.has("result")) {
                   result = jsonObject.get("result").getAsString();
               }
               if (jsonObject.has("info") && jsonObject.get("info").isJsonObject()) {
                   JsonObject infoObject = jsonObject.getAsJsonObject("info");
                   exchangeRate = infoObject.get("rate").getAsString();
                   currency.setConvertedAmount(result);
                   currency.setExchangeRate(exchangeRate);
                   LocalDateTime currentDateTime = LocalDateTime.now().withNano(0);
                   currency.setTimeStamp(String.valueOf(currentDateTime));
                   currencyService.save(currency);
               }
           }


       }catch (Exception e){
           e.printStackTrace();
       }
       list.add(currency);
        return list;
    }

}
