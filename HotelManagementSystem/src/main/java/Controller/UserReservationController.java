package Controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Reservation;
import Model.payload.ReservationDetails;
import Service.ReservationService;
import Service.RoomTypeService;

@WebServlet("/userReservation")
public class UserReservationController extends HttpServlet {

    private ReservationService reservationService = new ReservationService();
    private RoomTypeService roomTypeService = new RoomTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check if the user is logged in
        if (session == null || session.getAttribute("userid") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userid");
        
        List<ReservationDetails> reservations = reservationService.getReservationsByUserId(userId);

        request.setAttribute("reservations", reservations);
        //request.getRequestDispatcher("viewReservations.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");

        if (username == null || role == null || !role.equals("Customer")) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String checkInDateStr = req.getParameter("checkInDate");
        String checkOutDateStr = req.getParameter("checkOutDate");
        String roomTypeName = req.getParameter("roomType");
        String noOfRoomsStr = req.getParameter("noOfRooms");

        if (checkInDateStr == null || checkOutDateStr == null || roomTypeName == null || noOfRoomsStr == null) {
            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("customerHomePage.jsp").forward(req, resp);
            return;
        }

        try {
            Date checkInDate = Date.valueOf(checkInDateStr);
            Date checkOutDate = Date.valueOf(checkOutDateStr);
            int noOfRooms = Integer.parseInt(noOfRoomsStr);

       
            int roomTypeId = roomTypeService.getRoomId(roomTypeName);
            String status = "Pending"; 

            if (roomTypeId == 0) {
                req.setAttribute("error", "Invalid room type.");
                req.getRequestDispatcher("customerPage.jsp").forward(req, resp);
                return;
            }

            int userId = (int) session.getAttribute("userid");
            Reservation reservation = new Reservation(userId, checkInDate, checkOutDate, roomTypeId, noOfRooms, status);

            reservationService.BookReservation(reservation);

            resp.sendRedirect("customerHomePage.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Invalid input. Please check your data.");
            req.getRequestDispatcher("customerPage.jsp").forward(req, resp);
        }
    }
}
