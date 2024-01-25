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
 * Servlet implementation class DeleteTaskServelet
 */
@WebServlet("/DeleteTaskServelet")
public class DeleteTaskServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
        
        // Perform the deletion operation using the 'pid' value
	 boolean isDeleted;
	 isDeleted = TaskDBUtil.deleteTaskData(id);
	 
	 if(isDeleted == true) {
		 response.getWriter().write("Record deleted successfully");

		 List<Task> tasks = TaskDBUtil.getAllTasks();

			if (!tasks.isEmpty()) {
			    System.out.println("data updated. Forwarding to home.jsp");
			    request.setAttribute("tasks", tasks);

			    RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
			    dis.forward(request, response);
			} else {
			    System.out.println("Condition not updated. Forwarding to home.jsp");

			    RequestDispatcher dis2 = request.getRequestDispatcher("home.jsp");
			    dis2.forward(request, response);
			}
		 
	 }else { 
		 response.getWriter().write("Record not deleted..Try again later");
		 List<Task> tasks = TaskDBUtil.getAllTasks();

			if (!tasks.isEmpty()) {
			    System.out.println("data updated. Forwarding to home.jsp");
			    request.setAttribute("tasks", tasks);

			    RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
			    dis.forward(request, response);
			} else {
			    System.out.println("Condition not updated. Forwarding to home.jsp");

			    RequestDispatcher dis2 = request.getRequestDispatcher("home.jsp");
			    dis2.forward(request, response);
			}
	 }
	}

}
