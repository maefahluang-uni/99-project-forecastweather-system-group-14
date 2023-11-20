<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Registration</title>
</head>
<body>
<form action="register" method="post">
    <h1>User Registration</h1>
    <div class="form-group">
        <label>User name</label>
        <input type="text" name="username" class="form-control" id="employee" placeholder="Enter Name" required>
    </div>

    <div class="form-group">
        <label>email</label>
        <input type="email" name="email" class="form-control" id="email" placeholder="Enter Email" required>
    </div>

    <div class="form-group">
        <label>password</label>
        <input type="password" name="password" class="form-control" id="password" placeholder="Enter password" required>
    </div>

    <button type="submit" class="btn btn-primary mt-4">Save</button>
</form>
</body>
</html>