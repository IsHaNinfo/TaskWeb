package com.taskmanage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		String taskname = request.getParameter("taskname");
		String description = request.getParameter("description");
		String date = request.getParameter("date");
		
		boolean isTrue;
		
		isTrue = TaskDBUtil.insertTask(taskname, description, date);
		
		if(isTrue== true) {
		    System.out.println("Condition is true. Forwarding to home.jsp");

			RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
			dis.forward(request, response);
		}else {
		    System.out.println("Condition is false. Forwarding to home.jsp");

			RequestDispatcher dis2 = request.getRequestDispatcher("home.jsp");
			dis2.forward(request, response);
		} 
	}

}
