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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
;		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		boolean isTrue;
		
		isTrue = AdminDBUtil.validate(userName, password);
		
		if(isTrue == true) {
			List<Admin> adminDetails = AdminDBUtil.getAdmin(userName);
		request.setAttribute("adminDetails", adminDetails);		
		
		 String userRole = adminDetails.get(0).getUserRole(); // Assuming userRole is a property in the Admin class

         if ("admin".equals(userRole)) {
             // Forward to admin page
             RequestDispatcher adminDispatcher = request.getRequestDispatcher("home.jsp");
             adminDispatcher.forward(request, response);
         } else if ("employee".equals(userRole)) {
             // Forward to employee page
        	 int adminId = adminDetails.get(0).getId(); // Assuming getAdminId() returns the admin ID
        	    request.setAttribute("adminId", adminId);

        	 RequestDispatcher employeeDispatcher = request.getRequestDispatcher("employeeHomePage.jsp");
        	 employeeDispatcher.forward(request, response);
         }
		
		}else {
			   // Incorrect login
			  out.println("<script type='text/javascript'>");
			  out.println("window.alert('Your username or password is incorrect');");
			  out.println("location='login.jsp'");
			  out.println("</script>");
			
		}
	}

}
