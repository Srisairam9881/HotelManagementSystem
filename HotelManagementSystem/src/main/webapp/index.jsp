<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Hotel Management</title>
    <link rel="stylesheet" href="styles.css">
<style type="text/css">
/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

/* Navbar */
.navbar {
    background-color: #333;
    color: white;
    padding: 15px 0;
    text-align: center;
}

.navbar .logo {
    font-size: 24px;
    font-weight: bold;
}

/* Main Content Section */
.main-content {
    text-align: center;
    flex-grow: 1; /* Makes the section grow to fill available space */
    padding: 20px;
}

.main-content h1 {
    font-size: 32px;
    margin-bottom: 20px;
}

.main-content p {
    font-size: 18px;
    margin-bottom: 40px;
}

/* Buttons */
.button-container {
    display: flex;
    justify-content: center;
    gap: 20px; /* Add space between buttons */
}

.btn {
    text-decoration: none;
    background-color: #4CAF50;
    color: white;
    padding: 15px 30px;
    border-radius: 5px;
    font-size: 18px;
    transition: background-color 0.3s ease;
    text-align: center;
}

.btn:hover {
    background-color: #45a049;
}

/* Footer */
footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 20px;
}

</style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">Hotel Management</div>
    </div>

    <!-- Main Content Section -->
    <div class="main-content">
        <h1>Welcome to the Hotel Management System</h1>
        <p>Please choose an option to proceed:</p>
        
        <!-- Centered Buttons -->
        <div class="button-container">
            <a href="login.jsp" class="btn">Login</a>
            <a href="signup.jsp" class="btn">Sign Up</a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Hotel Management System © 2025</p>
    </footer>
</body>
</html>
