package Model;

import java.sql.Date;

public class Reservation {
	private int ReservationId;
	private int userId;
	private Date checkInDate;
	private Date checkOutDate;
	private int roomTypeId;
	private int noOfRooms;
	private String Status;
	
	public int getReservationId() {
		return ReservationId;
	}
	public void setReservationId(int reservationId) {
		ReservationId = reservationId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}
	public Date getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public int getRoomTypeId() {
		return roomTypeId;
	}
	public void setRoomTypeId(int roomTypeId) {
		this.roomTypeId = roomTypeId;
	}
	public int getNoOfRooms() {
		return noOfRooms;
	}
	public void setNoOfRooms(int noOfRooms) {
		this.noOfRooms = noOfRooms;
	}
	
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Reservation(int userId, Date checkInDate, Date checkOutDate, int roomTypeId, int noOfRooms, String status) {
		this.userId = userId;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.roomTypeId = roomTypeId;
		this.noOfRooms = noOfRooms;
		Status = status;
	}
	
	 

}
