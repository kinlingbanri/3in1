package com.mem.model;

public class MemVO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private String email;
	private String username;
	private String password;
	private Integer point;
	
	
	
	public MemVO() {
		super();
	}

	public MemVO(String email, String username, String password, Integer point) {
		super();
		this.email = email;
		this.username = username;
		this.password = password;
		this.point = point;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
}
