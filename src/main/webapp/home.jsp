<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Display Admins and Tasks</title>
    <style type="text/css">
        body {
            font-family: Hind SemiBold;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .icon {
            cursor: pointer;
            
        }

        .details {
            display: none;
        }
         .details-container {
            display: flex;
            justify-content: flex-end;
        }
    </style>
</head>
<body>


        
     
            <c:forEach var="admin" items="${adminDetails}">
                       <div class="details-container">
                    <div class="icon" onclick="showDetails('adminDetails${admin.id}')">&#128064;</div>
                 
               
                <div class="details" id="adminDetails${admin.id}">
                    <div colspan="5">
                        Username: ${admin.userName}<br>
                        Email: ${admin.email}
                    </div>
                    </div>
                </div>
            </c:forEach>
 

    <table>
        <thead>
            <tr>
                <th>Task Name</th>
                <th>Employee Name</th>
                <th>Date</th>
                <th>Assigned</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="task" items="${taskList}">
                <tr>
                    <td>${task.taskName}</td>
                    <td>${task.employeeName}</td>
                    <td>${task.date}</td>
                    <td>${task.assigned}</td>
                </tr>
                <tr class="details" id="taskDetails${task.id}">
                    <td colspan="4">
                        <!-- Add additional details related to the task if needed -->
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <script type="text/javascript">
        function showDetails(elementId) {
            var detailsElement = document.getElementById(elementId);
            detailsElement.style.display = (detailsElement.style.display === 'none') ? 'table-row' : 'none';
        }
    </script>
</body>
</html>
