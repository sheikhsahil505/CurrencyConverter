<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.List" %>
<%@ page import="com.currency.model.Currency" %>
<!DOCTYPE html>
<html>
<head>

    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Add custom CSS styles here */
        body {
            background-color: #f2f2f2;
        }
        #container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #007bff;
        }
        .table {
            background-color: #fff;
        }
        .table th, .table td {
            border: 1px solid #dee2e6;
        }
    </style>
</head>
<body>
    <div class="container mt-5"  id="container">
        <h2 class="text-center"><spring:message code="history.header"/></h2>
        <div class="table-responsive" id="adminTable">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th><spring:message code="history.s.no"/></th>
                        <th><spring:message code="history.amount"/></th>
                        <th><spring:message code="history.convertedAmount"/></th>
                        <th><spring:message code="history.date"/></th>
                        <th><spring:message code="history.exchangeRate"/></th>
                        <th><spring:message code="history.fromCurrency"/></th>
                        <th><spring:message code="history.toCurrency"/></th>
                        <th><spring:message code="history.timestamp"/></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Currency> result = (List<Currency>) request.getAttribute("result");
                        if (result != null) {
                            int count = 1;
                            for (Currency currency : result) {
                    %>
                    <tr>
                        <td><%= count++ %></td>
                        <td><%= currency.getAmount() %></td>
                        <td><%= currency.getConvertedAmount() %></td>
                        <td><%= currency.getDate() %></td>
                        <td><%= currency.getExchangeRate() %></td>
                        <td><%= currency.getFromCurrency() %></td>
                        <td><%= currency.getToCurrency() %></td>
                        <td><%= currency.getTimeStamp() %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
<%@ include file="footer.jsp"%>