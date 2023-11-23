<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en"
      xmlns:th="http://www.thymeleaf.org"
>
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
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">
        <img src="/img/img.png" alt="Logo">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/login">Login</a>
            </li>
        </ul>
    </div>
</nav>
<br /><br /><br />
<div class="container">
    <div class="row col-md-8 offset-md-2">
        <div class="card">
            <div class="card-header">
                <h2 class="text-center">Registration</h2>
            </div>
            <div th:if="${param.success}">
                <div class="alert alert-info">
                    You have successfully registered our app!
                </div>
            </div>
            <div class="card-body">
                <form
                        method="post"
                        role="form"
                        th:action="@{/register/save}"
                        th:object="${user}"
                >
                    <div class="form-group mb-3">
                        <label class="form-label">First Name</label>
                        <input
                                class="form-control"
                                id="firstName"
                                name="firstName"
                                placeholder="Enter first name"
                                th:field="*{firstName}"
                                type="text"
                        />
                        <p th:errors = "*{firstName}" class="text-danger"
                           th:if="${fields.hasErrors('firstName')}"></p>
                    </div>

                    <div class="form-group mb-3">
                        <label class="form-label">Last Name</label>
                        <input
                                class="form-control"
                                id="lastName"
                                name="lastName"
                                placeholder="Enter last name"
                                th:field="*{lastName}"
                                type="text"
                        />
                        <p th:errors = "*{lastName}" class="text-danger"
                           th:if="${fields.hasErrors('lastName')}"></p>
                    </div>

                    <div class="form-group mb-3">
                        <label class="form-label">Email</label>
                        <input
                                class="form-control"
                                id="email"
                                name="email"
                                placeholder="Enter email address"
                                th:field="*{email}"
                                type="email"
                        />
                        <p th:errors = "*{email}" class="text-danger"
                           th:if="${fields.hasErrors('email')}"></p>
                    </div>

                    <div class="form-group mb-3">
                        <label class="form-label">Password</label>
                        <input
                                class="form-control"
                                id="password"
                                name="password"
                                placeholder="Enter password"
                                th:field="*{password}"
                                type="password"
                        />
                        <p th:errors = "*{password}" class="text-danger"
                           th:if="${fields.hasErrors('password')}"></p>
                    </div>
                    <form method="post" action="/your-registration-endpoint">
                        <!-- your form fields go here -->
                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Register</button>
                            <span>Already registered?   <a class="nav-link active" aria-current="page" href="/login">Login</a></span>
                        </div>
                    </form>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<!-- Include Bootstrap JS and dependencies (Popper.js and jQuery) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</html>