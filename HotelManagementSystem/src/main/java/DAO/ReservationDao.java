package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Model.Reservation;
import Model.payload.ReservationDetails;
import Util.DBConnection;

public class ReservationDao {

    public Reservation AddNewReservation(Reservation reservation) {
        Connection conn = null;
        String sql = "INSERT INTO reservation (userid, checkindate, checkoutdate, roomtypeid, noofrooms, status) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = DBConnection.getConnnection();
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, reservation.getUserId());
            pre.setDate(2, reservation.getCheckInDate());
            pre.setDate(3, reservation.getCheckOutDate());
            pre.setInt(4, reservation.getRoomTypeId());
            pre.setInt(5, reservation.getNoOfRooms());
            pre.setString(6, reservation.getStatus());
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reservation;
    }

    public List<ReservationDetails> getReservationsByUserId(int userId) {
        List<ReservationDetails> reservations = new ArrayList<>();

        String sql = "SELECT u.fullname, rt.roomtypename, rt.price,r.reservationid,r.checkindate, r.checkoutdate, r.noofrooms, r.status "
                   + "FROM reservation r "
                   + "JOIN userprofile u ON r.userid = u.userid "
                   + "JOIN roomtype rt ON r.roomtypeid = rt.roomtypeid "
                   + "WHERE r.userid = ?";

        try (Connection conn = DBConnection.getConnnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	int rid=rs.getInt("reservationid");
                String fullName = rs.getString("fullname");
                String roomTypeName = rs.getString("roomtypename");
                double price = rs.getDouble("price");
                Date checkInDate = rs.getDate("checkindate");
                Date checkOutDate = rs.getDate("checkoutdate");
                int noOfRooms = rs.getInt("noofrooms");
                String status = rs.getString("status");

                ReservationDetails reservationDetails = new ReservationDetails(rid,userId, checkInDate, checkOutDate, roomTypeName, noOfRooms, status, price, fullName);
                
                reservations.add(reservationDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservations;
    }

    public List<ReservationDetails> getAllReservation() {
        
        String sql = "SELECT u.userid,u.fullname, rt.roomtypename, rt.price, r.reservationid,r.checkindate, r.checkoutdate, r.noofrooms, r.status "
                   + "FROM reservation r "
                   + "JOIN userprofile u ON r.userid = u.userid "
                   + "JOIN roomtype rt ON r.roomtypeid = rt.roomtypeid ";
        List<ReservationDetails> res=new ArrayList<ReservationDetails>();
        try (Connection conn = DBConnection.getConnnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
            	int rid=rs.getInt("reservationid");
                int userId = rs.getInt("userid");
                String fullName = rs.getString("fullname");
                String roomTypeName = rs.getString("roomtypename");
                double price = rs.getDouble("price");
                Date checkInDate = rs.getDate("checkindate");
                Date checkOutDate = rs.getDate("checkoutdate");
                int noOfRooms = rs.getInt("noofrooms");
                String status = rs.getString("status");

                res.add(new ReservationDetails(rid,userId, checkInDate, checkOutDate, roomTypeName, noOfRooms, status, price, fullName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }
    public void updateReservation(Reservation reservation,int rid) {
        String sql = "UPDATE reservation SET checkindate = ?, checkoutdate = ?, noofrooms = ?, status = ? WHERE reservationid = ?";
        
        try (Connection conn = DBConnection.getConnnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDate(1, reservation.getCheckInDate());
            stmt.setDate(2, reservation.getCheckOutDate());
            stmt.setInt(3, reservation.getNoOfRooms());
            stmt.setString(4, reservation.getStatus());
            stmt.setInt(5, reservation.getReservationId());
            stmt.setInt(6, rid);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<ReservationDetails> getReservationsHistoryByUserId(int userId) {
        List<ReservationDetails> reservations = new ArrayList<>();

        String sql = "SELECT u.fullname, rt.roomtypename, rt.price, r.reservationid, r.checkindate, r.checkoutdate, r.noofrooms, r.status "
                   + "FROM reservation r "
                   + "JOIN userprofile u ON r.userid = u.userid "
                   + "JOIN roomtype rt ON r.roomtypeid = rt.roomtypeid "
                   + "WHERE r.userid = ? AND r.checkoutdate < CURDATE()";

        try (Connection conn = DBConnection.getConnnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int rid = rs.getInt("reservationid");
                String fullName = rs.getString("fullname");
                String roomTypeName = rs.getString("roomtypename");
                double price = rs.getDouble("price");
                Date checkInDate = rs.getDate("checkindate");
                Date checkOutDate = rs.getDate("checkoutdate");
                int noOfRooms = rs.getInt("noofrooms");
                String status = rs.getString("status");

                ReservationDetails reservationDetails = new ReservationDetails(rid, userId, checkInDate, checkOutDate, roomTypeName, noOfRooms, status, price, fullName);
                reservations.add(reservationDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservations;
    }
 
    
}
