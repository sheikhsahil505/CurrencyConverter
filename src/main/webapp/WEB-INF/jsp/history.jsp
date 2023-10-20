<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.List" %>
<%@ page import="com.currency.model.Currency" %>
<!DOCTYPE html>
<html>
<head>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
 <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>


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
   <form action="history" method="get" >

    <div class="container mt-5"  id="container">
        <h2 class="text-center"><spring:message code="history.header"/></h2>
        <div class="table-responsive" id="adminTable">
            <table class="table table-striped table-bordered" id="mytable">
                <thead class="thead-dark">
                    <tr>
                        <th><spring:message code="history.s.no"/></th>
                       <th><a href="amount"><spring:message code="history.amount"/></a></th>
                       <th><a href="converted_amount"><spring:message code="history.convertedAmount"/></a></th>
                        <th><a href="date"><spring:message code="history.date"/></a></th>
                        <th><a href="exchange_rate"><spring:message code="history.exchangeRate"/></a></th>
                        <th><a href="from_currency"><spring:message code="history.fromCurrency"/></a></th>
                        <th><a href="to_currency"><spring:message code="history.toCurrency"/></a></th>
                        <th><a href="time_stamp"><spring:message code="history.timestamp"/></a></th>
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
    </form>
   <div class="container mt-3 text-center">
       <!-- Pagination buttons -->
       <ul class="pagination">
           <li class="page-item">
               <a class="page-link" href="1">1</a>
           </li>
           <li class="page-item">
               <a class="page-link" href="2">2</a>
           </li>
           <li class="page-item">
               <a class="page-link" href="3">3</a>
           </li>
           <!-- Add more pages as needed -->
           <li class="page-item">
               <a class="page-link" href="next" id="nextPage"><spring:message code="history.next"/></a>
           </li>
       </ul>
   </div>



 <script>
  <!-- var table = $('#mytable').DataTable({
    "ordering": false
  });
-->
</script>




</body>
</html>
<%@ include file="footer.jsp"%>