<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    

	    <style type="text/css">
	    .custom-navbar {
		    	height: 50px; 
		        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
			}
		 body {
            font-family: 'Poppins', sans-serif;
            padding: 0;
        }
        .icon {
            cursor: pointer;
        }
        .colum{
        	color :#685CFE;
        	font-size: 25px;
        }
        .custom-table {
        width: 100%; 
    }
    .modal-content {
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light custom-navbar">
    <div class="navbar-collapse justify-content-end">
        <i class="navbar-user-icon fas fa-user" onclick="showUserDetails()"></i>
    </div>
</nav>

<div class="container mt-5">
    <table class="table custom-table">
        <thead>
            <tr>
                <th scope="col" style="width: 20%;" class="colum">Task Name</th>
                <th scope="col" class="colum">Employee Name</th>
                <th scope="col" class="colum">Date</th>
                <th scope="col" class="colum">Remind Date</th>
                <th scope="col" class="colum" style="margin-left:20%;" >Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Task 1</td>
                <td>Employee 1</td>
                <td>2024-01-23</td>
                <td>2024-01-25</td>
                <td>
                    <!-- Add actions buttons/icons here -->
                    <button class="btn btn-primary" style="background-color: #685CFE;" data-toggle="modal" data-target="#taskdetailModal">View more</button>
                    <button class="btn btn-danger">Remove task</button>
                </td>
            </tr>
            <!-- Repeat similar rows for additional tasks -->
            <!-- ... -->
        </tbody>
    </table>
</div>

<div class="modal" id="taskdetailModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <h4 class="modal-title text-center" style="color: #626262; width: 100%;">Edit Details</h4>
            <div class="modal-body">
                <form action="your_employee_submit_action" method="post">
                    <div class="form-group" style="margin-bottom: 25px;">
                        <input type="text" class="form-control" id="title" name="title" required placeholder="Enter your title">
                    </div>

                    <div class="form-group" style="margin-bottom: 25px;">
                        <input type="email" class="form-control" id="description" name="description" required placeholder="Enter your description">
                    </div>

                    <div class="form-group" style="margin-bottom: 25px;">
                        <input type="text" class="form-control" id="date" name="date" required placeholder="Enter date">
                    </div>
                    
                     <div class="form-group">
                            <select class="form-control" id="employeeDropdown">
                                <option value="employee1">Employee 1</option>
                                <option value="employee2">Employee 2</option>
                            </select>
                        </div>

 					<div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width:150px;">Cancel</button>
                        <button type="submit" class="btn btn-primary" style="background-color: #685CFE; width:150px;">Save</button>
                    </div>               
                     </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
