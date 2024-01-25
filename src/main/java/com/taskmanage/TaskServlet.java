package com.taskmanage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TaskServlet
 */
@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String taskname = request.getParameter("taskname");
		String description = request.getParameter("description");
		String date = request.getParameter("date");
		String status = "proposed";
		int uid = 1;
		String comment = "to be start";
		
		
		boolean isTrue;
		boolean isTrueViewAll;
		
		isTrue = TaskDBUtil.insertTask(taskname, description, date , status ,uid ,comment);
		
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
