package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Model.payload.ReservationDetails;
import Service.ReservationService;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ReservationService reservationService = new ReservationService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");

        if (username == null || role == null || !role.equals("Admin")) {
            resp.sendRedirect("login.jsp");
            return;
        }
            List<ReservationDetails> AllReservation=reservationService.getAllReservation();
            session.setAttribute("AllReservation", AllReservation);
            req.getRequestDispatcher("customerPage.jsp").forward(req, resp);
            

    }   
}
