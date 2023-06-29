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
    text-align: center;
    /* Center the content */
  }
  
  /* Add background color to odd rows */
  tr:nth-child(odd) {
    background-color: #f9f9f9;
  }
  
  /* Add hover effect to table rows */
  tr:hover {
    background-color: #e5e5e5;
  }
  
  .card-text {
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
    margin-top: 50px;
  }
  
  .progress-bar {
    position: relative;
    transition: width 0.5s ease-in-out;
    /* Add CSS transition for smooth animation */
  }
</style>
</head>
<body>

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
            <p>In Progress</p>
          </td>
          <td>
            <p>Card 8</p>
          </td>
          <td>
            <p>Card 9</p>
          </td>
          <td>
            <p>Card 10</p>
          </td>
          <td>
            <button class="viewButton">View</button>
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
            <p>Completed</p>
          </td>
          <td>
            <p>Card 8</p>
          </td>
          <td>
            <p>Card 9</p>
          </td>
          <td>
            <p>Card 10</p>
          </td>
          <td>
            <button class="viewButton">View</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="form-overlay">
    <div class="form-container">
      <button class="close"><i class="fas fa-times"></i></button>
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
    </div>
  </div>
  
<script>

$(document).ready(function() {
	
  $(".viewButton").click(function() {
	  
    var row = $(this).closest("tr"); // Get the closest table row to the clicked button
    var status = row.find("td:nth-child(7)").text().trim(); // Get the status from the current row
    var completedStages = 0; // Initialize the count of completed stages

    // Calculate the completed stages based on the status
    if (status === "In Progress") {
      completedStages = 20; // Set completed stages to 20 for "In Progress" status
    } else if (status === "Completed") {
      completedStages = 100; // Set completed stages to 100 for "Completed" status
    }

    var percentage = completedStages; // The completed stages directly represent the percentage

    $("#progress-bar").css("width", percentage + "%"); // Update the progress bar width
    $("#progress-bar").attr("aria-valuenow", percentage.toFixed(0)); // Update the aria-valuenow attribute
    $("#progress-bar").text(percentage.toFixed(0) + "%"); // Update the progress bar text
    $(".form-overlay").fadeIn();
  });

  $(".form-overlay").click(function(event) {
      if ($(event.target).closest(".form-container").length === 0) {
        $(".form-overlay").fadeOut();
      }
    });
  
  $(".close").click(function() {
    $(".form-overlay").fadeOut();
  });
 
  
});

</script>
</body>
</html>