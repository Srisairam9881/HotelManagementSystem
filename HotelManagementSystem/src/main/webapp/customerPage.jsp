<%@page import="java.util.List"%>
<%@ page import="Service.ReservationService" %>
<%@ page import="Model.payload.ReservationDetails" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    Integer uid = (Integer) session.getAttribute("userid");
    if (username == null || role == null || !role.equals("Customer")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Home - Grand Stay Hotel</title>
    <link rel="stylesheet" href="styles/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            align-items: center;
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
            width: 100%;
            padding: 14px 20px;
            box-sizing: border-box;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            max-width: 1000px;
            width: 90%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .container h2 {
            font-size: 20px;
            color: #333;
            margin-bottom: 15px;
        }

        .container table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            margin-left: auto;
            margin-right: auto;
        }

        .container table th, .container table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .container table th {
            background-color: #4CAF50;
            color: white;
        }

        .container table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .container table td a {
            color: #007BFF;
            text-decoration: none;
        }

        .container table td a:hover {
            text-decoration: underline;
        }

        footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .container form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            text-align: left;
        }

        .container form div {
            margin-bottom: 15px;
        }

        .container form input, .container form select, .container form button {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .container form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .container form button:hover {
            background-color: #45a049;
        }

        .container .welcome {
            font-size: 18px;
            color: #333;
            margin-top: 10px;
        }

        .edit-form {
            margin-top: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <span class="hotel-name">Grand Stay Hotel</span>
        <a href="customerPage.jsp">Home</a>
        <a href="javascript:void(0);" onclick="showReservationForm()">Reservation</a> 
        <a href="history.jsp">History</a>
        <a href="Room.jsp">Room Status</a>
        <a href="bookings.jsp">Bookings</a>
        <a href="LoginController">Logout</a>
        <span class="welcome">Welcome, <%= username %> and <%= uid %></span>
    </div>

    <div class="container">
        <h1>Welcome to Grand Stay Hotel, <%= username %>!</h1>

        <!-- Error message display -->
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) { 
        %>
            <div class="error-message"><%= error %></div>
        <% } %>

        <!-- Reservation History Table -->
        <h2>Your Reservations</h2>
        <table>
            <thead>
                <tr>
                    <th>Reservation ID</th>
                    <th>Full Name</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Number of Rooms</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ReservationService reservationService = new ReservationService();
                    List<ReservationDetails> reservations = reservationService.getReservationsByUserId(uid);
                    if (reservations != null && !reservations.isEmpty()) {
                        for (ReservationDetails reservation : reservations) {
                %>
                <tr>
                    <td><%= reservation.getReservationId() %></td>
                    <td><%= reservation.getFullName() %></td>
                    <td><%= reservation.getCheckInDate() %></td>
                    <td><%= reservation.getCheckOutDate() %></td>
                    <td><%= reservation.getNoOfRooms() %></td>
                    <td><%= reservation.getStatus() %></td>
                    <td>
                        <!-- Edit Action -->
                        <a href="javascript:void(0);" onclick="editReservation(<%= reservation.getReservationId() %>, '<%= reservation.getCheckInDate() %>', '<%= reservation.getCheckOutDate() %>', <%= reservation.getNoOfRooms() %>, '<%= reservation.getStatus() %>', '<%= reservation.getRoomTypeName() %>')">Edit</a>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7">No reservations found.</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>

        <!-- Edit Reservation Form (Initially Hidden) -->
        <div id="editReservationForm" class="edit-form" style="display: none;">
            <h2>Edit Reservation</h2>
            <form id="editForm" method="post" action="updateReservation">
                <div>
                    <input type="hidden" id="editReservationId" name="reservationId">
                </div>
                <div>
                    <label for="editCheckInDate">Check-in Date:</label>
                    <input type="date" id="editCheckInDate" name="checkInDate" required />
                </div>
                <div>
                    <label for="editCheckOutDate">Check-out Date:</label>
                    <input type="date" id="editCheckOutDate" name="checkOutDate" required />
                </div>
                <div>
                    <label for="editNoOfRooms">Number of Rooms:</label>
                    <input type="number" id="editNoOfRooms" name="noOfRooms" required min="1" />
                </div>
                <div>
                    <label for="editRoomType">Room Type:</label>
                    <select id="editRoomType" name="roomType" required>
                        <option value="Single Room">Single Room</option>
                        <option value="Double Room">Double Room</option>
                        <option value="Suite">Suite</option>
                    </select>
                </div>
                <div>
                    <label for="editStatus">Status:</label>
                    <select id="editStatus" name="status" required>
                        <option value="Pending">Pending</option>
                        <option value="Cancelled">Cancelled</option>
                    </select>
                </div>
                <div>
                    <button type="submit" onclick="submitReservationEdit()">Update Reservation</button>
                </div>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Grand Stay Hotel. All rights reserved.</p>
    </footer>

    <script>
        function editReservation(reservationId, checkInDate, checkOutDate, noOfRooms, status, roomType) {
            // Show the edit form
            document.getElementById("editReservationForm").style.display = "block";

            // Populate the form with current reservation details
            document.getElementById("editReservationId").value = reservationId;
            document.getElementById("editCheckInDate").value = checkInDate;
            document.getElementById("editCheckOutDate").value = checkOutDate;
            document.getElementById("editNoOfRooms").value = noOfRooms;
            document.getElementById("editRoomType").value = roomType;
            document.getElementById("editStatus").value = status;
        }

        function submitReservationEdit() {
            // You can handle form submission and success here, or let the form submission happen
            // If you want to perform a redirect after a successful edit, add JavaScript for that as well
            alert('Reservation updated successfully!');
            window.location.href = 'customerHomepage.jsp'; // Redirect to customer homepage after success
        }
    </script>
</body>
</html>
