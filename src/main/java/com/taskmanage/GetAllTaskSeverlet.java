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
 * Servlet implementation class GetAllTaskSeverlet
 */
@WebServlet("/GetAllTaskSeverlet")
public class GetAllTaskSeverlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Task> tasks = TaskDBUtil.getAllTasks();

		if (!tasks.isEmpty()) {
		    System.out.println("data fetched. Forwarding to home.jsp");
		    // Set the list of tasks as an attribute to be accessed in home.jsp
		    request.setAttribute("tasks", tasks);

		    RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
		    dis.forward(request, response);
		} else {
		    System.out.println("Condition is false. Forwarding to home.jsp");

		    RequestDispatcher dis2 = request.getRequestDispatcher("home.jsp");
		    dis2.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
