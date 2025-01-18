package DAO;

import java.sql.*;

import Model.User;
import Util.DBConnection;

public class LoginDao {

    // Method to validate login credentials
    public boolean login(int uid, String password) {
        String query = "SELECT * FROM userprofile WHERE UserID = ? AND Password = ?";
        try (Connection connection = DBConnection.getConnnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, uid);
            ps.setString(2, Util.PasswordUtil.hashPassword(password));
            ResultSet rs = ps.executeQuery();
            return rs.next(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getUserRole(int uid) {
        String query = "SELECT Role FROM userprofile WHERE UserID = ?";
        Connection connection = DBConnection.getConnnection();
        
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getString("Role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public String getUserName(int uid) {
        String query = "SELECT FullName FROM userprofile WHERE UserID = ?";
        Connection connection = DBConnection.getConnnection();
        
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getString("FullName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public User getUser(int uid) {
    	String query = "SELECT * FROM userprofile WHERE UserID = ?";
        Connection connection = DBConnection.getConnnection();
        
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            User user=null;
            if (rs.next()) {
                int ud= rs.getInt("UserId");
                String fname=rs.getString("FullName");
                String email=rs.getString("Email");
                String phoneNo=rs.getString("MobileNumber");
                String add=rs.getString("address");
                user=new User(ud, fname, email, email, add, phoneNo, add);
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
