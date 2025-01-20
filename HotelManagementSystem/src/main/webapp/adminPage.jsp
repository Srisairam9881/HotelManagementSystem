<%@ page import="java.util.List"%>
<%@ page import="Service.ReservationService" %>
<%@ page import="Model.payload.ReservationDetails" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    Integer uid = (Integer) session.getAttribute("userid");
    if (username == null || role == null || !role.equals("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home - Grand Stay Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <span class="logo">Grand Stay Hotel</span>
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
        <p>&copy; 2025 Grand Stay Hotel. All rights reserved.</p>
    </footer>

</body>
</html>
