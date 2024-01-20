<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Registration and Login System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Your custom CSS -->

    <style>
        @media only screen and (max-width: 480px) {
            body {
                /* Adjust styles for screens up to 480px width */
            }
        }

        @media only screen and (min-width: 481px) and (max-width: 767px) {
            /* Styles for screens between 481px and 767px width */
        }

        @media only screen and (min-width: 768px) and (max-width: 991px) {
            /* Styles for screens between 768px and 991px width */
        }

        @media only screen and (min-width: 992px) and (max-width: 1199px) {
            /* Styles for screens between 992px and 1199px width */
        }

        @media only screen and (min-width: 1200px) and (max-width: 1399px) {
            /* Styles for screens between 1200px and 1399px width */
        }

        @media only screen and (min-width: 1400px) and (max-width: 1799px) {
            /* Styles for screens between 1400px and 1799px width */
        }

        @media only screen and (min-width: 1800px) {
            /* Styles for screens larger than 1800px width */
        }

        @media only screen and (min-width: 2560px) {
            /* Styles for 4K resolution screens */
        }

        body {
            background-image: url('/img/mian login 2 3.png');
            background-size: cover;
            background-repeat: no-repeat;
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">
        <img src="/img/img.png" alt="Logo">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/register">Sign Up</a>
            </li>
        </ul>
    </div>
</nav>
<br/><br/>
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <!-- Display error message if present -->
            <div class="text-center">
                <c:if test="${param.error}">
                    <div class="alert alert-danger">
                        Invalid Email or Password
                    </div>
                </c:if>
            </div>

            <!-- Display logout message if present -->
            <div class="text-center">
                <c:if test="${param.logout}">
                    <div class="alert alert-success">
                        You have been logged out.
                    </div>
                </c:if>
            </div>

            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">Login Form</h2>
                </div>
                <div class="card-body">
                    <form method="post" role="form" action="/login" th:action="@{/login}"
                          class="form-horizontal">

                        <!--User input box-->
                        <div class="form-group mb-3">
                            <label class="control-label"> Email</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <input class="form-control" id="username" type="username" name="username"
                                       placeholder="Enter email address" value="${user.email}"/>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label class="control-label"> Password</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                </div>
                                <input class="form-control" id="password" name="password" type="password"
                                       placeholder="Enter password" value="${user.password}"/>
                                <div class="input-group-append">
            <span class="input-group-text">
                <i class="fas fa-eye" onclick="togglePassword()"></i>
            </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="text-center">
                                <br>
                                <button type="submit" class="btn btn-primary mg-right">Submit</button>
                                <br>
                            </div> <br>

                            <div class="text-center"> <!-- Center the content -->
                                <span> <a href="/forgot_password">Forgot your password?</a></span>
                            </div> <br>
                            <div class="text-center">
                                <!-- Center the content -->
                                <span>Not registered? <a class="nav-link active mg-right" aria-current="page"
                                                         href="/register">Sign Up</a></span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!-- Include Bootstrap JS and dependencies (Popper.js and jQuery) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
    }
</script>
</html>
