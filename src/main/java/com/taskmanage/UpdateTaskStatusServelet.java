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

/**
 * Servlet implementation class UpdateTaskStatus
 */
@WebServlet("/UpdateTaskStatus")
public class UpdateTaskStatusServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String id = request.getParameter("taskId");
	    int taskIdAsInt = Integer.parseInt(id);
		String status = request.getParameter("status");
		System.out.println(status);
	
		
		boolean isUpdated = TaskDBUtil.updateTaskSatus(taskIdAsInt , status);
		
		if(isUpdated == true) {
			
			out.println("<script type='text/javascript'>");
			  out.println("window.alert('Task updated successfully');");
			  out.println("location='updatetask.jsp'");
			  out.println("</script>");
			
			System.out.println("Task updated status");
			
//			
		}else {
			out.println("<script type='text/javascript'>");
			  out.println("window.alert('Error occured while updating.Please try again later');");
			  out.println("location='home.jsp'");
			  out.println("</script>");
			System.out.println("not updated status");
			
		}
	}

}
