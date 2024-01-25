package com.taskmanage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class GetTaskByUserId
 */
@WebServlet("/GetTaskByUserId")
public class GetTaskByUserId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("userId");
//	    int userId = Integer.parseInt(uid);
	    
		List<Task> task = TaskDBUtil.getTaskDetailsById(uid);

		if (!task.isEmpty()) {
			System.out.println("Tasks are fetched by user id");
		    // Set the list of employees as an attribute to be accessed in home.jsp
		    request.setAttribute("employees", task);

		    // Convert the employees list to JSON format
		    String jsonEmployees = new Gson().toJson(task);

		    // Set the content type to application/json
		    response.setContentType("application/json");

		    // Write the JSON data to the response
		    response.getWriter().write(jsonEmployees);
		} else {
			System.out.println("Error occured whille fetching data by user id");

		    // Handle the case when employees list is empty
		    response.getWriter().write("{}"); // Sending an empty JSON object
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
