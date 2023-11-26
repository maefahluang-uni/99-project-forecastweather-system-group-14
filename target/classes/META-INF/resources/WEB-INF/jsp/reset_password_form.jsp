<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="..." crossorigin="anonymous">
    <title>Reset Your Password</title>
</head>

<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h2 class="text-center">Reset Your Password</h2>

                    <form th:action="@{/reset_password}" method="post" style="max-width: 350px; margin: 0 auto;">
                        <input type="hidden" name="token" th:value="${token}" />
                        <div class="border border-secondary rounded p-3">
                            <div class="form-group">
                                <input type="password" name="password" id="password" class="form-control"
                                       placeholder="Enter your new password" required autofocus />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Confirm your new password"
                                       required oninput="checkPasswordMatch(this);" />
                            </div>
                            <div class="text-center">
                                <input type="submit" value="Change Password" class="btn btn-primary" />
                            </div>
                        </div>
                    </form>

                    <script>
                        function checkPasswordMatch(fieldConfirmPassword) {
                            if (fieldConfirmPassword.value !== $("#password").val()) {
                                fieldConfirmPassword.setCustomValidity("Passwords do not match!");
                            } else {
                                fieldConfirmPassword.setCustomValidity("");
                            }
                        }

                        });
                    </script>
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
