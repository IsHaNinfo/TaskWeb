package com.taskmanage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserInsertServlet")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
				String name = request.getParameter("name");
				String userName = request.getParameter("username");
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String userRole = request.getParameter("userrole");
				
				boolean isTrue;

				isTrue = AdminDBUtil.insertUser(name, email, userName, password, userRole);
				
				if(isTrue == true) {
					  System.out.println("Condition is true. Forwarding to home.jsp");

						RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
						dis.forward(request, response);
				}else {
					 System.out.println("Condition is false. Forwarding to home.jsp");

						RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
						dis.forward(request, response);
				}
	}

}
