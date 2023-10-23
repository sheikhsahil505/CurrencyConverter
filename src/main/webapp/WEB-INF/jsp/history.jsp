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
 <div class="container mt-5" id="container">
     <div class="row">
         <div class="col">
             <h2 class="text-center">
                 <spring:message code="history.header" />
             </h2>
         </div>
         <div class="col">
         <form action ="search" method="get">
             <div class="input-group">
                 <input type="text" class="form-control" name="keyword" placeholder="<spring:message code="history.search.placeholder"/>" aria-label="Search" aria-describedby="searchButton">
                 <div class="input-group-append">
                     <button class="btn btn-primary" type="submit" id="searchButton"><spring:message code="history.search"/></button>
                 </div>
             </div>
             </form>
         </div>
     </div>

       <div class="table-responsive" id="adminTable">
           <table class="table table-striped table-bordered" id="mytable">
               <thead class="thead-dark">
                   <tr>
                       <th><spring:message code="history.s.no" /></th>
                       <th><spring:message code="history.amount" /></th>
                       <th><spring:message code="history.convertedAmount" /></th>
                       <th><spring:message code="history.date" /></th>
                       <th><spring:message code="history.exchangeRate" /></th>
                       <th><spring:message code="history.fromCurrency" /></th>
                       <th><spring:message code="history.toCurrency" /></th>
                       <th><spring:message code="history.timestamp" /></th>
                   </tr>
               </thead>
               <tbody>
                   <%
                       List<Currency> result = (List<Currency>) request.getAttribute("result");
                       if (result != null && !result.isEmpty()) {
                           int count = 1;
                           for (Currency currency : result) {
                       %>
                       <tr>
                           <td><%= currency.getId() %></td>
                           <td><%= currency.getAmount() %></td>
                           <td><%= currency.getConvertedAmount() %></td>
                           <td><%= currency.getDate() %></td>
                           <td><%= currency.getExchangeRate() %></td>
                           <td><%= currency.getFromCurrency() %></td>
                           <td><%= currency.getToCurrency() %></td>
                           <td><%= currency.getTimeStamp() %></td>
                       <%
                           }
                       } else {
                       %>
                       <tr>
                           <td colspan="8" class="text-center"><spring:message code="history.no-data-found" /></td>
                       </tr>
                       <%
                       }
                   %>
               </tbody>
           </table>
       </div>

<div class="container mt-3">
    <form action="pagination" method="GET" class="row" id="paginationForm">
        <div class="form-group col-md-3">
            <label for="pageSize"><spring:message code="history.pageSize"/></label>
            <input type="number" id="pageSize" name="pageSize" class="form-control" value="10">
        </div>
        <div class="form-group col-md-3">
            <label for="pageNo"><spring:message code="history.pageNo"/></label>
            <select class="form-control" name="pageNo" id="pageNo" onchange="submitForm()">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="next">Next</option>
            </select>
        </div>
    </form>
</div>



   </div>

 <script>
  <!-- var table = $('#mytable').DataTable({
    "ordering": false
  });
-->
</script>


<script>
    function submitForm() {
        document.getElementById("paginationForm").submit();
    }
</script>


</body>
</html>
<%@ include file="footer.jsp"%>