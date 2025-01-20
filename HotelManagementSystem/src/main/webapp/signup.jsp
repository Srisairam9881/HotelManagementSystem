<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">Hotel Management</div>
    </div>

    <!-- Registration Form -->
    <div class="form-container">
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
        <h2>Customer Registration</h2>
        <form action="UserController" method="post" onsubmit="return validateForm(event)">
            <div class="input-group">
                <label for="FullName">Full Name</label>
                <input type="text" class="input-field" name="FullName" placeholder="Enter your full name" required>
            </div>
            <div class="input-group">
                <label for="Email">Email</label>
                <input type="email" class="input-field" name="Email" placeholder="Enter your email" required>
            </div>
            <div class="input-group">
                <label for="countryCode">Country Code</label>
                <select class="input-field" name="countryCode" required>
                    <option value="">Select Country Code</option>
                    <option value="+91">India (+91)</option>
                    <option value="+1">USA (+1)</option>
                    <option value="+44">UK (+44)</option>
                    <option value="+61">Australia (+61)</option>
                </select>
            </div>
            <div class="input-group">
                <label for="MobileNumber">Mobile Number</label>
                <input type="text" class="input-field" name="MobileNumber" placeholder="Enter your phone number" required>
            </div>
            <div class="input-group">
                <label for="Address">Address</label>
                <input type="text" class="input-field" name="Address" placeholder="Enter your address" required>
            </div>
            <div class="input-group">
                <label for="Password">Password</label>
                <input type="password" class="input-field" name="Password" placeholder="Enter your password" required>
            </div>
            <div class="input-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" class="input-field" name="confirmPassword" placeholder="Confirm your password" required>
            </div>
            <div class="button-container">
                <button type="submit" class="btn">Register</button>
                <button type="reset" class="btn">Reset</button>
            </div>
            
            <div id="error-message" class="error-message"></div>
            <div id="success-message" class="success-message"></div>
        </form>
        <div class="text-center">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>

    <footer>
        <p>Hotel Management System © 2025</p>
    </footer>
</body>
</html>
