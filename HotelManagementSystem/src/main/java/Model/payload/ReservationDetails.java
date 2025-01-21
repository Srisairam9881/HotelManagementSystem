package Model.payload;


import java.sql.Date;

public class ReservationDetails {
    private int reservationId;
    private int userId;
    private Date checkInDate;
    private Date checkOutDate;
    private int roomTypeId;
    private int noOfRooms;
    private String status;
    
    private String roomTypeName;
    private String fullName;
    private double price;

    public ReservationDetails(int reservationId,int userId, Date checkInDate, Date checkOutDate, String roomTypeName, int noOfRooms, String status, double price, String fullName) {
        this.reservationId=reservationId;
    	this.userId = userId;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.roomTypeName = roomTypeName;
        this.noOfRooms = noOfRooms;
        this.status = status;
        this.price = price;
        this.fullName = fullName;
    }

    // Getters and setters for all fields

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
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
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
