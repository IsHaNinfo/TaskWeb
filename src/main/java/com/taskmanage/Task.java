package com.taskmanage;

public class Task {
	
	private int id;
	private String taskname;
	private String description;
	private String date;
	private String status;
	private int uid;
	private String comment;
	

	public Task(int id, String taskname, String description, String date, String status, int uid, String comment) {
		super();
		this.id = id;
		this.taskname = taskname;
		this.description = description;
		this.date = date;
		this.status = status;
		this.uid = uid;
		this.comment = comment;
	}


	public String getStatus() {
		return status;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTaskname() {
		return taskname;
	}
	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	public void setStatus(String status) {
		this.status = status;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
}
