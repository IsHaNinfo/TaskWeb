package com.taskmanage;

public class Task {
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
	public Task(int id, String taskname, String description, String date) {
		super();
		this.id = id;
		this.taskname = taskname;
		this.description = description;
		this.date = date;
	}
	private int id;
	private String taskname;
	private String description;
	private String date;
}
