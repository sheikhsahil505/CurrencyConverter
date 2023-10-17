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

 .navbar-logo {
          height: auto;
            height: 50px;
            border-radius: 50px;
        }


        .navbar-nav .btn {
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 25px;
        }


    .navbar-dark {
        background-color: #343a40;
    }

    .navbar-nav .nav-link {
        color: #ffffff; /* White text color */
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

<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <!-- Change bg-light to bg-dark here -->
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand fw-bold" href="#">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRkCF5oiM_exhcpQGRbGXGzxu8jDLf_Sj0KQ&usqp=CAU" alt="Logo" class="navbar-logo">
   </a>
    </div>
     <div class="collapse navbar-collapse pr-5" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <!-- Language Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="languageDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Language
                        </a>
                        <div class="dropdown-menu" aria-labelledby="languageDropdown">
                            <a class="dropdown-item" href="#">English</a>
                            <a class "dropdown-item" href="#">Hindi</a>
                            <a class="dropdown-item" href="#">Spanish</a>
                            <a class="dropdown-item" href="#">French</a>
                        </div>
                    </li>
                </ul>
            </div>
</nav>
<div class="container mt-3" id="container">
    <form action="convert" method="post" class="col-md-6 mx-auto p-2 rounded" style="background-color: #f8f9fa;">
        <div class="form-group">
            <label for="fromCurrency">From Currency:</label>
            <select class="form-control" name="fromCurrency" id="from">
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
            <input class="form-control" type="text" name="amount" id="amount" placeholder="Enter amount" required/>
            <p id="amountError" class="text-danger"></p>
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
            <input type="date" class="form-control" name="date" id="datePicker" required>
        </div>
        <div class="form-group">
            <label for="result">Result:</label>
            <%
                String result = (String) request.getAttribute("result");
                if (result != null) {
            %>
            <input type="text" class="form-control" value="<%= result %>" readonly>
            <%
                } else {
            %>
            <input type="text" class="form-control" value="No result available"  readonly>
            <%
                }
            %>
        </div>
        <button type="submit" class="btn btn-success">Convert</button>
        <a type="button" href="history"class="btn btn-primary">History</a>
    </form>

    <div class="result mt-4">
        <!-- Result will be displayed here -->
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    var datePicker = document.getElementById("datePicker");
    var today = new Date();
    var oneDayAgo = new Date(today);
    oneDayAgo.setDate(today.getDate());
    var oneDayAgoFormatted = oneDayAgo.toISOString().split('T')[0];
    datePicker.setAttribute("max", oneDayAgoFormatted);
    const amountInput = document.getElementById("amount");
    const amountError = document.getElementById("amountError");

    amountInput.addEventListener("input", function() {
        const value = amountInput.value;
        // Define a regular expression pattern to allow only numbers
        const pattern = /^[0-9.]*$/;

        if (!pattern.test(value)) {
            amountError.textContent = "Only numbers are allowed.";
        } else {
            amountError.textContent = ""; // Clear the error message
        }
    });
</script>
<footer class="bg-dark text-light">
    <div class="container py-3">
        <div class="row">
            <div class="col-md-12 text-center">
                <p>&copy; 2023 Currency Converter. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
