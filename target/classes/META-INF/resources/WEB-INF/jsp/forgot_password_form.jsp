<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="..." crossorigin="anonymous">
    <title>Forgot Password</title>
</head>

<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h2 class="text-center">Forgot Password</h2>

                    <div c:if="${error != null}" class="alert alert-danger">
                        ${error}
                    </div>
                    <div c:if="${message != null}" class="alert alert-warning">
                        ${message}
                    </div>

                    <form th:action="@{/forgot_password}" method="post" style="max-width: 420px; margin: 0 auto;">
                        <div class="form-group">
                            <label for="email">Enter your e-mail</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Enter your e-mail" required autofocus/>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and jQuery (optional) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="..." crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="..." crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="..." crossorigin="anonymous"></script>
</body>

</html>
