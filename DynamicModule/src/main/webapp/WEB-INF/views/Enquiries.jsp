<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enquires</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	  <style>
		     /* Apply styles to the table */
		table {
		  width: 100%;
		}
		
		/* Apply styles to table headers */
		th {
		  background-color: #00BFFF;
		  padding: 8px;
		  text-align: center;
		}
		td {
		  padding: 8px;
		  text-align: center; /* Center the content */
		}
		
		/* Add background color to odd rows */
		tr:nth-child(odd) {
		  background-color: #f9f9f9;
		}
		
		/* Add hover effect to table rows */
		tr:hover {
		  background-color: #e5e5e5;
		}
		  
		  .card-text{
		  	margin: -12px;
		  	font-size: 13px;
		  }
		  
		  
		 .container {
		  padding: 20px;
		}
		
		.form-overlay {
		  position: fixed;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background-color: rgba(0, 0, 0, 0.5);
		  z-index: 9999;
		  display: none;
		}
		
		.form-container {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  background-color: white;
		  padding: 20px;
		}
		
		.close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		}
	</style>

</head>
<body>

	<div id="formOverlay" class="form-overlay">
	  <div class="form-container">
	    <button id="closeFormButton" class="btn btn-secondary close"><i class="fas fa-times"></i></button>
	    <form id="form1" class="hidden-form">

	    </form>

	    <form:form id="form2" class="hidden-form" action="request" method="post">
		    <h3>Enquire Details</h3>
		    <div class="form-group">
		        <label for="enqIdInput">Enquire ID</label>
		        <input type="text" class="form-control" id="enqIdInput" name="enqId" readonly>
		    </div>
		    <div class="form-group">
		        <label for="createdByInput">Created By</label>
		        <input type="text" class="form-control" id="createdByInput" name="createdBy" readonly>
		    </div>
		    <div class="form-group">
		        <label for="custIdInput">CustID</label>
		        <input type="text" class="form-control" id="custIdInput" name="custId" readonly>
		    </div>
		    <div class="form-group">
		        <label for="purpose">Purpose</label>
		        <input type="text" class="form-control" id="purpose" name="purpose">
		    </div>
		    <div class="form-group">
		        <label for="status">Status</label>
		        <input type="text" class="form-control" id="status" name="status" readonly>
		    </div>
		    <!-- Add more form fields here -->
		
		    <button id="submitButton" class="btn btn-primary">Submit</button>
		</form:form>


	    <form id="form3" class="hidden-form">

	    </form>

	    <form id="form4" class="hidden-form">


	    </form>
	    <form id="dynamicForm" class="hidden-form">
		  <!-- Add the necessary form fields here -->
		</form>
	  </div>
	</div>



	<div class="table-responsive">
		  <table class="table">
		    <thead>
		      <tr>
		        <th scope="col">Enqr_ID</th>
		        <th scope="col">Date</th>
		        <th scope="col">Created By</th>
		        <th scope="col">Cust_ID</th>
		        <th scope="col">Subject</th>
		        <th scope="col">Description</th>
		        <th scope="col">Status</th>
		        <th scope="col">Assigned To</th>
		        <th scope="col">lastLoginDate</th>
		        <th scope="col">lastLoginUser</th>
		        <th scope="col"></th>
		        <th scope="col"></th>
		        <th scope="col"></th>
		        <th scope="col"></th>
		      </tr>
		    </thead>
		    <tbody>
		       
		       <c:forEach items="${enqdata}" var="response">
                        <tr>
                            <td>${response.enq_id}</td>
                            <td>${response.enq_date}</td>
                            <td>${response.createdBy}</td>
                            <td>${response.cust_id}</td>
                            <td>${response.sub}</td>
                            <td>${response.desc}</td>
                            <td>${response.status}</td>
                            <td>${response.assignedTo}</td>
                            <td>${response.ludate}</td>
                            <td>${response.luser}</td>
                            <td>
								<button class="btn btn-primary" id="viewButton">View</button>
					        </td>
					        <td>
							    <button class="btn btn-primary view-button" data-form="form2">Request data</button>
					        </td>
					        <td>
							    <button class="btn btn-warning view-button" data-form="form3">set Status</button>
					        </td>
					        <td>
							    <button class="btn btn-danger view-button" data-form="form4">Reject</button>
					        </td>
                        </tr>
               </c:forEach>
      	
		    </tbody>
		  </table>
		</div>


	<script>
	$(document).ready(function() {
		  var formOverlay = $('#formOverlay');
		  var formContainer = formOverlay.find('.form-container');
		  var tableData = []; // Array to store table data
		  // Populate the table with data and store it
		  var tableRows = $('.table tbody tr');
		  tableRows.each(function() {
		    var row = $(this);
		    var rowData = {
		      enqId: row.find('td:eq(0)').text(),
		      createdBy: row.find('td:eq(2)').text(),
		      custId: row.find('td:eq(3)').text(),
		      
		    };
		    tableData.push(rowData);
		  });
		  // Open form overlay when a view button is clicked
		  $('.view-button').click(function(e) {
		    e.stopPropagation();
		    var formId = $(this).data('form');
		    var form = $('#' + formId);
		    // Display the selected form and open the overlay
		    formOverlay.fadeIn();
		    formContainer.find('.hidden-form').hide();
		    form.show();

		    var enqId = $(this).closest('tr').find('td:eq(0)').text();
		    var createdBy = $(this).closest('tr').find('td:eq(2)').text();
		    var custId = $(this).closest('tr').find('td:eq(3)').text();
		    var status = $(this).closest('tr').find('td:eq(6)').text();

		    var rowData = getTableData(enqId);
		    // Populate the form fields with the row's details
		    form.find('#enqIdInput').val(enqId);
		    form.find('#createdByInput').val(createdBy);
		    form.find('#custIdInput').val(custId);
		    form.find('#status').val(status);
		  });
		  // Close form overlay when the close button is clicked
		  $('#closeFormButton').click(function(e) {
		    e.stopPropagation(); // Prevent event propagation to document
		    closeFormOverlay();
		  });
		  // Close form overlay when clicking outside the form container or form overlay
		  $(document).on('click', function(e) {
		    if (!formContainer.is(e.target) && formContainer.has(e.target).length === 0) {
		      closeFormOverlay();
		    }
		  });
		  
		  function closeFormOverlay() {
		    formOverlay.fadeOut();
		  }
		  // Function to retrieve the table data for the clicked row
		  function getTableData(enqId) {
		    // Find the corresponding row in the tableData array
		    var rowData = tableData.find(function(row) {
		      return row.enqId === enqId;
		    });
		    return rowData;
		  }
		
	});
	
	
	</script>


</body>
</html>
