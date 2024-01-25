package com.taskmanage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class getAllEmployeeSeverlet
 */
@WebServlet("/getAllEmployeeSeverlet")
public class getAllEmployeeSeverlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Admin> employees = AdminDBUtil.getAllEmployee();

		if (!employees.isEmpty()) {
		    // Set the list of employees as an attribute to be accessed in home.jsp
		    request.setAttribute("employees", employees);

		    // Convert the employees list to JSON format
		    String jsonEmployees = new Gson().toJson(employees);

		    // Set the content type to application/json
		    response.setContentType("application/json");

		    // Write the JSON data to the response
		    response.getWriter().write(jsonEmployees);
		} else {
		    // Handle the case when employees list is empty
		    response.getWriter().write("{}"); // Sending an empty JSON object
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
