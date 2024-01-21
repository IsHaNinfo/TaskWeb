package com.taskmanage;

public class Admin {
	
	
	public Admin(int id, String name, String email, String userName, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.userName = userName;
		this.password = password;
	}

	private int id;
	private String name;
	private String email;
	private String userName;
	private String password;
	
	
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public String getPassword() {
		return password;
	}
	

}
