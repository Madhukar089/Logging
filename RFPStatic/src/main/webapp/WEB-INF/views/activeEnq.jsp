<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enquiries</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  
	  <style>
		  /* Add custom styles to the table */
		  .table {
		    border: 1px solid #ddd; /* Add border to the table */
		    border-collapse: collapse; /* Collapse borders for a cleaner look */
		    width: 100%; /* Set table width to 100% */
		  }
		
		  th, td {
		    border: 1px solid #ddd; /* Add border to table cells */
		    padding: 10px; /* Add padding to cells */
		    text-align: center;
		  }
		  
		   /* Add hover effect to table rows */
		  tr:hover {
		    background-color: Gray;
		  }
		  tr:hover th{
		  	color:white;
		  	background-color: #000000;
		  }
		  /* Add transitions to table rows */
		  tr {
		    transition: background-color 0.3s;
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
	        <input type="password" class="form-control" name="confirm_password" placeholder="Confirm your password">
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
	        <input type="password" class="form-control" name="confirm_password" placeholder="Confirm your password">
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
	        <input type="password" class="form-control" name="confirm_password" placeholder="Confirm your password">
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
		      <tr>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 1</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 2</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 3</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 4</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 5</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 6</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 7</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 8</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 9</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 10</p>
		            </div>
		          </div>
		        </td>
		        <td>
		        <div class="card">
					<button class="btn btn-primary view-button" data-form="form1">View</button>
				    </div>
		        </td>
		        <td>
		        <div class="card">
				    <button class="btn btn-primary view-button" data-form="form2">Request data</button>
				</div>
		        </td>
		        <td>
		        <div class="card">
				    <button class="btn btn-warning view-button" data-form="form3">set Status</button>
				</div>
		        </td>
		        <td>
		        <div class="card">
				    <button class="btn btn-danger view-button" data-form="form4">Reject</button>
				    </div>
		        </td>
		        
		      </tr>
		      <tr>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 1</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 2</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 3</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 4</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 5</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 6</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 7</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 8</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 9</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 10</p>
		            </div>
		          </div>
		        </td>
		        <td>
		        <div class="card">
					<button class="btn btn-primary view-button" data-form="form1">View</button>
				    </div>
		        </td>
		        <td>
		        <div class="card">
				    <button class="btn btn-primary view-button" data-form="form2">Request data</button>
				</div>
		        </td>
		        <td>
		        <div class="card">
				    <button class="btn btn-warning view-button" data-form="form3">set Status</button>
				</div>
		        </td>
		        <td>
		        <div class="card">
				    <button class="btn btn-danger view-button" data-form="form4">Reject</button>
				    </div>
		        </td>
		      </tr>
		      <tr>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 1</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 2</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 3</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 4</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 5</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 6</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 7</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 8</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 9</p>
		            </div>
		          </div>
		        </td>
		        <td>
		          <div class="card">
		            <div class="card-body">
		              <p class="card-text">Card 10</p>
		            </div>
		          </div>
		        </td>
		        <td>
		        <div class="card">
					<button class="btn btn-primary view-button" data-form="form1">View</button>
				    </div>
		        </td>
		        <td>
		        <div class="card">
				    <button class="btn btn-primary view-button" data-form="form2">Request data</button>
				</div>
		        </td>
		        <td>
		        <div class="card">
				    <button class="btn btn-warning view-button" data-form="form3">set Status</button>
				</div>
		        </td>
		        <td>
		        <div class="card">
				    <button class="btn btn-danger view-button" data-form="form4">Reject</button>
				    </div>
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