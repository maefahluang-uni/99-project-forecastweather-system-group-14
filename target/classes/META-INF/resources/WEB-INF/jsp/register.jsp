<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

        /* Custom Tailwind CSS styles */
        .card {
            @apply bg-white p-6 rounded-lg shadow-md;
        }

        .form-label {
            @apply block text-gray-700 text-sm font-bold mb-2;
        }

        .form-control {
            @apply shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline;
        }

        .btn-primary {
            @apply bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline;
        }

        .nav-link {
            @apply text-blue-500 hover:text-blue-700;
        }

        /* Add other media queries as needed */

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
<br /><br /><br />
<div class="container">
    <div class="flex justify-center">
        <div class="w-full md:w-1/2">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center text-2xl font-bold mb-4">Registration</h2>
                </div>
                <div>
                    <c:if test="${not empty param.success}">
                        <div class="alert alert-info">
                            You have successfully registered our app!
                        </div>
                    </c:if>
                </div>
                <div class="card-body">
                    <form method="post" role="form" action="${pageContext.request.contextPath}/register/save">
                        <!-- ... (your form fields remain the same) ... -->
                        <div class="mb-4">
                            <label class="form-label">First Name</label>
                            <input class="form-control" id="firstName" name="firstName" placeholder="Enter first name" value="${user.firstName}" type="text" />
                            <span><c:out value="${request.getAttribute('user.firstName')}"/></span>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Last Name</label>
                            <input class="form-control" id="lastName" name="lastName" placeholder="Enter last name" value="${user.lastName}" type="text" />
                            <span><c:out value="${request.getAttribute('user.lastName')}"/></span>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Email</label>
                            <input class="form-control" id="email" name="email" placeholder="Enter email address" value="${user.email}" type="email" />
                            <span><c:out value="${request.getAttribute('user.email')}"/></span>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Password</label>
                            <input class="form-control" id="password" name="password" placeholder="Enter password" value="${user.password}" type="password" />
                            <span><c:out value="${request.getAttribute('user.password')}"/></span>
                        </div>

                        <div class="mb-4">
                            <div class="text-center"><br>
                                <button class="btn btn-primary mg-right" type="submit">Register</button><br>
                            </div>
                            <div class="text-center">
                                <span>Already registered?   <a class="nav-link active mg-right" aria-current="page" href="/login">Login</a></span>
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
</html>