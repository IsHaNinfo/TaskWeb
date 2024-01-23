<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    
    <style type="text/css">
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
           
            height: 100vh;
            background-color: #f0f0f0; /* Optional: Set a background color for the body */
        }

        .header-container {
            text-align: left;
            margin-top: 10px;
            margin-left: 20px;
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 35px;
            text-align: center;
           
            margin-top:150px;
            margin-left:200px;
            width: 400px;
            height: 400px;
        }

        h2 {
            text-align: center;
            color: #685CFE;
            margin-top: 45px;
            margin-bottom: 45px;
        }
        
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px; 
        }

        input[type="submit"] {
            background-color: #685CFE;
            color: #fff;
            cursor: pointer;
            margin-top: 10px; 
            }
        input[type="submit"]:hover {
            background-color: #574ecc; 
        }
        
    </style>
</head>
<body>
    <div class="header-container">
        <h2>Manage your Tasks</h2>
    </div>

    <div class="login-container">
        <h2>Login </h2>

        <form action="login" method="post">
            <input type="text" name="username" class="form-control mb-3" placeholder="Enter your username">
            <input type="password" name="password" class="form-control mb-3" placeholder="Enter your password">
            
            <input type="submit" name="submit" class="btn btn-success btn-block" value="Login">
        </form>
        
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
