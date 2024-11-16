package dto;

public class UserDto {
  private String fname;
  private String lname;
  private String gender;
  private String email;
  private long phno;
  private String address;
  private String password;
public UserDto(String fname, String lname, String gender, String email, long phno, String address, String password) {
	super();
	this.fname = fname;
	this.lname = lname;
	this.gender = gender;
	this.email = email;
	this.phno = phno;
	this.address = address;
	this.password = password;
}
public UserDto() {
	// TODO Auto-generated constructor stub
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public long getPhno() {
	return phno;
}
public void setPhno(long phno) {
	this.phno = phno;
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
@Override
public String toString() {
	return "UserDto [fname=" + fname + ", lname=" + lname + ", gender=" + gender + ", email=" + email + ", phno=" + phno
			+ ", address=" + address + ", password=" + password + "]";
}
}
