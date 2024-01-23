package com.taskmanage;

public class Admin {
	
	
	public Admin(int id, String name, String email, String userName, String password,String userRole) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.userName = userName;
		this.password = password;
		this.userRole = userRole;
	}

	private int id;
	private String name;
	private String email;
	private String userName;
	private String password;
	private String userRole;
	
	
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
	public String getUserRole() {
		return userRole;
	}

}
