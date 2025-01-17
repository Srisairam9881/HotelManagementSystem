package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.LoginService;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private LoginService loginService = new LoginService();

    public LoginController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        String password = request.getParameter("Password");

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

            if ("admin".equalsIgnoreCase(role)) {
                response.sendRedirect("adminPage.jsp");
            } else {
                response.sendRedirect("customerPage.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid login credentials.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
