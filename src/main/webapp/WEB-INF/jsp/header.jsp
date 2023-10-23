<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="title"/></title>
 <style>
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
    </style>
     <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-o3h5VT1QCQvMB4S9fgyJPwx7df2b89D1XbvO8XzqSHTR6reQSSN2mpP8v5pDVIqHb" crossorigin="anonymous">
    </head>
    <body>

   <nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <!-- Change bg-light to bg-dark here -->
       <div class="container">
           <!-- Logo -->
           <a class="navbar-brand fw-bold" href="/Currency/?lang=en">
               <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRkCF5oiM_exhcpQGRbGXGzxu8jDLf_Sj0KQ&usqp=CAU" alt="Logo" class="navbar-logo">
           <spring:message code="logo-text"/></a>

  <ul class="navbar-nav">
             <li class="nav-item">
                 <a class="nav-link" href="history?lang=en">English</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="history?lang=fr">Français</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="history?lang=cn">中国人</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="history?lang=hi">हिंदी</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="history?lang=ar">عربي</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="history?lang=gj">ગુજરાતી</a>
             </li>
         </ul>

        </div>

    </nav>

    <!-- Include Bootstrap JavaScript (and other libraries) here if needed -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    </body>
    </html>