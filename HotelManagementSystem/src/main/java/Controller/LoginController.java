package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;
import Model.payload.ReservationDetails;
import Service.LoginService;
import Service.ReservationService;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private LoginService loginService = new LoginService();

    public LoginController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        resp.sendRedirect("login.jsp"); 
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String password = request.getParameter("Password");
         
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("Admin");
            session.removeAttribute("username");
            session.removeAttribute("Customer");
            session.removeAttribute("userDetails");
        }

        if (userId == 0) {
            request.setAttribute("error", "User ID cannot be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        boolean loginSuccess = loginService.validateLogin(userId, password);

        if (loginSuccess) {
            String role = loginService.getUserRole(userId);
            String fname = loginService.getUserName(userId);
            User user = loginService.getUser(userId);
            ReservationService reservationService=new ReservationService();
            if ("Admin".equals(role)) {
                session = request.getSession();
                session.setAttribute("userid", userId);
                session.setAttribute("userDetails", user);
                session.setAttribute("username", fname);
                session.setAttribute("role", role);
                response.sendRedirect("adminPage.jsp");
            } else if ("Customer".equals(role)) {
                session = request.getSession();
                List<ReservationDetails> reservationDetails=reservationService.getReservationsByUserId(userId);
                session.setAttribute("reservations", reservationDetails);
                session.setAttribute("userDetails", user);
                session.setAttribute("userid", userId);
                session.setAttribute("username", fname);
                session.setAttribute("role", role);
                response.sendRedirect("customerPage.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid login credentials.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
