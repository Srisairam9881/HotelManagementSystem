package DAO;

import java.sql.*;
import Util.DBConnection;

public class LoginDao {

    // Method to validate login credentials
    public boolean login(int uid, String password) {
        String query = "SELECT * FROM userprofile WHERE UserID = ? AND Password = ?";
        try (Connection connection = DBConnection.getConnnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, uid);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();  // Returns true if the user exists
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to get the role of the user
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
        return null; // No role found or invalid user
    }
}
