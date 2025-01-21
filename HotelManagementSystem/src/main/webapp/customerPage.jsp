<%@ page import="java.util.List"%>
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

    <div class="navbar">
        <span class="hotel-name">Grand Stay Hotel</span>
        <a href="customerPage.jsp">Home</a>
        <a href="javascript:void(0);" onclick="showReservationForm()">Reservation</a>
        <a href="billing.jsp">Billing</a>
        <a href="javascript:void(0);" onclick="showHistory()">History</a>
        <a href="javascript:void(0);" onclick="showBookingsList()">Bookings</a>
        <a href="javascript:void(0);" onclick="showContactSupport()">Contact Support</a>
        <a href="LoginController">Logout</a>
        <span class="welcome">Welcome, <%= username %></span>
    </div>

    <!-- Welcome Card -->
    <div class="card">
        <h2>Welcome to Grand Stay Hotel!</h2>
        <p>Hello <%= username %>, thank you for choosing Grand Stay Hotel. We are delighted to have you with us. You can easily manage your bookings and reservations through the options in the menu above.</p>
    </div>

    <!-- Reservation Form Section (Initially Hidden) -->
    <div id="reservationForm" class="hidden">
        <h2>Make a Reservation</h2>
        <form id="reservationForm" method="post" action="userReservation">
            <div>
                <label for="checkInDate">Check-in Date:</label>
                <input type="date" id="checkInDate" name="checkInDate" required />
            </div>
            <div>
                <label for="checkOutDate">Check-out Date:</label>
                <input type="date" id="checkOutDate" name="checkOutDate" required />
            </div>
            <div>
                <label for="noOfRooms">Number of Rooms:</label>
                <input type="number" id="noOfRooms" name="noOfRooms" required min="1" />
            </div>
            <div>
                <label for="roomType">Room Type:</label>
                <select id="roomType" name="roomType" required>
                    <option value="single room">Single Room</option>
                    <option value="double room">Double Room</option>
                    <option value="suite">Suite</option>
                </select>
            </div>
            <div>
                <button type="submit">Book Reservation</button>
            </div>
        </form>
    </div>

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
                   List<ReservationDetails> reservations=(List<ReservationDetails>) session.getAttribute("reservations");
                    //ReservationService reservationService = new ReservationService();
                    //List<ReservationDetails> reservations = reservationService.getReservationsByUserId(uid);
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

    <div id="historySection" class="hidden">
        <h2>Your Reservation History</h2>
        <table>
            <thead>
                <tr>
                    <th>Reservation ID</th>
                    <th>Full Name</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Number of Rooms</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<ReservationDetails> historyReservations = (List<ReservationDetails>) session.getAttribute("reservations");
                    if (historyReservations != null && !historyReservations.isEmpty()) {
                        for (ReservationDetails reservation : historyReservations) {
                %>
                <tr>
                    <td><%= reservation.getReservationId() %></td>
                    <td><%= reservation.getFullName() %></td>
                    <td><%= reservation.getCheckInDate() %></td>
                    <td><%= reservation.getCheckOutDate() %></td>
                    <td><%= reservation.getNoOfRooms() %></td>
                    <td><%= reservation.getStatus() %></td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6">No history found.</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Contact Support Section (Initially Hidden) -->
    <div id="contactSupportSection" class="hidden">
        <h2>Contact Support</h2>
        <p>For support, you can reach us via:</p>
        <ul>
            <li>Phone: +1 (555) 123-4567</li>
            <li>Email: support@grandstayhotel.com</li>
        </ul>
    </div>

    <footer>
        <p>&copy; 2025 Grand Stay Hotel. All rights reserved.</p>
    </footer>

    <script>
        function showReservationForm() {
            document.getElementById("reservationForm").style.display = "block";
            document.getElementById("bookingsList").style.display = "none";
            document.getElementById("historySection").style.display = "none";
            document.getElementById("contactSupportSection").style.display = "none";
        }

        function showBookingsList() {
            document.getElementById("bookingsList").style.display = "block";
            document.getElementById("reservationForm").style.display = "none";
            document.getElementById("historySection").style.display = "none";
            document.getElementById("contactSupportSection").style.display = "none";
        }

        function showHistory() {
            document.getElementById("historySection").style.display = "block";
            document.getElementById("reservationForm").style.display = "none";
            document.getElementById("bookingsList").style.display = "none";
            document.getElementById("contactSupportSection").style.display = "none";
        }

        function showContactSupport() {
            document.getElementById("contactSupportSection").style.display = "block";
            document.getElementById("reservationForm").style.display = "none";
            document.getElementById("bookingsList").style.display = "none";
            document.getElementById("historySection").style.display = "none";
        }
    </script>
</body>
</html>