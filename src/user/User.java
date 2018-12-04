package user;

public class User {
	public User(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String id;
	private String pw;
	private String address;
	private String email;
	private String mobile;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}
