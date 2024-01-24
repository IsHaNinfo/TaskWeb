<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Employee Home</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style type="text/css">
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .custom-navbar {
            height: 50px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .shadow-card {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-top: 70px;
            margin-left: 100px;
            top: 0;
            right: 20px;
            width: 1250px;
            z-index: 1000;
        }

        .task {
            background-color: #fff;
            padding: 10px;
            position: relative;
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .task-dropdown {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
        }

        .dropdown-toggle {
            cursor: pointer;
        }

        .task:hover .task-dropdown {
            display: block;
        }

        .status-active {
            color: green;
        }

        .status-resolve {
            color: blue;
        }

        .status-close {
            color: red;
        }
        .status-name {
            font-size: 1.5em;
            margin-bottom: 10px;
            margin-top: 10px;
            margin-left:50px;
            color:#685CFE;
        }

        .update-status-btn {
            position: absolute;
            bottom: 90px;
            right: 120px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light custom-navbar">
    <div class="navbar-collapse justify-content-end">
        <i class="navbar-user-icon fas fa-user" onclick="showUserDetails()"></i>
    </div>
</nav>
 <div class="status-name">
        Task Status
    </div>
<div class="shadow-card">
   
    <div class="task">
        Create a program that generates and prints a random number between 1 and 100
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Select Status
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <a class="dropdown-item status-active" href="#" onclick="setStatus('Active')">Active</a>
                <a class="dropdown-item status-resolve" href="#" onclick="setStatus('Resolve')">Resolve</a>
                <a class="dropdown-item status-close" href="#" onclick="setStatus('Close')">Close</a>
            </div>
        </div>
    </div>
    <div class="task">
        Develop a script to read a text file, count the number of words, and print the result.
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Select Status
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                <a class="dropdown-item status-active" href="#" onclick="setStatus('Active')">Active</a>
                <a class="dropdown-item status-resolve" href="#" onclick="setStatus('Resolve')">Resolve</a>
                <a class="dropdown-item status-close" href="#" onclick="setStatus('Close')">Close</a>
            </div>
        </div>
    </div>
    <!-- Add more tasks as needed -->
    
    <div class="update-status-btn">
        <button class="btn btn-info" value="Submit" style="background-color: #685CFE;">Update Status</button>
    </div>
</div>

<%
    int adminId = (int) request.getAttribute("adminId");
    System.out.println(adminId);// Now you can use the adminId in your database requests or other logic
%>

<script type="text/javascript">
    console.log(adminId);

    function setStatus(status) {
        var dropdown = event.target.closest('.dropdown');
        // Update the text of the clicked dropdown button
        dropdown.querySelector('.dropdown-toggle').innerText = status;
        // Update the color of the clicked dropdown button
        dropdown.querySelector('.dropdown-toggle').classList.remove('btn-secondary', 'btn-success', 'btn-info', 'btn-danger');
        dropdown.querySelector('.dropdown-toggle').classList.add('btn-' + getStatusColorClass(status));
        // Update the color of the clicked dropdown item
        dropdown.querySelector('.dropdown-item').classList.remove('status-active', 'status-resolve', 'status-close');
        dropdown.querySelector('.dropdown-item').classList.add('status-' + status.toLowerCase());
    }

    function getStatusColorClass(status) {
        switch (status.toLowerCase()) {
            case 'active':
                return 'success';
            case 'resolve':
                return 'info';
            case 'close':
                return 'danger';
            default:
                return 'secondary';
        }
    }
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
