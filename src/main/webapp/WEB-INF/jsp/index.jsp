<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.currency.model.Currency" %>
<%@ page import="org.springframework.validation.ObjectError" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Currency Converter</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <style>

label{
font-weight:bold;
}

                #container {
                    background-color: #fff;
                    border-radius: 50px;
                    padding: 20px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }
                h1 {
                    color: #007BFF;
                }
                .form-group {
                    margin-bottom: 20px;
                }
                .text-danger {
                    color: #FF0000;
                }
                .result {
                    margin-top: 20px;
                }



    footer {
                   background-color: #343a40;
                   color: #ffffff;
               }


        @media (max-width: 576px) {
            .navbar-logo {
             height:auto;
                max-width: 60%;
            }
        }
 @media (max-width: 476px) {
            .navbar-logo {
            height:auto;
                max-width: 40%;
            }
        }

    </style>
</head>
<body>

<% List<Currency> result = (List<Currency>) request.getAttribute("result");
%>
<div class="container mt-3" id="container">
    <form action="convert" method="post" class="col-md-6 mx-auto p-2 rounded" style="background-color: #f8f9fa;" id="myForm">
        <div class="form-group">
            <label for="fromCurrency">From Currency:</label>
            <select class="form-control" name="fromCurrency" id="from">
            <% if (result!= null){
                 for (Currency currency : result) { %>
                        <%if (currency.getFromCurrency() != null) {%>
                         <option value="<%= currency.getFromCurrency()%>"><%= currency.getFromCurrency()%></option>
                        <%}
                        } }%>
                <option value="INR">🇮🇳&emsp;Indian Rupee (INR)</option>
                   <option value="USD">🇺🇸&emsp;US Dollar (USD)</option>
                   <option value="EUR">🇪🇺&emsp;Euro (EUR)</option>
                   <option value="CNY">🇨🇳&emsp;Chinese Yuan (CNY)</option>
                   <option value="KWD">🇰🇼&emsp;Kuwaiti Dinar (KWD)</option>
                   <option value="MYR">🇲🇾&emsp;Malaysian Ringgit (MYR)</option>
                   <option value="NPR">🇳🇵&emsp;Nepalese Rupee (NPR)</option>
                   <option value="NZD">🇳🇿&emsp;New Zealand Dollar (NZD)</option>
                   <option value="TJS">🇹🇯&emsp;Tajikistani Somoni (TJS)</option>
                   <option value="VND">🇻🇳&emsp;Vietnamese Dong (VND)</option>
                   <option value="MXN">🇲🇽&emsp;Mexican Peso (MXN)</option>
                   <option value="ZAR">🇿🇦&emsp;South African Rand (ZAR)</option>
            </select>
        </div>

        <div class="form-group">
            <label for="toCurrency">To Currency:</label>
            <select class="form-control" name="toCurrency" id="to">
             <% if (result!= null){
                             for (Currency currency : result) { %>
                                    <%if (currency.getToCurrency() != null) {%>
                                     <option value="<%= currency.getToCurrency()%>"><%= currency.getToCurrency()%></option>
                                    <%}
                                    } }%>
                    <option value="USD">🇺🇸&emsp;US Dollar (USD)</option>
                                   <option value="INR">🇮🇳&emsp;Indian Rupee (INR)</option>
                                   <option value="EUR">🇪🇺&emsp;Euro (EUR)</option>
                                   <option value="CNY">🇨🇳&emsp;Chinese Yuan (CNY)</option>
                                   <option value="KWD">🇰🇼&emsp;Kuwaiti Dinar (KWD)</option>
                                   <option value="MYR">🇲🇾&emsp;Malaysian Ringgit (MYR)</option>
                                   <option value="NPR">🇳🇵&emsp;Nepalese Rupee (NPR)</option>
                                   <option value="NZD">🇳🇿&emsp;New Zealand Dollar (NZD)</option>
                                   <option value="TJS">🇹🇯&emsp;Tajikistani Somoni (TJS)</option>
                                   <option value="VND">🇻🇳&emsp;Vietnamese Dong (VND)</option>
                                   <option value="MXN">🇲🇽&emsp;Mexican Peso (MXN)</option>
                                   <option value="ZAR">🇿🇦&emsp;South African Rand (ZAR)</option>
            </select>
        </div>
        <div class="form-group">
            <label for="amount">Amount:</label>
               <% if (result!= null){
                                         for (Currency currency : result) { %>
                                                <%if (currency.getAmount() != null) {%>
                                                <input class="form-control" type="text" name="amount" id="amount" value="<%=currency.getAmount()%>" placeholder="Enter amount" required/>
                                                           <%}
                                                } }else{%>
            <input class="form-control" type="text" name="amount" id="amount" placeholder="Enter amount" required/>
            <p id="amountError" class="text-danger"></p>
            <%}%>
        </div>

<% List<ObjectError> errors = (List<ObjectError>) request.getAttribute("ErrorFromBackend");
if (errors != null) { %>
    <ul class="error-list">
        <%
        for (ObjectError error : errors) { %>
            <li><%=error.getDefaultMessage()%></li>
        <%
        } %>
    </ul>
    <%
}
%>




        <div class="form-group">
            <label for="date">Date:</label>
            <% if (result!= null){
             for (Currency currency : result) { %>
              <%if (currency.getDate() != null) {%>
              <input type="date" class="form-control" name="date" id="datePicker" value ="<%=currency.getDate()%>" required>
               <%}
                        } }else{%>
            <input type="date" class="form-control" name="date" id="datePicker" required>
            <%}%>
        </div>




        <div class="form-group">
            <label for="result">Result:</label>
           <% if (result!= null){
                        for (Currency currency : result) { %>

            <%
                if (currency.getConvertedAmount() != null) {
            %>
            <input type="text" class="form-control" value="<%= currency.getConvertedAmount() %>" readonly>
            <%
                } else {
            %>
            <input type="text" class="form-control" value="No result available"  readonly>
            <%
                }
            } }%>
        </div>
        <button type="submit" class="btn btn-success">Convert</button>
        <a type="button" href="history"class="btn btn-primary">History</a>
    </form>

   <div id="resultDiv" class="result mt-4">
       <!-- Result will be displayed here -->
   </div>

</div>


<script>
    var datePicker = document.getElementById("datePicker");
    var today = new Date();
    var oneDayAgo = new Date(today);
    oneDayAgo.setDate(today.getDate());
    var oneDayAgoFormatted = oneDayAgo.toISOString().split('T')[0];
    datePicker.setAttribute("max", oneDayAgoFormatted);
    const amountInput = document.getElementById("amount");
    const amountError = document.getElementById("amountError");


      function ValidateContact() {
          const amountInput = document.getElementById("amount"); // Assuming you have an element with id "amount"
          const amountError = document.getElementById("amountError"); // Assuming you have an element with id "amountError"

          const value = amountInput.value;
          const pattern = /^[0-9.]*$/;

          if (!pattern.test(value)) {
              amountError.textContent = "Only numbers are allowed.";
              return false; // Return false if validation fails
          } else {
              amountError.textContent = ""; // Clear the error message
              return true; // Return true if validation passes
          }
      }

      function validateForm(event) {
          if (!ValidateContact()) {
              alert("Please enter a valid amount");
              event.preventDefault();
              return false;
          }
          return true;
      }

      document.querySelector("form").addEventListener("submit", validateForm);



</script>
</body>
</html>
<%@ include file="footer.jsp"%>