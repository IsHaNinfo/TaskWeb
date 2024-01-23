<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	    int adminId = (int) request.getAttribute("adminId");
	    System.out.println(adminId);// Now you can use the adminId in your database requests or other logic
	%>	
		<script type="text/javascript">
			console.log(adminId);
		</script>
		<h1>
		this is employeee page
	</h1>

</body>
</html>