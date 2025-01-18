<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        /* Navbar Styling */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #4CAF50;
            padding: 10px 20px;
            color: white;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar .links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 16px;
        }

        .navbar .links a:hover {
            text-decoration: underline;
        }

        /* Login Form Styling */
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 100px auto;
        }

        h2 {
            text-align: center;
            color: #4CAF50;
        }

        .input-field {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        .register-link {
            text-align: center;
            margin-top: 10px;
        }

        .register-link a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="logo">Hotel Management System</div>
    <div class="links">
        <a href="login.jsp">Login</a>
        <a href="signup.jsp">Sign Up</a>
    </div>
</div>

<!-- Login Form -->
<div class="container">
    <h2>Login</h2>
    <form action="LoginController" method="post">
        <input type="number" name="userId" id="userid" class="input-field" placeholder="Enter your user id" required />
        <input type="password" name="Password" id="password" class="input-field" placeholder="Enter your password" required />
        <button class="button" type="submit">Login</button>

        <!-- Display error message if any -->
        <%
            String errorMsg = (String) request.getAttribute("error");
            if (errorMsg != null) {
        %>
            <div class="error-message"><%= errorMsg %></div>
        <%
            }
        %>

        <div class="register-link">
            <p>New user? <a href="signup.jsp">Register here</a></p>
        </div>
    </form>
</div>

</body>
</html>
