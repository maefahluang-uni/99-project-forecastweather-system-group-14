<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
    <meta charset="ISO-8859-1">
    <title>Error Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .error-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="error-container">
        <h3 class="text-danger">Something went wrong! Please contact the maintenance team.</h3>
        <table class="table table-bordered mt-3">
            <tr>
                <td>Date</td>
                <td th:text="${timestamp}"></td>
            </tr>

            <tr>
                <td>Status</td>
                <td th:text="${status}"></td>
            </tr>

            <tr>
                <td>Error</td>
                <td th:text="${error}"></td>
            </tr>

            <tr>
                <td>Exception</td>
                <td th:text="${exception}"></td>
            </tr>

            <tr>
                <td>Trace</td>
                <td th:text="${trace}"></td>
            </tr>

            <tr>
                <td>Message</td>
                <td th:text="${message}"></td>
            </tr>

            <tr>
                <td>Path</td>
                <td th:text="${path}"></td>
            </tr>
        </table>
    </div>
</div><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
    <meta charset="ISO-8859-1">
    <title>Error Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .error-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="error-container">
        <h3 class="text-danger">Something went wrong! Please contact the maintenance team.</h3>
        <table class="table table-bordered mt-3">
            <tr>
                <td>Date</td>
                <td th:text="${timestamp}"></td>
            </tr>

            <tr>
                <td>Status</td>
                <td th:text="${status}"></td>
            </tr>

            <tr>
                <td>Error</td>
                <td th:text="${error}"></td>
            </tr>

            <tr>
                <td>Exception</td>
                <td th:text="${exception}"></td>
            </tr>

            <tr>
                <td>Trace</td>
                <td th:text="${trace}"></td>
            </tr>

            <tr>
                <td>Message</td>
                <td th:text="${message}"></td>
            </tr>

            <tr>
                <td>Path</td>
                <td th:text="${path}"></td>
            </tr>

            <tr>
                <td>Error Output Format</td>
                <td th:text="${errors}"></td>
            </tr>


        </table>
    </div>
</div>
</body>
</html>

</body>
</html>
