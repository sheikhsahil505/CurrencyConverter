<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Currency Converter</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
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
    </style>
</head>
<body>
<div class="container mt-3">
    <h1 class="text-center">Currency Converter</h1>
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

<!-- Add Bootstrap JS and jQuery -->
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

</body>
</html>
