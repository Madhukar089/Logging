<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Signup</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
  <div class="container" >
    <div class="row justify-content-center">
      <div class="col-md-6">
        <h2 class="text-center mt-5">Admin Signup</h2>
        <form  id="myForm" method="post">
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
      </div>
      
      
    </div>
  </div>
  
  <script type="text/javascript">
  $(document).ready(function() {
	  // Attach a click event handler to the element with id "myButton"
	  $('#signup').click(function(event) {
		 event.preventDefault();
		  var formData = $('#myForm').serialize();
	    // Make an Ajax request when the button is clicked
	    $.ajax({
	      url: 'Signup',
	      type: 'POST',
	      data: formData,
	     
	      success: function(response) {
	    	  console.log(formData);
	    	  
	    	  
	        $('#dashboard-content').html(response);
	      },
	      error: function(xhr, status, error) {
	        // Request failed, handle the error
	        console.log('Request failed with status code ' + xhr.status);
	      }
	    });
	  });
	});

  
  
  </script>
</body>
</html>