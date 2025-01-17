package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class DBConnection {
    public static Connection getConnnection() {
    	Connection conn=null;
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","Allam2588@");
    	}catch(SQLException | ClassNotFoundException e) {
    		e.printStackTrace();
    	}
    	if(conn!=null) {
    	return conn;
    	}else {
    		return null;
    	}
    }
}
