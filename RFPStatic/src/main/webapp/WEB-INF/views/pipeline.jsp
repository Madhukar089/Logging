<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Progress Bar and Timeline</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <style>
    .timeline {
      position: relative;
      list-style: none;
      padding: 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 50px;
    }

    .timeline::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 0;
      height: 2px;
      width: 100%;
      background-color: #e9ecef;
      z-index: -1;
    }

    .timeline-step {
      position: relative;
      width: 20%;
      text-align: center;
    }

    .timeline-step::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 15px;
      height: 15px;
      border-radius: 50%;
      background-color: #007bff;
      border: 2px solid #fff;
    }

    .timeline-step.active::before {
      background-color: #ffc107;
    }

    .timeline-content {
      padding: 20px;
      background-color: #f8f9fa;
      border-radius: 5px;
      box-shadow: 0 1px 6px rgba(0, 0, 0, 0.1);
    }

    .timeline-content h4 {
      margin-top: 0;
    }

    .progress {
      height: 20px;
      margin-bottom: 20px;
      margin-top: 50px;'
    }

    .progress-bar {
      position: relative;
      transition: width 0.5s ease-in-out; /* Add CSS transition for smooth animation */
    }
    
    
  </style>
</head>
<body>
  <div class="container">
    <div class="progress">
      <div id="progress-bar" class="progress-bar progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
    </div>

    <ul class="timeline">
      <li class="timeline-step">
        <div class="timeline-content">
          <h4>Step 1</h4>
          <p>Content for Step 1</p>
        </div>
      </li>
      <li class="timeline-step">
        <div class="timeline-content">
          <h4>Step 2</h4>
          <p>Content for Step 2</p>
        </div>
      </li>
      <li class="timeline-step">
        <div class="timeline-content">
          <h4>Step 3</h4>
          <p>Content for Step 3</p>
        </div>
      </li>
      <li class="timeline-step">
        <div class="timeline-content">
          <h4>Step 4</h4>
          <p>Content for Step 4</p>
        </div>
      </li>
      <li class="timeline-step">
        <div class="timeline-content">
          <h4>Step 5</h4>
          <p>Content for Step 5</p>
        </div>
      </li>
    </ul>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  $(document).ready(function() {
	  // Configure the total number of steps
	  var totalSteps = $('.timeline-step').length;

	  function updateProgressBar(stepIndex) {
	    // Calculate the progress percentage
	    var progress = ((stepIndex + 1) / totalSteps) * 100;

	    // Set the progress percentage on the progress bar
	    $('.progress-bar').css('width', progress + '%').attr('aria-valuenow', progress);

	    // Update the progress bar label with the progress percentage
	    $('.progress-bar').text(progress.toFixed(0) + '%');

	    // Remove the fade-in class
	    $('.progress-bar').removeClass('fade-in');

	    // Add the fade-in class after a small delay
	    setTimeout(function() {
	      $('.progress-bar').addClass('fade-in');

	      // If the progress is 100%, remove the fade-in class after the animation completes
	      if (progress >= 100) {
	        setTimeout(function() {
	          $('.progress-bar').removeClass('fade-in');
	        }, 500); // Delay value should match the fade-in animation duration
	      }
	    }, 100);
	  }


	  // Function to complete a stage
	  function completeStage(stageNumber) {
	    var nextStepIndex = stageNumber; // Replace with the index of the next step

	    // Remove the fade-in class
	    $('.progress-bar').removeClass('fade-in');

	    // Wait for the fade-out animation to complete
	    setTimeout(function() {
	      // Update the progress bar
	      updateProgressBar(nextStepIndex);

	      // If the progress is 100%, remove the fade-in class after the animation completes
	      if (nextStepIndex === totalSteps - 1) {
	        setTimeout(function() {
	          $('.progress-bar').removeClass('fade-in');
	        }, 500); // Delay value should match the fade-out animation duration
	      }
	    }, 500); // Delay value should match the fade-out animation duration
	  }
	  
	// Get the stage value from the model
	  var stageValue = 2; // Replace this with the actual stage value from the model

	  // Call completeStage function with the stage value
	  completeStage(stageValue);
	});

  </script>
</body>
</html>