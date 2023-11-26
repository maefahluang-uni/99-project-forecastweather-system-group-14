<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            margin-top: 20px;
            color: #bcd0f7;
            background: #1A233A;
        }

        .account-settings .user-profile {
            text-align: center;
        }

        .account-settings .user-profile .user-avatar img {
            width: 90px;
            height: 90px;
            border-radius: 50%;
        }

        .account-settings .about {
            margin: 1rem 0 0 0;
            font-size: 0.8rem;
            text-align: center;
        }

        .card {
            background: #272E48;
            border-radius: 5px;
            border: 0;
            margin-bottom: 1rem;
        }

        .form-control {
            border: 1px solid #596280;
            border-radius: 2px;
            font-size: .825rem;
            background: #1A233A;
            color: #bcd0f7;
        }

        /* Adjustments for responsiveness */
        @media (max-width: 768px) {
            .gutters {
                margin-right: 0;
                margin-left: 0;
            }
        }
    </style>
</head>

<body>
<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Account Setting</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Tailwind Container -->
<div class="container mx-auto p-4">
    <!-- Bootstrap Card -->
    <div class="row gutters">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <!-- Tailwind Forms -->
                    <form action="${pageContext.request.contextPath}/updateUsernameWithEmailCheck" method="post" class="mb-8">
                        <label for="newEmail" class="block text-sm font-medium text-gray-600">Current Email: ${currentUser.email}</label>
                        <input type="text" id="newEmail" name="newEmail" required class="mt-1 p-2 border rounded-md w-full">
                        <button type="submit" class="mt-2 px-4 py-2 bg-blue-500 text-white rounded-md">Update Email</button>
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
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
