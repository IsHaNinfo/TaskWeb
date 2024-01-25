<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <!-- Add Bootstrap JS and Popper.js scripts -->
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
	
    
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
            <!-- Bootstrap buttons to trigger modals -->
            <button class="btn btn-info" id="viewEmployeeBtn">View Employee Assigned with Task</button>
            <button class="btn btn-primary" data-toggle="modal" data-target="#taskModalAdd">Add Task</button>
            <button class="btn btn-secondary" data-toggle="modal" data-target="#employeeModal">Enter User</button>
        </div>
    </div>



   <div class="shadow-card">
   <form action ="getalltask" method="get">
		<button type="submit" class="btn btn-primary" id="viewAllTask">CLick to see All task</button>
	</form>
        <!-- Iterate over the list of tasks and generate HTML for each task -->
        <c:forEach var="task" items="${tasks}">
            <div class="task" style="cursor: pointer;">
            <div
            	class ="edit-button"
                data-bs-toggle="modal" data-bs-target="#taskModal"
                data-id = "${task.id}"
				data-task-name="${task.taskname}"
				data-description="${task.description}"
				data-date="${task.date}"
				data-comment="${task.comment}"
				data-status = "${task.status}"
				data-uid="${task.uid}"
            >
                <span >${task.taskname}</span>
                
        		<i class="arrow-icon fas fa-angle-double-right" style="color: darkblue"></i>
        		<button type="button" class="btn btn-danger ms-1 delete-button" data-id="${task.id}">Remove task</button>
        		
        		</div>
            	
            	
            </div> 
        </c:forEach>

    </div>
    
    <script>
	    $(document).ready(function () {
	        // When the "Edit" button is clicked, extract the data attributes and populate the modal fields
	        $(".edit-button").click(function () {
	            var modal = $("#taskModal");
	            var id = $(this).data("id");
	            var taskName = $(this).data("task-name");
	            var description = $(this).data("description");
	            var date = $(this).data("date");
	            var comment = $(this).data("comment");
	            var status = $(this).data("status");
	            var uid = $(this).data("uid");
		
	            modal.find("#editID").val(id);
	            modal.find("#editTaskName").val(taskName);
	            modal.find("#editDescription").val(description);
	            modal.find("#editDate").val(date);
	            modal.find("#editComment").val(comment);
	            modal.find("#editStatus").val(status);
	            modal.find("#existingDate").val(date);
	            modal.find("#existingState").val(status);
	        });
	    });
	</script>
    
    
     <!-- Modal for each task -->
 				<div class="modal fade task-modal" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel" aria-hidden="true">		        
 				<div class="modal-dialog" role="document">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="taskModalLabel">Task Details</h5>
		                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true">&times;</span>
		                    </button>
		                </div>
		                <form action="updatetask" method="post" id="editForm">
		                <div class="modal-body">
		                
		                		<div class="form-group">
					            <label for="editId">Task ID</label>
					            <input type="text" class="form-control" id="editID" name="editID"  placeholder="${task.id}" value="${task.id}" readonly>
					          </div>
							  <div class="form-group">
							    <label for="taskName">Task name</label>
							    <input type="text" class="form-control" id="editTaskName" name="editTaskName" aria-describedby="emailHelp" placeholder="${task.taskname}" value="${task.taskname}">
							    <small id="emailHelp" class="form-text text-muted"></small>
							  </div>
							  <div class="form-group">
							    <label for="Description">Description</label>
							    <input type="text" class="form-control" id="editDescription" name="editDescription" placeholder="${task.description}" value="${task.description}">
							  </div>
							  <div class="form-group">
							    <label for="dueDate">Completion date</label>
							    <input type="text" class="form-control"  id ="existingDate" placeholder="${task.date}" readonly>
							 	 <label for="dueDate">Select new date</label>
							 	 <input type="date" class="form-control" id="editDate" name="editDate" placeholder="${task.date}" value="${task.date}">
							  </div>
							  <div class="form-group">
							    <label for="dueDate">Comment</label>
							    <input type="text" class="form-control" id="editComment" name="editComment" placeholder="${task.comment}" value="${task.comment}" readonly>
							  </div>
							   <div class="form-group">
							   <label for="status">Current Status</label>
							   <input type="text" class="form-control"  id ="existingState"  readonly>
							    <label for="status">Select new status</label>
							  	<select class="form-control" id="editStatus" name="editStatus">
							  		<option>Active</option>
							  		<option>Resolve</option>
							  		<option>Close</option>
							  	</select>
							  </div>
							   <div class="form-group">
							    <div class="form-group">
		                            <label for="employee">Assign employee to the task</label>
		                            <select class="form-control" id="editEmployee" name="editEmployee"></select>
		                        </div>
							  </div>

							
		                </div>
		              
		                
		                <div class="modal-footer">
		                	<button type="button" class="btn btn-primary" onclick="submitForm()">Save changes</button>
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		                </div>
		                </form>
		            </div>
		        </div>
		    </div>
		
		    
  <script>
        // JavaScript/jQuery code for making AJAX request
        $(document).ready(function() {
            // Use a class selector for the modal
            $('.task-modal').on('shown.bs.modal', function() {
                // Extract task ID from modal ID
                var taskId = $(this).attr('id').replace('taskModal', '');

                // Make AJAX request to get all employee details
                $.ajax({
                    type: 'GET',
                    url: 'getAllEmployeeSeverlet',
                    dataType: 'json', // Assuming the response is in JSON format
                    success: function(data) {
                        console.log(data);
                        // Populate the select element with employee details
                        var selectElement = $('#editEmployee');
                      	selectElement.empty(); // Clear existing options

                        // Iterate over the received data and append options to select
                        for (var i = 0; i < data.length; i++) {
                            var employee = data[i];
                            selectElement.append($('<option>', {
                                value: employee.id,
                                text: employee.name
                            }));
                        }
                      	

                    },
                    error: function() {
                        // Handle error
                        console.error('Error fetching employee details');
                    }
                });
            });
        });
        
    </script>
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
<div class="modal" id="taskModalAdd">
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





<script>
        function submitForm() {
            // Get user-entered values
            var taskName = document.getElementById("editTaskName").value;
            var description = document.getElementById("editDescription").value;
            var date = document.getElementById("editDate").value;
            var comment = document.getElementById("editComment").value;
            var status = document.getElementById("editStatus").value;
            var employee = document.getElementById("editEmployee").value;
            

            // Check if the user entered new values, if not, set existing values
            taskName = taskName === "" ? "${task.taskname}" : taskName;
            description = description === "" ? "${task.description}" : description;
            date = date === "" ? "${task.date}" : date;
            comment = comment === "" ? "${task.comment}" : comment;

            // Set the values back to the form fields
            document.getElementById("editTaskName").value = taskName;
            document.getElementById("editDescription").value = description;
            document.getElementById("editDate").value = date;
            document.getElementById("editComment").value = comment;
            document.getElementById("editStatus").value = status; // Set existing status
            document.getElementById("editEmployee").value = employee;

            // Now you can submit the form
            document.getElementById("editForm").submit();
        }
    </script>
    
    <!-- to delete the data -->
	<script>
    $(document).ready(function () {
        $(".delete-button").click(function () {
            var id = $(this).data("id");
            var confirmation = confirm("Are you sure you want to delete this record?");

            if (confirmation) {
                $.ajax({
                    url: "deletetask",
                    type: "POST",
                    data: { id: id },
                    success: function(response) {
                    	
                        // Handle the response from the servlet, e.g., show a success message
                        alert("Record deleted successfully"); 
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    },
                    error: function() {
                        // Handle any errors
                        alert("Error deleting record");
                    }
                });
            }
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
