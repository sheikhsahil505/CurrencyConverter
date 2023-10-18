<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar with Logo and Login/Signup</title>

    <!-- Include Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-o3h5VT1QCQvMB4S9fgyJPwx7df2b89D1XbvO8XzqSHTR6reQSSN2mpP8v5pDVIqHb" crossorigin="anonymous">

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
                   data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Language
                </a>
                <div class="dropdown-menu" aria-labelledby="languageDropdown">
                    <a class="dropdown-item" href="#">English</a>
                    <a class="dropdown-item" href="#">Hindi</a>
                    <a class="dropdown-item" href="#">Spanish</a>
                    <a class="dropdown-item" href="#">French</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<!-- Include Bootstrap 5 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

</body>
</html>
