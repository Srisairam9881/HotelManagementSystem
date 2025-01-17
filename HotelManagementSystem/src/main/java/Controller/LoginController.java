package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LoginDao;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        String password = request.getParameter("Password");

        // Check if userId is not empty and can be parsed as an integer
        if (userIdStr == null || userIdStr.trim().isEmpty()) {
            request.setAttribute("error", "User ID cannot be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        int userId = 0;
        try {
            userId = Integer.parseInt(userIdStr);  // Parse the userId to integer
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid User ID format.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Now, handle the login logic with userId and password
        LoginDao dao = new LoginDao();
        boolean loginSuccess = dao.login(userId, password);

        if (loginSuccess) {
            // Get the user's role and redirect to the appropriate page
            String role = dao.getUserRole(userId);  // Assuming a method to get the user role from DB
            if ("admin".equalsIgnoreCase(role)) {
                response.sendRedirect("adminPage.jsp");  // Redirect to the admin page
            } else {
                response.sendRedirect("customerPage.jsp");  // Redirect to the customer page
            }
        } else {
            // If login fails, show an error message
            request.setAttribute("error", "Invalid login credentials.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
