package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.User;
import Util.DBConnection;
import Util.PasswordUtil;

public class UserDao {
	PasswordUtil passwordUtil=new PasswordUtil();
	public User Register(User user) {
		String sql="insert into userprofile values(?,?,?,?,?,?,?)";
		Connection conn=null;
		try {
			conn=DBConnection.getConnnection();
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setInt(1, user.getUserId());
			pre.setString(2, user.getFull_name());
			pre.setString(3, user.getEmail());
			pre.setString(4, user.getMobileNo());
			pre.setString(5, PasswordUtil.hashPassword(user.getPassword()));
			pre.setString(6, user.getRole());
			pre.setString(7, user.getAddress());
			pre.executeUpdate();
		    
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
