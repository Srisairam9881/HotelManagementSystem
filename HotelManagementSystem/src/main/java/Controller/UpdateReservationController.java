package Controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Reservation;
import Service.ReservationService;
import Service.RoomTypeService;

@WebServlet("/updateReservation")
public class UpdateReservationController extends HttpServlet {

    ReservationService reservationService = new ReservationService();
    RoomTypeService roomTypeService = new RoomTypeService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");

        // Validate if the user is logged in and has the correct role
        if (username == null || role == null || !role.equals("Customer")) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // Fetch the form parameters
        String reservationIdStr = req.getParameter("reservationId");
        String checkInDateStr = req.getParameter("checkInDate");
        String checkOutDateStr = req.getParameter("checkOutDate");
        String noOfRoomsStr = req.getParameter("noOfRooms");
        String status = req.getParameter("status");
        String roomTypeName = req.getParameter("roomType");

        // Validate that all required fields are filled in
        if (reservationIdStr == null || checkInDateStr == null || checkOutDateStr == null || noOfRoomsStr == null || status == null || roomTypeName == null) {
            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("customerPage.jsp").forward(req, resp);
            return;
        }

        try {
            int reservationId = Integer.parseInt(reservationIdStr);
            Date checkInDate = Date.valueOf(checkInDateStr);
            Date checkOutDate = Date.valueOf(checkOutDateStr);
            int noOfRooms = Integer.parseInt(noOfRoomsStr);
            int roomTypeId = roomTypeService.getRoomId(roomTypeName);  // Get the room type ID

            if (roomTypeId == 0) {
                req.setAttribute("error", "Invalid room type.");
                req.getRequestDispatcher("customerPage.jsp").forward(req, resp);
                return;
            }

            // Create a reservation object with the updated details
            Reservation updatedReservation = new Reservation(reservationId, checkInDate, checkOutDate, roomTypeId, noOfRooms, status);

            reservationService.editReservationDetails(updatedReservation);

                resp.sendRedirect("customerPage.jsp");
           
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Invalid input. Please check your data.");
            req.getRequestDispatcher("customerPage.jsp").forward(req, resp);
        }
    }
}
