<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
            <label for="fromCurrency"><spring:message code="label.fromCurrency"/></label>
            <select class="form-control" name="fromCurrency" id="from">
            <% if (result!= null){
                 for (Currency currency : result) { %>
                        <%if (currency.getFromCurrency() != null) {%>
                         <option value="<%= currency.getFromCurrency()%>"><%= currency.getFromCurrency()%></option>
                        <%}
                        } }%>
                   <option value="INR">🇮🇳&emsp; INR</option>
                   <option value="USD">🇺🇸&emsp; USD</option>
                   <option value="EUR">🇪🇺&emsp; EUR</option>
                   <option value="CNY">🇨🇳&emsp; CNY</option>
                   <option value="KWD">🇰🇼&emsp; KWD</option>
                   <option value="MYR">🇲🇾&emsp; MYR</option>
                   <option value="NPR">🇳🇵&emsp; NPR</option>
                   <option value="NZD">🇳🇿&emsp; NZD</option>
                   <option value="TJS">🇹🇯&emsp; TJS</option>
                   <option value="VND">🇻🇳&emsp; VND</option>
                   <option value="MXN">🇲🇽&emsp; MXN</option>
                   <option value="ZAR">🇿🇦&emsp; ZAR</option>
            </select>
        </div>

        <div class="form-group">
            <label for="toCurrency"><spring:message code="label.toCurrency"/></label>
                <select class="form-control" name="toCurrency" id="to">
                 <% if (result!= null){
                                 for (Currency currency : result) { %>
                                        <%if (currency.getToCurrency() != null) {%>
                                         <option value="<%= currency.getToCurrency()%>"><%= currency.getToCurrency()%></option>
                                        <%}
                                        } }%>
                                                    <option value="USD">🇺🇸&emsp;  USD</option>
                                                    <option value="INR">🇮🇳&emsp; INR</option>
                                                         <option value="EUR">🇪🇺&emsp; EUR</option>
                                                         <option value="CNY">🇨🇳&emsp; CNY</option>
                                                         <option value="KWD">🇰🇼&emsp; KWD</option>
                                                         <option value="MYR">🇲🇾&emsp; MYR</option>
                                                         <option value="NPR">🇳🇵&emsp; NPR</option>
                                                         <option value="NZD">🇳🇿&emsp; NZD</option>
                                                         <option value="TJS">🇹🇯&emsp; TJS</option>
                                                         <option value="VND">🇻🇳&emsp; VND</option>
                                                         <option value="MXN">🇲🇽&emsp; MXN</option>
                                                         <option value="ZAR">🇿🇦&emsp; ZAR</option>
                </select>
        </div>
        <div class="form-group">
            <label for="amount"><spring:message code="label.amount"/></label>
               <% if (result!= null){
                                         for (Currency currency : result) { %>
                                                <%if (currency.getAmount() != null) {%>
                                                <input class="form-control" type="text" name="amount" id="amount" value="<%=currency.getAmount()%>" placeholder="Enter amount" required/>
                                                           <%}
                                                } }else{%>
            <input class="form-control" type="text" name="amount" id="amount" placeholder="<spring:message code="label.amountPlaceholder"/>" required/>
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
            <label for="date"><spring:message code="label.date"/></label>
            <% if (result!= null){
             for (Currency currency : result) { %>
              <%if (currency.getDate() != null) {%>
              <input type="date" class="form-control" name="date" id="datePicker" value ="<%=currency.getDate()%>" required>
               <%}
                        } }else{%>
          <input type="date" class="form-control" name="date" id="datePicker" required value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">

            <%}%>
        </div>

        <div class="form-group">
            <label for="result"><spring:message code="label.result"/></label>
           <% if (result!= null){
                        for (Currency currency : result) { %>

            <%
                if (currency.getConvertedAmount() != null) {
            %>
            <input type="text" class="form-control" value="<%= currency.getConvertedAmount() %>" readonly>
            <%
                }
            } }%>
        </div>
        <button type="submit" class="btn btn-success"><spring:message code="convert.btn"/></button>
       <form action ="history"  >
       <input type="hidden" value="1" name ="pageNo">
        <a type="button" href="history/1"class="btn btn-primary"><spring:message code="history.btn"/></a>
    </form>
    </form>

   <div id="resultDiv" class="result mt-4">
       <!-- Result will be displayed here -->
   </div>

</div>


<script>

 var datePicker = document.getElementById("datePicker");
    var today = new Date();
    var todayFormatted = today.toISOString().split('T')[0];
    datePicker.setAttribute("max", todayFormatted);

    const amountInput = document.getElementById("amount");
    const amountError = document.getElementById("amountError");

      function ValidateAmount() {
          const amountInput = document.getElementById("amount"); // Assuming you have an element with id "amount"
          const amountError = document.getElementById("amountError"); // Assuming you have an element with id "amountError"

          const value = amountInput.value;
          const pattern = /^[0-9.]*$/;

          if (!pattern.test(value)) {
              amountError.textContent = "<spring:message code="amount.error"/>";
              return false; // Return false if validation fails
          } else {
              amountError.textContent = ""; // Clear the error message
              return true; // Return true if validation passes
          }
      }

      function validateForm(event) {
          if (!ValidateAmount()) {
              alert("<spring:message code="amount.error"/>");
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