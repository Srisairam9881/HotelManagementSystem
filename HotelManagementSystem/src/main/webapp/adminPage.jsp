<%@page import="Service.ReservationService"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.payload.ReservationDetails" %>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home - Grand Stay Hotel</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Basic Reset and Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .navbar {
            background-color: #333;
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
        }
        .navbar .hotel-name {
            font-size: 24px;
            font-weight: bold;
        }
        .welcome {
            font-size: 18px;
            font-weight: bold;
        }

        /* Card Layout for Welcome */
        .card {
            background-color: white;
            padding: 30px;
            margin: 20px auto;
            width: 80%;
            max-width: 700px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .card p {
            font-size: 18px;
            text-align: center;
        }

        /* Form Styling */
        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            margin: 20px auto;
        }
        form label {
            display: block;
            font-size: 16px;
            margin-bottom: 8px;
        }
        form input, form select, form button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        form button {
            background-color: #333;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        form button:hover {
            background-color: #555;
        }

        /* Table Styling */
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        tr:nth-child(even) td {
            background-color: #f2f2f2;
        }

        /* Hidden Content */
        .hidden {
            display: none;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }

        footer p {
            font-size: 14px;
        }

    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <span class="logo">Grand Stay Hotel</span>
        <a href="adminHomePage.jsp">Home</a>
        <a href="javascript:void(0);" onclick="showBookingsList()">Reservation</a>
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
        
         <!-- Bookings Table (Initially Hidden) -->
    <div id="bookingsList" class="hidden">
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
                  List<ReservationDetails> reservations=(List<ReservationDetails>) session.getAttribute("AllReservation");
                    //ReservationService reservationService = new ReservationService();
                    //List<ReservationDetails> reservations = reservationService.getAllReservation();
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
                    <td><!-- Edit Option --></td>
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
    </div>

    <footer>
        <p>&copy; 2025 Grand Stay Hotel. All rights reserved.</p>
    </footer>
   <script type="text/javascript">
   function showBookingsList() {
       document.getElementById("bookingsList").style.display = "block";
       document.getElementById("reservationForm").style.display = "none";
       document.getElementById("historySection").style.display = "none";
       document.getElementById("contactSupportSection").style.display = "none";
   }
   </script>
</body>
</html>
