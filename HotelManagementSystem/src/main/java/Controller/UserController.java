package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.User;
import Service.UserService;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public UserController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Simulating user registration
        int id = (int) Math.floor(Math.random() * 1000 * 3);
        String fname = request.getParameter("FullName");
        String email = request.getParameter("Email");
        String mobile = request.getParameter("MobileNumber");
        String add = request.getParameter("Address");
        String pass = request.getParameter("Password");
        String role = "Customer";
        
        User user = new User(id, fname, email, mobile, add, pass, role);
        
        UserService us = new UserService();
        us.Register(user);
        
        
        request.getSession().setAttribute("userId", id);
        
        
        response.sendRedirect("signup.jsp");
    }
}

