<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>task view</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    
    <style type="text/css">
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0; 
            padding: 0;
        }
        .icon {
            cursor: pointer;
        }
        .details {
            display: none;
            position: fixed;
            top: 70px; 
            right: 20px;
            z-index: 1000;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        .details-container {
            display: flex;
            justify-content: flex-end;
        }
        .modal-content {
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .add-task-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #685CFE;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        .top-buttons {
            display: flex;
            justify-content: flex-end;
            padding: 10px;
            margin-top:5px;
        }

        .top-buttons button {
            margin-left: 10px;
            background-color: #685CFE;
            color: #fff;
        }
        .custom-navbar {
		    	height: 50px; 
		        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
			}
		.pagename{
		            justify-content: flex-start;
		}
		.taskname{
		    color: #685CFE;
		
		}	
		   .shadow-card {
            background-color: #f8f9fa; 
            padding: 20px;
            border-radius: 5px;
            margin-top: 70px;
            margin-left:100px;
            top: 0;
            right: 20px;
            width: 1250px; 
            z-index: 1000;  
        }

        .task {
            background-color: #fff; 
            padding: 10px;
            position: relative;
            margin-top:10px;
        }

        .task .arrow-icon {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
        }
        .h4{
        	color:#626262
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light custom-navbar">
    <div class="navbar-collapse justify-content-end">
        <i class="navbar-user-icon fas fa-user" onclick="showUserDetails()"></i>
    </div>
</nav>

<!-- User Details Card -->
<div class="details" id="userDetailsCard">
    <c:forEach var="admin" items="${adminDetails}">
        <div class="details-container">
            <div class="details" id="adminDetails${admin.id}">
                <div colspan="5">
                    Username: ${admin.userName}<br>
                    Email: ${admin.email}
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="top-buttons pagename">
    <h4 class="taskname">Task View</h4>
    <div style="margin-left:700px;">
        <!-- Bootstrap button to trigger modal -->
        <button class="btn btn-info"  id="viewEmployeeBtn" >View Employee Assigned with Task</button>
        <button class="btn btn-primary" data-toggle="modal" data-target="#taskModal">Add Task</button>
        <button class="btn btn-secondary" data-toggle="modal" data-target="#employeeModal">Enter User</button>
    </div>
</div>




<div class="shadow-card">
    <div class="task">
		Create a program that generates and prints a random number between 1 and 100
    <i class=" arrow-icon fas fa-angle-double-right" style="color: darkblue;"></i>
    </div>
    <div class="task">
		Develop a script to read a text file, count the number of words, and print the result.   
    <i class=" arrow-icon fas fa-angle-double-right" style="color: darkblue;"></i>
    </div>
        <div class="task">
		Implement a simple calculator program that can perform addition, subtraction, multiplication, and division    
    <i class=" arrow-icon fas fa-angle-double-right" style="color: darkblue;"></i>
        </div>
        <div class="task">
		Create a function that checks if a given number is prime.    
    <i class=" arrow-icon fas fa-angle-double-right" style="color: darkblue;"></i>
		</div>
        <div class="task">
		Develop a script that prints the current date and time.   
    <i class=" arrow-icon fas fa-angle-double-right" style="color: darkblue;"></i>
		  </div>
        <div class="task">
		Write a program to print a pattern, such as a triangle or square, using loops.
    <i class=" arrow-icon fas fa-angle-double-right" style="color: darkblue;"></i>
		    </div>
    
        <div class="task" data-toggle="modal" data-target="#taskDetailsModal">
    Use a programming language with HTTP library (e.g., Python with requests) to make a simple API request (e.g., weather API) and display the response.
    <i class="arrow-icon fas fa-angle-double-right" style="color: darkblue;"></i>
</div>
    <!-- Add more tasks as needed -->
</div>

<!-- Bootstrap Modal for Task Details -->
<div class="modal" id="taskDetailsModal">
    <div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <p> Use a programming language with HTTP library (e.g., Python with requests) to make a simple API request (e.g., weather API) and display the response.</p>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="employeeDropdown">Assign to Employee:</label>
                            <select class="form-control" id="employeeDropdown">
                                <option value="employee1">Employee 1</option>
                                <option value="employee2">Employee 2</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex justify-content-end align-items-center">
                        <button type="button" class="btn btn-primary" style="background-color: #685CFE;">Assigned</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Modal for Add Task -->
<div class="modal" id="taskModal">
    <div class="modal-dialog modal-dialog-centered" style="max-width: 550px; max-height:600px; ">
        <div class="modal-content" style="border-radius: 10px;">
            <h4 class="modal-title text-center" style="color: #626262; width: 100%; margin-bottom:30px; margin-top:15px;">Add Task</h4>
            <div class="modal-body">
                <form action="taskinsert" method="post">
                    <div class="form-group" style="margin-bottom: 25px">
                        <input type="text" class="form-control" id="taskName" name="taskname" required placeholder="Enter task name" style="height:50px;">
                    </div>

                    <div class="form-group" style="margin-bottom: 25px">
                        <textarea class="form-control" id="description" name="description" required placeholder="Enter description" ></textarea>
                    </div>

                    <div class="form-group" style="margin-bottom: 25px">
                        <input type="date" class="form-control" id="date" name="date" required placeholder="Enter date" style="height:50px;">
                    </div>

                    <input type="submit" value="Submit Task"class="btn btn-primary" style="background-color: #685CFE; width: 370px">
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Modal for Add Employee -->
<div class="modal" id="employeeModal">
    <div class="modal-dialog modal-dialog-centered" style="max-width: 550px; max-height:600px;">
        <div class="modal-content" style="border-radius: 10px;">
            <h4 class="modal-title text-center" style="color: #626262; width: 100%; margin-bottom:30px; margin-top:15px;">Enter User</h4>
            <div class="modal-body">
                <form action="userinsert" method="post">
                <div class="form-group" style="margin-bottom: 25px;">
                        <input type="text" class="form-control" id="name" name="name" required placeholder="Enter  name" style="height:50px;">
                    </div>
                    <div class="form-group" style="margin-bottom: 25px;">
                        <input type="text" class="form-control" id="username" name="username" required placeholder="Enter  username" style="height:50px;">
                    </div>

                    <div class="form-group" style="margin-bottom: 25px;">
                        <input type="email" class="form-control" id="email" name="email" required placeholder="Enter  email" style="height:50px;" >
                    </div>
                    
                     <div class="form-group" style="margin-bottom: 25px;">
                        <input type="password" class="form-control" id="password" name="password" required placeholder="Enter  password" style="height:50px;" >
                    </div>

                   <div class="form-group">
					    <select class="form-control" id="userrole" name="userrole" style="height:50px;">
					        <option value="" disabled selected>Select User Role</option>
					        <option value="admin">Admin</option>
					        <option value="employee">Employee</option>
					    </select>
					</div>


                    <input type="submit" name="submit" class="btn btn-primary" style="background-color: #685CFE; width: 370px;" value="Submit User">
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Add Bootstrap JS and Popper.js scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
    // Function to show user details card
    function showUserDetails() {
        document.getElementById('userDetailsCard').style.display = 'block';
    }

    // Function to hide user details card
    function hideUserDetails() {
        document.getElementById('userDetailsCard').style.display = 'none';
    }

    // Close the user details card if the user clicks outside of it
    window.onclick = function(event) {
        if (!event.target.matches('.navbar-user-icon')) {
            hideUserDetails();
        }
    }
    
    var viewEmployeeBtn = document.getElementById("viewEmployeeBtn");

    // Add a click event listener to the button
    viewEmployeeBtn.addEventListener("click", function() {
        // Redirect to the "viewprogress" page
        window.location.href = "viewprogress.jsp";
    });
    
    
</script>
</body>
</html>
