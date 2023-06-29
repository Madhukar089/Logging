<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-abcdef1234567890" crossorigin="anonymous" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-black  ">
    <!-- Container wrapper -->
    <div class="container-fluid">
        <!-- Navbar brand -->
        <a class="navbar-brand mt-2 mt-lg-0" href="#">
    <h5>image logo </h5>
        </a>
        <!-- Toggle button -->
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Team</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Projects</a>
                </li>
            </ul>
            <!-- Left links -->

            <!-- Right elements -->
            <div class="d-flex align-items-center justify-content-start">
                <!-- Icon -->
                <a class="text-reset me-3" href="#">
                    <button id="openFormButton" class="btn btn-success">Enquiry Form</button>
                </a>

             </div> 
            <!-- Right elements -->
        </div>
        <!-- Collapsible wrapper -->
    </div>
    <!-- Container wrapper -->
</nav>
<!-- Navbar -->



<!-- middle empty page fill some data with comapany information-->

<div style="width:800px; height:500px; margin:20px; margin-left:330px; background-color:black;  class="container-fluid ">

<h1 style="background-color:white">data to be arranged</h1>
</div>










<div id="formModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Post an enquiry</h5>
        <button type="button" id="close"   class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form  action="enquiry" method="POST">
  <!-- 2 column grid layout with text inputs for the first and last names -->
  <div class="row mb-4">
    <div class="col">
      <div class="form-outline">
        <input name="firstname" type="text" id="firstname" class="form-control" />
        <label class="form-label" for="firstname">First name</label>
      </div>
    </div>
    <div class="col">
      <div class="form-outline">
        <input name="lastname" type="text" id="lastname" class="form-control" />
        <label class="form-label" for="lastname">Last name</label>
      </div>
    </div>
  </div>

  <!-- Text input -->
  <div class="form-outline mb-4">
    <input name="companyname" type="text" id="companyname" class="form-control" />
    <label class="form-label" for="companyname">Company name</label>
  </div>

<!-- company type -->

<select name="type" class="form-select  mb-4" >
  <option selected disabled="disabled" >Company type</option>
    <option value="INDV">INDV</option>
    <option value="GOVT">GOVT</option>
    <option value="CORP">CORP</option>
    <option value="NPOR">NPOR</option>
</select>

  <div class="form-outline mb-4">
    <input name="companywebsite" type="text" id="companywebsite" class="form-control" />
    <label class="form-label" for="companywebsite">Company website</label>
  </div>
 

  

  <!-- Text input -->
  <div class="form-outline mb-4">
    <input name="address" type="text" id="address" class="form-control" />
    <label class="form-label" for="address">Address</label>
  </div>

  <!-- Email input -->
  <div class="form-outline mb-4">
    <input name="email" type="email" id="email" class="form-control" />
    <label class="form-label" for="email">Email</label>
  </div>

  <!-- Number input -->
  <div class="form-outline mb-4">
    <input name="phone" type="number" id="phone" class="form-control" />
    <label class="form-label" for="phone">Phone</label>
  </div>

  <!-- Message input -->
  <div class="form-outline mb-4">
    <textarea name="desc" class="form-control" id="desc" rows="4"></textarea>
    <label class="form-label" for="desc">Description</label>
  </div>
<div class="form-outline mb-4">
  <label for="formFile" class="form-label">upload your requirement files</label>
  <input class="form-control" type="file" id="formFile">
</div>

  <!-- Checkbox -->
  <div class="form-check d-flex justify-content-center mb-4">
    <input class="form-check-input me-2" type="checkbox" value="" id="newaccount" checked />
    <label class="form-check-label" for="newaccount"> Create an account? </label>
  </div>

  <!-- Submit button -->
  <div class="modal-footer">
      <button type="submit" class="btn btn-primary btn-lg">submit</button>
      </div>
</form>
      </div>
      
    </div>
  </div>
</div>


<!-- Footer -->
<footer class="bg-black text-center text-white fixed-bottom ">
    <!-- Grid container -->
    <div class="container p-2 pb-0">
        <!-- Section: Social media -->
        <section class="mb-2">
            <!-- Facebook -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">fb</a>

            <!-- Twitter -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">twitter</a>

           


            <!-- Linkedin -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">linkedin</a>

            <!-- Github -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">github</a>
        </section>
        <!-- Section: Social media -->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        � 2023 Copyright:
        <a class="text-white"  href="https://www.pennanttech.com/">vist us</a>
    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->




<script  type="text/javascript">

$(document).ready(function() {
	  // Initialize the modal
	  $('#formModal').modal({
	    show: false
	  });

	  // Add a click event listener to the button
	  $('#openFormButton').click(function() {
	    // Show the form popup
	    $('#formModal').modal('show');
	  });
	});

//close
$('#close').click(function() {
    // Show the form popup
    $('#formModal').modal('hide');
  });

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <!-- Include Bootstrap JS -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>