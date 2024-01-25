<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Employee Home</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	

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
<body onload="fetchDataFromServer()">
    <nav class="navbar navbar-expand-lg navbar-light bg-light custom-navbar">
        <div class="navbar-collapse justify-content-end">
            <i class="navbar-user-icon fas fa-user" onclick="showUserDetails()"></i>
        </div>
    </nav>
    <div class="status-name">
        Task Status
    </div>
    <div class="shadow-card">
        
    </div>
    <!-- Modal for each task -->
 				<div class="modal fade task-modal" id="taskModal${task.id}" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel" aria-hidden="true">		        <div class="modal-dialog" role="document">
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
					             <small id="emailHelp" class="form-text text-muted">Not editable</small>
					          </div>
							  <div class="form-group">
							    <label for="taskName">Task name</label>
							    <input type="text" class="form-control" id="editTaskName" name="editTaskName" placeholder="${task.taskname}" value="${task.taskname}" readonly>
							    <small id="emailHelp" class="form-text text-muted">Not editable</small>
							  </div>
							  <div class="form-group">
							    <label for="Description">Description</label>
							    <input type="text" class="form-control" id="editDescription" name="editDescription" placeholder="${task.description}" value="${task.description}">
							  </div>
							  <div class="form-group">
							    <label for="dueDate">Completion date</label>
							    <input type="text" class="form-control" id="editDate" name="editDate" placeholder="${task.date}" value="${task.date}" readonly>
							 	 
							  </div>
							  <div class="form-group">
							    <label for="dueDate">Comment</label>
							    <input type="text" class="form-control" id="editComment" name="editComment" placeholder="${task.comment}" value="${task.comment}">
							  </div>
							   <div class="form-group">
							   <label for="status" >Current Status</label>
								<input type="text" class="form-control" id="Status"  placeholder="${task.status}" value="${task.status}" readonly>
								<small id="emailHelp" class="form-text text-muted">Not editable</small>
							
							   
							    <label for="status">Select new status</label>
							  	<select class="form-control" id="editStatus" name="editStatus">
							  		<option>Active</option>
							  		<option>Resolve</option>
							  		<option>Close</option>
							  	</select>
							  </div>
							   <div class="form-group">
							    <input type="hidden" class="form-control" id="editUID" name="editUID" placeholder="${task.uid}" value="${task.uid}">
							    <input type="hidden" class="form-control" id="employeePage" name="employeePage" placeholder="" value="employeePage">
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

    <!-- Your scriptlet to get user ID -->
    <%
        int uid = (int) request.getAttribute("userId");
        System.out.println(uid); // Now you can use the userId in your JavaScript function
    %>

    <script>
        function fetchDataFromServer() {
            var userId = <%= uid %>; // Get the userId from JSP
            console.log(userId);
            // Send AJAX request to servlet
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "GetTaskByUserId?userId=" + userId, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Handle the response here if needed
                    console.log(xhr.responseText);
                    var responseData = JSON.parse(xhr.responseText);
                    updateShadowCard(responseData);
                }
            };
            xhr.send();
        }

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
        
        function updateShadowCard(data) {
            var shadowCardDiv = document.querySelector('.shadow-card');
            // Clear previous content
            shadowCardDiv.innerHTML = '';

            // Create table element
            var table = document.createElement('table');
            table.classList.add('table');

            // Create table header
            var thead = document.createElement('thead');
            var headerRow = document.createElement('tr');
            var headers = ['Task Name', 'Description', 'Comment', 'Current Status', 'Action'];
            headers.forEach(function(headerText) {
                var th = document.createElement('th');
                th.textContent = headerText;
                headerRow.appendChild(th);
            });
            thead.appendChild(headerRow);
            table.appendChild(thead);

            // Create table body
            var tbody = document.createElement('tbody');
            data.forEach(function(task) {
                var row = document.createElement('tr');
                // Populate table rows with task data
                var taskData = [task.taskname, task.description, task.comment, task.status];
                taskData.forEach(function(cellData) {
                    var cell = document.createElement('td');
                    cell.textContent = cellData;
                    row.appendChild(cell);
                });

                // Create button for "View More & Update"
                var viewMoreButtonCell = document.createElement('td');
                var viewMoreButton = document.createElement('button');
                viewMoreButton.textContent = 'View More & Update';
                viewMoreButton.classList.add('btn', 'btn-info');
                viewMoreButton.onclick = function() {
                    openModal(task);
                };
                viewMoreButtonCell.appendChild(viewMoreButton);
                row.appendChild(viewMoreButtonCell);
                tbody.appendChild(row);
            });
            table.appendChild(tbody);
            shadowCardDiv.appendChild(table);
        }

        function openModal(task) {
        	// Set modal content using task details
            var modal = document.getElementById('taskModal');
            modal.querySelector('#editID').value = task.id;
            modal.querySelector('#editTaskName').value = task.taskname;
            modal.querySelector('#editDescription').value = task.description;
            modal.querySelector('#editDate').value = task.date;
            modal.querySelector('#editComment').value = task.comment;
            modal.querySelector('#Status').value = task.status;
            modal.querySelector('#editUID').value = task.uid;

            // Show the modal
            $(modal).modal('show');

        }
		
        function submitForm() {
            // Get user-entered values
            var taskName = document.getElementById("editTaskName").value;
            var description = document.getElementById("editDescription").value;
            var date = document.getElementById("editDate").value;
            var comment = document.getElementById("editComment").value;
            var status = document.getElementById("editStatus").value;
            
            var uid = document.getElementById("editUID").value;

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
            document.getElementById("editUID").value = uid;

            // Now you can submit the form
            document.getElementById("editForm").submit();
        }

    </script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
