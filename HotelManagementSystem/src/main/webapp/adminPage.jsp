<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page session="true" %>
<%@ page session="true" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || role == null || !role.equals("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Home Page</title>
    <link rel="stylesheet" type="text/css" href="styles/styles.css">
</head>
<body>
    <div class="navbar">
        <span class="hotel-name">Grand Stay Hotel</span>
        <a href="adminHomePage.jsp">Home</a>
        <a href="reservation.jsp">Reservation</a>
        <a href="billing.jsp">Billing</a>
        <a href="history.jsp">History</a>
        <a href="Room.jsp">Room Status</a>
        <a href="bookings.jsp">Bookings</a>
        <a href="support.jsp">Contact Support</a>
        <a href="LoginController">Logout</a>
        <span class="welcome">Welcome, <%= username %></span>
    </div>
    <div class="container">
        <h1>Admin Dashboard - Grand Stay Hotel</h1>
        <p>Manage hotel operations and reservations efficiently.</p>
    </div>
    <footer>
        © 2025 Grand Stay Hotel. All rights reserved.
    </footer>
</body>
</html>

