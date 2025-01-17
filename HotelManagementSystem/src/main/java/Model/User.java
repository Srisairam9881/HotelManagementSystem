package Model;

public class User {
  private int userId;
  private String full_name;
  private String email;
  private String mobileNo;
  private String address;
  private String password;
  private String role;
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public String getFull_name() {
	return full_name;
}
public void setFull_name(String full_name) {
	this.full_name = full_name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMobileNo() {
	return mobileNo;
}
public void setMobileNo(String mobileNo) {
	this.mobileNo = mobileNo;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
public User(int userId, String full_name, String email, String mobileNo, String address, String password, String role) {
	super();
	this.userId = userId;
	this.full_name = full_name;
	this.email = email;
	this.mobileNo = mobileNo;
	this.address = address;
	this.password = password;
	this.role = role;
}
  
}
