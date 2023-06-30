<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Form to Communicate</title>
  <!-- Add Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  
</head>
<body>
  <div class="center-form">
    <div class="container">
      <form id="communicationForm">
        <div class="form-group">
          <label for="message">Anything you want to say? Please describe it here</label>
          <textarea class="form-control" id="message" name="message" rows="5"></textarea>
        </div>
        <div class="form-group">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="approveRejectCheckbox">
            <label class="form-check-label" for="approveRejectCheckbox">Enable Approve and Reject</label>
          </div>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-primary" id="submitButton">Submit</button>
          <button type="button" class="btn btn-primary" id="approveButton" data-toggle="modal" data-target="#approveModal" disabled>Approve</button>
          <button type="button" class="btn btn-danger" id="rejectButton" data-toggle="modal" data-target="#rejectModal" disabled>Reject</button>
        </div>
      </form>
    </div>
  </div>
<!-- Approve Modal -->
  <div class="modal fade" id="approveModal" tabindex="-1" role="dialog" aria-labelledby="approveModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="approveModalLabel">Confirmation</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Really want to approve?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-primary">Approve</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Reject Modal -->
  <div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="rejectModalLabel">Confirmation</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Really want to reject?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-danger">Reject</button>
        </div>
      </div>
    </div>
  </div>
  <div id="responseContainer"></div>
  <input type="hidden" id="rfprId" value="<%= request.getParameter("rfpr") %>">
  <!-- Add Bootstrap JS (optional, but required for some features) -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
  
  $(document).ready(function() {
	  var rfprId = $('#rfprId').val();
	  var responseReceived = false; // Variable to track response status

	  $('#approveRejectCheckbox').change(function() {
	    var isChecked = $(this).is(':checked');
	    $('#submitButton').prop('disabled', isChecked);
	    $('#approveButton, #rejectButton').prop('disabled', !isChecked);
	  });

	  $('#communicationForm').submit(function(event) {
	    event.preventDefault(); // Prevent form submission

	    // Check if a response has already been received
	    if (responseReceived) {
	      $('#responseContainer').append('<p>Response already received. Ignoring Submission request.</p>');
	      return; // Stop the form submission
	    }

	    // Get form data
	    var formData = {
	      message: $('#message').val(),
	      rfpr_id: rfprId
	    };
	    console.log(formData);

	    // Send AJAX request to submit the form
	    $.ajax({
	      type: 'POST',
	      url: 'your-controller-url', // Replace with your controller URL
	      data: JSON.stringify(formData),
	      contentType: 'application/json',
	      success: function(response) {
	        // Handle success response
	        console.log(response);

	        // Append response to the page
	        $('#responseContainer').append('<p>Response: ' + response + '</p>');

	        // Update response status
	        responseReceived = true;
	      },
	      error: function(error) {
	        // Handle error response
	        console.error(error);
	      }
	    });
	  });

	  // Handle Approve button click
	  $('#approveModal').on('click', '.btn-primary', function() {
	    // Check if a response has already been received
	    if (responseReceived) {
	      $('#responseContainer').append('<p>Response already received. Ignoring Approval request.</p>');
	      return; // Stop the approval request
	    }

	    var formData = {
	      rfpr_id: rfprId,
	      status: 'approved'
	    };

	    // Send AJAX request to handle the approval
	    $.ajax({
	      type: 'POST',
	      url: 'your-approve-controller-url', // Replace with your approve controller URL
	      data: JSON.stringify(formData),
	      contentType: 'application/json',
	      success: function(response) {
	        // Handle success response
	        console.log(response);

	        // Append response to the page
	        $('#responseContainer').append('<p>Response: ' + response + '</p>');

	        // Update response status
	        responseReceived = true;
	      },
	      error: function(error) {
	        // Handle error response
	        console.error(error);
	      }
	    });
	  });

	  // Handle Reject button click
	  $('#rejectModal').on('click', '.btn-danger', function() {
	    // Check if a response has already been received
	    if (responseReceived) {
	    	$('#responseContainer').append('<p>Response already received. Ignoring rejection request.</p>');
	      return; // Stop the rejection request
	    }

	    var formData = {
	      rfpr_id: rfprId,
	      status: 'rejected'
	    };

	    // Send AJAX request to handle the rejection
	    $.ajax({
	      type: 'POST',
	      url: 'your-reject-controller-url', // Replace with your reject controller URL
	      data: JSON.stringify(formData),
	      contentType: 'application/json',
	      success: function(response) {
	        // Handle success response
	        console.log(response);

	        // Append response to the page
	        $('#responseContainer').append('<p>Response: ' + response + '</p>');

	        // Update response status
	        responseReceived = true;
	      },
	      error: function(error) {
	        // Handle error response
	        console.error(error);
	      }
	    });
	  });
	});

  </script>
</body>
</html>
