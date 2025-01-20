<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">Hotel Management</div>
    </div>

    <!-- Login Form -->
    <div class="form-container">
        <h2>Login</h2>
        <form action="LoginController" method="post">
            <div class="input-group">
                <label for="userId">User ID</label>
                <input type="number" class="input-field" name="userId" placeholder="Enter your user id" required>
            </div>
            <div class="input-group">
                <label for="Password">Password</label>
                <input type="password" class="input-field" name="Password" placeholder="Enter your password" required>
            </div>
            <div class="button-container">
                <button type="submit" class="btn">Login</button>
            </div>

            <!-- Error Message -->
            <div class="error-message">
                <% 
                    String errorMsg = (String) request.getAttribute("error");
                    if (errorMsg != null) { 
                %>
                    <%= errorMsg %>
                <% 
                    } 
                %>
            </div>
        </form>
        <div class="text-center">
            <p>New user? <a href="signup.jsp">Register here</a></p>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>Hotel Management System © 2025</p>
    </footer>
</body>
</html>
