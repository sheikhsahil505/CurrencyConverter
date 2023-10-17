<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.currency.model.Currency" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration List</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Add custom CSS styles here */
        body {
            background-color: #f2f2f2;
        }
        .container {
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
    <div class="container mt-5">
        <h2 class="text-center">Currency History</h2>
        <div class="table-responsive" id="adminTable">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>S.No.</th>
                        <th>Amount</th>
                        <th>Converted Amount</th>
                        <th>Date</th>
                        <th>Exchange Rate</th>
                        <th>From Currency</th>
                        <th>To Currency</th>
                        <th>Time Stamp</th>
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
