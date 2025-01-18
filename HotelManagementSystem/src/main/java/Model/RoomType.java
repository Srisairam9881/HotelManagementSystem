package Model;

public class RoomType {
private int RoomTypeId;
private String RoomTypeName;
private double Rrice;
private double ServiceCharge;
public int getRoomTypeId() {
	return RoomTypeId;
}
public void setRoomTypeId(int roomTypeId) {
	RoomTypeId = roomTypeId;
}
public String getRoomTypeName() {
	return RoomTypeName;
}
public void setRoomTypeName(String roomTypeName) {
	RoomTypeName = roomTypeName;
}
public double getRrice() {
	return Rrice;
}
public void setRrice(double rrice) {
	Rrice = rrice;
}
public double getServiceCharge() {
	return ServiceCharge;
}
public void setServiceCharge(double serviceCharge) {
	ServiceCharge = serviceCharge;
}
public RoomType(int roomTypeId, String roomTypeName, double rrice, double serviceCharge) {
	super();
	RoomTypeId = roomTypeId;
	RoomTypeName = roomTypeName;
	Rrice = rrice;
	ServiceCharge = serviceCharge;
}

}
