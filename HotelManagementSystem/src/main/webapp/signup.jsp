<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Custom Styles -->
    <style>
        .navbar {
            background-color: #2c3e50;
        }
        .navbar-brand {
            font-size: 24px;
            color: white;
        }
        .navbar-nav a {
            color: white !important;
        }
        .navbar-nav a:hover {
            background-color: #34495e;
        }
        .logo img {
            width: 100px;
            height: auto;
            margin-right: 10px;
        }
        .heading {
            font-size: 30px;
            font-weight: bold;
            color: #4CAF50;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .msg-box {
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
            background-color: #e7f5e7;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Hotel Management System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 form-container">
                <h2 class="text-center mb-4">Register</h2>

                <!-- Registration Form -->
                <form action="UserController" method="post" onsubmit="return validateForm(event)">
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="FullName" placeholder="Enter your name">
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="Email" placeholder="Enter your email">
                    </div>

                    <div class="mb-3">
                        <label for="country-code" class="form-label">Mobile Number</label>
                        <div class="input-group">
                            <select class="form-select" id="country-code" name="countryCode">
                                <option>Select Country Code</option>
                                <option value="+91">India (+91)</option>
                                <option value="+1">USA (+1)</option>
                                <option value="+44">UK (+44)</option>
                                <option value="+61">Australia (+61)</option>
                            </select>
                            <input type="text" class="form-control" id="phone" name="MobileNumber" placeholder="Enter your phone number">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="Address" placeholder="Enter your address">
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="Password" placeholder="Enter your password">
                    </div>

                    <div class="mb-3">
                        <label for="confirm-password" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirm-password" name="confirmPassword" placeholder="Confirm your password">
                    </div>

                    <!-- Buttons -->
                    <div class="mb-3">
                        <div class="d-flex justify-content-center gap-3">
                            <button type="submit" class="btn btn-success">Register</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </div>
                    </div>

                    <!-- Error and Success Messages -->
                    <div id="error-message" class="error-message mt-3 text-center text-danger"></div>
                    <div id="success-message" class="success-message mt-3 text-center text-success"></div>

                    <!-- Success Message after Registration -->
                    <%
                        Integer userId = (Integer) session.getAttribute("userId");
                        if (userId != null) {
                            session.removeAttribute("userId");
                    %>
                    <div class="msg-box">
                        Registration Successful! User ID: <%= userId %>
                    </div>
                    <%
                        }
                    %>

                </form>

                <!-- Login Link -->
                <div class="mt-3 text-center">
                    <p>Already have an account? <a href="login.jsp">Login here</a></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Dependencies -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <script>
        function validateForm(event) {
            document.getElementById('error-message').innerHTML = '';

            var mobile = document.getElementById("phone").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm-password").value;
            var errorMessage = "";

            if (mobile.length !== 10 || isNaN(mobile)) {
                errorMessage += "Mobile number must be exactly 10 digits.<br>";
            }

            var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordPattern.test(password)) {
                errorMessage += "Password must contain at least one uppercase letter, one lowercase letter, one number, one special character and be at least 8 characters long.<br>";
            }

            if (password !== confirmPassword) {
                errorMessage += "Passwords do not match.<br>";
            }

            if (errorMessage !== "") {
                document.getElementById('error-message').innerHTML = errorMessage;
                event.preventDefault();
                return false;
            }

            return true;
        }
    </script>

</body>
</html>
