<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RFPs</title>
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
	      <div class="form-group">
	        <label for="username">Username</label>
	        <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username">
	      </div>
	      <div class="form-group">
	        <label for="password">Password</label>
	        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
	      </div>
	      <div class="form-group">
	        <label for="confirm-password">Confirm Password</label>
	        <input type="password" class="form-control"  id="confirm-password" name="confirm_password" placeholder="Confirm your password">
	      </div>
	      <button type="submit" id="signup" class="btn btn-primary btn-block">Sign Up</button>
	    </form>
	    
	    <form id="form2" class="hidden-form">
	      <div class="form-group">
	        <label for="password">Password</label>
	        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
	      </div>
	      <div class="form-group">
	        <label for="confirm-password">Confirm Password</label>
	        <input type="password" class="form-control" id="confirm-password" name="confirm_password" placeholder="Confirm your password">
	      </div>
	      <button type="submit" id="signup" class="btn btn-primary btn-block">Sign Up</button>
	    </form>
	    
	    <form id="form3" class="hidden-form">
	    <div class="form-group">
	        <label for="username">Username</label>
	        <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username">
	      </div>
	      
	      <div class="form-group">
	        <label for="confirm-password">Confirm Password</label>
	        <input type="password" class="form-control" id="confirm-password" name="confirm_password" placeholder="Confirm your password">
	      </div>
	      <button type="submit" id="signup" class="btn btn-primary btn-block">Sign Up</button>
	    </form>
	    
	    <form id="form4" class="hidden-form">
	    
	      <div class="form-group">
	        <label for="confirm-password">Confirm Password</label>
	        <input type="password" class="form-control" name="confirm_password" placeholder="Confirm your password">
	      </div>
	      <button type="submit" id="signup" class="btn btn-primary btn-block">Sign Up</button>
	    </form>
	    
	  </div>
	</div>


	<section class="FilterDiv" style="background-color: #ADD8E6; padding: 20px;">
	  <form class="form-inline">
	    <div class="form-group mr-3">
	      <label for="byId">ById:</label>
	      <select class="form-control ml-2" id="byId">
	        <!-- Add options for ById dropdown -->
	        <option selected disabled>choose ID</option>
	        <option value="id1">Id 1</option>
	        <option value="id2">Id 2</option>
	        <option value="id3">Id 3</option>
	      </select>
	    </div>
	    <div class="form-group mr-3">
	      <label for="byStatus">ByStatus:</label>
	      <select class="form-control ml-2" id="byStatus">
	        <!-- Add options for ByStatus dropdown -->
	        <option selected disabled>choose Status</option>
	        <option value="inProgress">Active</option>
	        <option value="completed">Closed</option>
	      </select>
	    </div>
	    <div class="form-group">
	      <label for="byDate">ByDate:</label>
	      <select class="form-control ml-2" id="byDate">
	        <!-- Add options for ByDate dropdown -->
	        <option selected disabled>choose Date</option>
	        <option value="date1">Date 1</option>
	        <option value="date2">Date 2</option>
	        <option value="date3">Date 3</option>
	      </select>
	    </div>
	  </form>
	</section>
	
	
	<div class="table-responsive">
		  <table class="table">
		    <thead>
		      <tr>
		        <th scope="col">Rfpr_ID</th>
		        <th scope="col">Enqr_ID</th>
		        <th scope="col">Assigned To</th>
		        <th scope="col">Subject</th>
		        <th scope="col">Intro Note</th>
		        <th scope="col">Rfpc_ID</th>
		        <th scope="col">createdBy_ID</th>
		        <th scope="col">lastLoginDate</th>
		        <th scope="col">Status</th>
		        <th scope="col"></th>
		        <th scope="col"></th>
		        <th scope="col"></th>
		        <th scope="col"></th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>
		              <p>Card 1</p>
		        </td>
		        <td>
		              <p>Card 2</p>
		        </td>
		        <td>
		              <p>Card 3</p>
		        </td>
		        <td>
		              <p>Card 4</p>
		        </td>
		        <td>
		              <p>Card 5</p>
		        </td>
		        <td>
		              <p>Card 6</p>
		        </td>
		        <td>
		              <p>Card 7</p>
		        </td>
		        <td>
		              <p>Card 8</p>
		        </td>
		        <td>
		              <p>Card 9</p>
		        </td>
		        <td>
					<button class="btn btn-primary view-button" data-form="form1">View</button>
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
		      <tr>
		        <td>
		              <p>Card 1</p>
		        </td>
		        <td>
		              <p>Card 2</p>
		        </td>
		        <td>
		              <p>Card 3</p>
		        </td>
		        <td>
		              <p>Card 4</p>
		        </td>
		        <td>
		              <p>Card 5</p>
		        </td>
		        <td>
		              <p>Card 6</p>
		        </td>
		        <td>
		              <p>Card 7</p>
		        </td>
		        <td>
		              <p>Card 8</p>
		        </td>
		        <td>
		              <p>Card 9</p>
		        </td>
		        <td>
					<button class="btn btn-primary view-button" data-form="form1">View</button>
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
		      <tr>
		        <td>
		              <p>Card 1</p>
		        </td>
		        <td>
		              <p>Card 2</p>
		        </td>
		        <td>
		              <p>Card 3</p>
		        </td>
		        <td>
		              <p>Card 4</p>
		        </td>
		        <td>
		              <p>Card 5</p>
		        </td>
		        <td>
		              <p>Card 6</p>
		        </td>
		        <td>
		              <p>Card 7</p>
		        </td>
		        <td>
		              <p>Card 8</p>
		        </td>
		        <td>
		              <p>Card 9</p>
		        </td>
		        <td>
					<button class="btn btn-primary view-button" data-form="form1">View</button>
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
		      <!-- Add more rows as needed -->
		    </tbody>
		  </table>
		</div>
	
  
	<script>
	$(document).ready(function() {
		  var formOverlay = $('#formOverlay');
		  var formContainer = formOverlay.find('.form-container');

		  // Open form overlay when a view button is clicked
		  $('.view-button').click(function(e) {
		    e.stopPropagation(); // Prevent event propagation to document
		    var formId = $(this).data('form');
		    var form = $('#' + formId);

		    // Display the selected form and open the overlay
		    formOverlay.fadeIn();
		    formContainer.find('.hidden-form').hide();
		    form.show();
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
		});


	</script>
	
	
</body>
</html>