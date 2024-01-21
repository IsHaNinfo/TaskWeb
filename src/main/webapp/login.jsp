<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
 <style type="text/css">
        body {
            font-family: Hind SemiBold;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0; /* Optional: Set a background color for the body */
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
            width: 300px; /* You can adjust the width as needed */
        }

        input {
            margin-bottom: 10px;
            padding: 8px;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login Page</h1>

	<form action="login" method="post">
		User Name <input type="text" name="username" placeholder="Enter your username">
		<br>
		Password <input type="password" name="password" placeholder="Enter your password">
		
		<input type="submit" name="submit" value="Login">
	</form>
	
	</div>
	
</body>
</html>