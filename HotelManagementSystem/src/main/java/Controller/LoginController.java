package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;
import Service.LoginService;

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
        String userIdStr = request.getParameter("userId");
        String password = request.getParameter("Password");
         
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("Admin");
            session.removeAttribute("username");
            session.removeAttribute("Customer");
            session.removeAttribute("userDetails");
        }

        if (userIdStr == null || userIdStr.trim().isEmpty()) {
            request.setAttribute("error", "User ID cannot be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        int userId = 0;
        try {
            userId = Integer.parseInt(userIdStr); 
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid User ID format.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        boolean loginSuccess = loginService.validateLogin(userId, password);

        if (loginSuccess) {
            String role = loginService.getUserRole(userId);
            String fname = loginService.getUserName(userId);
            User user = loginService.getUser(userId);

            if ("Admin".equals(role)) {
                session = request.getSession();
                session.setAttribute("userDetails", user);
                session.setAttribute("username", fname);
                session.setAttribute("role", role);
                response.sendRedirect("adminPage.jsp");
            } else if ("Customer".equals(role)) {
                session = request.getSession();
                session.setAttribute("userDetails", user);
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
