package com.taskmanage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.google.gson.Gson;

/**
 * Servlet implementation class UpdateTask
 */
@WebServlet("/UpdateTaskServelet")
public class UpdateTaskServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String pageName = request.getParameter("employeePage");
		
		
		
		System.out.print("Method calld update");;
		String id = request.getParameter("editID");
	    int taskIdAsInt = Integer.parseInt(id);

		String taskname = request.getParameter("editTaskName");
		String description = request.getParameter("editDescription");
		String date = request.getParameter("editDate");
		String status = request.getParameter("editStatus");
		System.out.println(status);
		String employeeId = request.getParameter("editEmployee");
	    int uid = Integer.parseInt(employeeId);
//	    System.out.println(uid);
//		int uid = 1;
		String comment = "pending";
		
		boolean isUpdated = TaskDBUtil.updateTaskData(taskIdAsInt , taskname, description, date, status,uid,comment);
		
		
		
		if(isUpdated == true) {
			
			if("employeePage".equals(pageName)) {
				   	System.out.println("data updated. Forwarding to home.jsp");
				    request.setAttribute("userId", uid);

				    RequestDispatcher employeeDispatcher = request.getRequestDispatcher("employeeHomePage.jsp");
		        	 employeeDispatcher.forward(request, response);
			}else {

				out.println("<script type='text/javascript'>");
			  out.println("window.alert('Task updated successfully');");
			  out.println("location='updatetask.jsp'");
			  out.println("</script>");
			
			System.out.println("Task Data updated successfully");
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
//			
				
			}
			
		}else {
			if("employeePage".equals(pageName)) {
			   	System.out.println("Status not updated. Forwarding to employee.jsp");
			    request.setAttribute("userId", uid);

			    RequestDispatcher employeeDispatcher = request.getRequestDispatcher("employeeHomePage.jsp");
	        	 employeeDispatcher.forward(request, response);
		}else {

			out.println("<script type='text/javascript'>");
			  out.println("window.alert('Task updated successfully');");
			  out.println("location='updatetask.jsp'");
			  out.println("</script>");
			
			System.out.println("Task Data updated successfully");
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
	//		
				
			}
		}
	}

}
