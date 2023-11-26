<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <!-- Include your other CSS and head elements -->
    <style>
        body {
            background-image: url('/img/mian_login_2_3.png'); /* Adjust the path accordingly */
            background-size: cover;
            background-repeat: no-repeat;
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #ffffff; /* Set background color for the header */
        }

        nav {
            padding: 1rem;
        }

        .navbar-brand img {
            max-width: 100px; /* Adjust the maximum width of the logo */
        }

        .navbar-toggler-icon {
            background-color: #000000; /* Set the color of the toggler icon */
        }

        .navbar-nav {
            margin-left: auto;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8); /* Set a semi-transparent white background for the content */
            border-radius: 8px;
            padding: 20px;
        }
    </style>
</head>
<body>
<header>
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
                    <a class="nav-link active" aria-current="page" href="<c:url value="/logout" />">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<div class="container mx-auto mt-8 p-8">
    <h2 class="text-2xl font-bold mb-4">Account Settings</h2>

    <c:if test="${not empty emailError}">
        <div class="alert alert-danger" role="alert">
                ${emailError}
        </div>
    </c:if>

    <!-- ... (previous code) ... -->

    <table class="table table-striped table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
        </tr>
        </thead>
        <tbody>
        <tr th:each="user: ${users}">
            <td th:text="${user.firstName}"></td>
            <td th:text="${user.lastName}"></td>
            <td th:text="${user.email}"></td>
        </tr>
        </tbody>
    </table>

    <!-- ... (remaining code) ... -->


    <form action="${pageContext.request.contextPath}/updateUsername" method="post" class="mb-8">
        <label for="newUsername" class="block text-sm font-medium text-gray-600">Current Email: ${currentUser.email}</label>
        <input type="text" id="newUsername" name="newEmail" required class="mt-1 p-2 border rounded-md w-full">
        <button type="submit" class="mt-2 px-4 py-2 bg-blue-500 text-white rounded-md">Update Username[email]</button>
    </form>

    <form action="${pageContext.request.contextPath}/updatePassword" method="post" class="mb-8">
        <label for="newPassword" class="block text-sm font-medium text-gray-600">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required class="mt-1 p-2 border rounded-md w-full">
        <button type="submit" class="mt-2 px-4 py-2 bg-blue-500 text-white rounded-md">Update Password</button>
    </form>

    <form action="${pageContext.request.contextPath}/deleteAccount" method="post" class="mb-8">
        <button type="submit" class="mt-2 px-4 py-2 bg-red-500 text-white rounded-md">Delete Account</button>
    </form>
</div>

<!-- Include your footer, scripts, etc. -->
</body>
</html>
