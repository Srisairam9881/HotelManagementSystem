package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.DBConnection;

public class RoomTypeDao {

	public int getRoomId(String roomTypeName) {
	    String query = "SELECT roomtypeid FROM roomtype WHERE roomtypename = ?";
	    try (Connection connection = DBConnection.getConnnection();
	         PreparedStatement ps = connection.prepareStatement(query)) {
	        ps.setString(1, roomTypeName); 

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("roomtypeid");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return 0;
	}

}
