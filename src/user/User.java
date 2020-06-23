package user;

public class User {

	private String id;
	private String pw;
	
	private String name;
	private String gender;
	private String year;
	private String month;
	private String date;
	
	private String joinPath;
	private String recommend;
	
	private String level;
	private int manager;
	
	public User() {
		this.id= "";
		this.pw= "";
		this.name= "";
		this.gender= "";
		this.year= "";
		this.month= "";
		this.date= "";
		this.joinPath= "";
		this.recommend= "";
		this.level= "";
		this.manager= 0;
	}
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getJoinPath() {
		return joinPath;
	}
	public void setJoinPath(String joinPath) {
		this.joinPath = joinPath;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getLevel(){
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	

}
