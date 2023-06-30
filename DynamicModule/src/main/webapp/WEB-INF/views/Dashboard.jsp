<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Dashboard Example</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  
  	<style>
		  
		  .dashboard-content {
		    min-height: 100vh; /* Set the minimum height to 100% of the viewport height */
		    background-color: #FFFFFF;
		    position: relative;
		    z-index: 1;
		  }
		  .sidebar {
		    position: absolute;
		    top: 0;
		    left: -200px;
		    height: 100%;
		    width: 200px;
		    background-color: #000000;
		    z-index: 2;
		    overflow-y: auto; /* Make the sidebar scrollable */
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		  }
		  .sidebar.active {
		    left: 0;
		  }
		  .sidebar ul {
		    list-style-type: none;
		    padding: 0;
		  }
		  .sidebar ul li {
		    margin-bottom: 10px;
		  }
		  @media (min-width: 768px) {
		    .dashboard-content.active {
		      margin-left: 200px;
		    }
		  }
		  
		  .card{
		  	height: 3rem;
		  	display: flex;
		  	align-items: center;
		  	justify-content: center;
		  }
		  .card-title{
		  	margin: -10px; 
		  	font-size: 18px;
		  }
		  
		  .sidebar .card-item:hover {
		    transform: scale(1.05);
		    transition: transform 0.3s ease;
		  }
		 
		  .nav-link {
		    color: white !important;
		  }
		  .nav-link:hover{
		    transform: scale(1.05);
		    transition: transform 0.3s ease;
		  }
		  
		  .sidebar .card-item:first-child {
		    margin-top: 5px;
		  }
		  .sidebar .card-item{
		  	width: 90%;
		  	color: black;
		  	background-color: #FFFFFF;
		  }
		  
		  #numberForm {
			  display: flex;
			  justify-content: center;
			  align-items: center;
		  }
		  .card-item.active{
			 background-color:#1E90FF !important;
			 color: white;
		  }
		  /* Custom styles for cards inside dropdown menu */
		  .dropdown-menu {
		    margin-top: 5px;
		    margin-bottom: 0;
		    width: 50px; /* Adjust the width as desired */
		  }
		
			.dropdown-menu .card {
			  width: 100%;
			  margin: 0;
			  border: none;
			  border-radius: 10px;
			  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
			  transition: all 0.3s ease;
			  background-color: #f8f9fa; /* Set the background color */
			}
		  .dropdown-menu .card-body {
		    padding: -10px; /* Adjust the padding as desired */
		    text-align: center;
		  }
		  .dropdown-menu .card-title {
		    margin-bottom: 0;
		    font-size: 16px;
		  }
		  .dropdown-menu .card-item:hover {
		    background-color: #e9ecef; /* Set the background color on hover */
		    cursor: pointer;
		    transform: scale(1.05);
		  }
		  .dropdown-menu.dropdown-menu-center {
			  transform: translateX(-50%);
			  left: 50% !important;
			  right: auto !important;
			}
		.navbar-custom {
            background-color: #000000;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .navbar-text {
            color: white;
        }
        .navbar-custom:hover{
        	color:white;
        }
	</style>

</head>
<body>

  <nav class="navbar navbar-custom">
	  <ul class="nav justify-content-start">
	    <li class="nav-item">
	      <a class="navbar-brand" onclick="toggleSidebar()">
	        <i class="fas fa-bars" style="margin-right:7px;"></i>RFP Tracker
	      </a>
	    </li>
	  </ul>
	  
	  
	  <ul class="nav nav-pills justify-content-end">
	  	  <li class="nav-item">
		    <a class="nav-link" href="maindash" id="home" onclick="activateTab(this)">Home<i class="fas fa-home" style="margin-left:5px;"></i></a>
		  </li>
		  
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
		     onclick="activateTab(this)">
		      Profile<i class="fas fa-user-circle" style="margin-left:5px;"></i>
		    </a>
			    <div class="dropdown-menu dropdown-menu-center" aria-labelledby="navbarDropdown">
			      
			      <div class="card mb-0 card-item" id="profile">
			          <div class="card-body">
			            <h5 class="card-title">Profile<i class="fas fa-user-circle" style="margin-left:5px;"></i></h5>
			            <a href="profile" class="stretched-link"></a>
			          </div>
	        		</div>
			      
			      <div class="card mb-0 card-item" id="createAcc">
		          <div class="card-body">
		            <h5 class="card-title">Create Account<i class="fas fa-user-plus" style="margin-left:5px;"></i></h5>
		            <a href="createAcc" class="stretched-link"></a>
		          </div>
		        </div>
		        
		        <div class="card mb-1 card-item" id="changePw">
			          <div class="card-body">
			            <h5 class="card-title">Change Password<i class="fas fa-lock" style="margin-left:5px;"></i></h5>
			            <a href="passwordReset" class="stretched-link"></a>
			          </div>
		          </div>
			        <div class="card mb-0 card-item" id="logout">
			          <div class="card-body">
			            <h5 class="card-title">Logout<i class="fas fa-sign-out-alt" style="margin-left:5px;"></i></h5>
			            <a href="logout1" class="stretched-link"></a>
			          </div>
	        		</div>
		    	</div>
		  </li>
		  
		</ul>
	</nav>

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <!-- Empty space for dashboard content -->
        <div class="dashboard-content" id="dashboard-content">
          <div id="pipelineContainer"></div>
        </div>
        <div class="sidebar" id="sidebar">
  			<!-- Sidebar with cards -->
		  <div class="card bg-secondary mb-3 card-item" id="enquiryCard" onclick="activateCard(this)">
		    <div class="card-body">
		      <h5 class="card-title">Enquiries</h5>
		      <a href="Enquiries" class="stretched-link"></a>
		    </div>
		  </div>
		  <div class="card bg-secondary mb-3 card-item" id="rfpCard" onclick="activateCard(this)">
		    <div class="card-body">
		      <h5 class="card-title">RFPs</h5>
		      <a href="RFPs" class="stretched-link"></a>
		    </div>
		  </div>
		  <div class="card bg-secondary mb-3 card-item" id="pipelineCard" onclick="activateCard(this)">
		    <div class="card-body">
		      <h5 class="card-title">Pipeline</h5>
		      <a href="pipeline" class="stretched-link"></a>
		    </div>
		  </div>
		  <div class="card bg-secondary mb-3 card-item" id="customerCard" onclick="activateCard(this)">
		    <div class="card-body">
		      <h5 class="card-title">Customers</h5>
		      <a href="Customers" class="stretched-link"></a>
		    </div>
		  </div>
		  
		 <div class="card bg-secondary mb-3 card-item" id="adminsCard" onclick="activateCard(this)">
		    <div class="card-body">
		      <h5 class="card-title">Admin Users</h5>
		      <a href="adminUsers" class="stretched-link"></a>
		    </div>
		    </div>
		    
		 <div class="card bg-secondary mb-3 card-item" id="accountsCard" onclick="activateCard(this)">
		    <div class="card-body">
		      <h5 class="card-title">Accounts closed</h5>
		      <a href="accClosed" class="stretched-link"></a>
		    </div>   
		 </div>
		  
		  
		</div>
		  
		</div>

      </div>
    </div>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script>

  function activateTab(element) {
	    $('.nav-link').removeClass('active');
	    $(element).addClass('active');
	    $('.card-item').removeClass('active');
  }
  
  function activateCard(element) {
	  $('.card-item').removeClass('active');
	  $(element).addClass('active');
	  $('.nav-link').removeClass('active');
	}
  
  var navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(function(link) {
    // Check if the link is not part of the dropdown menu
    if (!link.classList.contains('dropdown-toggle')) {
      link.addEventListener('click', loadContent);
    }
  });
  function loadContent(event) {
	  event.preventDefault();
	  var link = $(this);
	  var url = link.attr('href');
	  var dashboardContent = $('#dashboard-content');
	  
	  $.ajax({
	    url: url,
	    method: 'GET',
	    success: function(response) {
	      dashboardContent.html(response);
	    },
	    error: function(xhr, status, error) {
	      console.error('Error: ' + error);
	    }
	  });
	}

  function toggleSidebar() {
      var sidebar = document.getElementById('sidebar');
      var dashboardContent = document.getElementById('dashboard-content');
      sidebar.classList.toggle('active');
      dashboardContent.classList.toggle('active');
    }
  
  $(document).ready(function() {
	  
	    loadJSPContent("maindash");
	    $('#enquiryCard').click(function(e) {
	        e.preventDefault();
	        loadJSPContent($(this).find('a').attr('href'));
	      });
	    $('#rfpCard').click(function(e) {
	        e.preventDefault();
	        loadJSPContent($(this).find('a').attr('href'));
	      });
	    $('#customerCard').click(function(e) {
	        e.preventDefault();
	        loadJSPContent($(this).find('a').attr('href'));
	      });
	    $('#pipelineCard').click(function(e) {
	        e.preventDefault();
	        loadJSPContent($(this).find('a').attr('href'));
	      });
	    $('#createAcc').click(function(e) {
	        e.preventDefault();
	        loadJSPContent($(this).find('a').attr('href'));
	      });
	    
	    $('#profile').click(function(e) {
	        e.preventDefault();
	        loadJSPContent($(this).find('a').attr('href'));
	      });
	    $('#changePw').click(function(e) {
	        e.preventDefault();
	        loadJSPContent($(this).find('a').attr('href'));
	      });
	    
	    
	    $('.home').click(function(e) {
	      e.preventDefault();
	      loadJSPContent("maindash");
	    });
	    
	    $('#adminsCard').click(function(e) {
	        e.preventDefault();
	        loadJSPContent($(this).find('a').attr('href'));
	      });
	    $('#accountsCard').click(function(e) {
	        e.preventDefault();
	        loadJSPContent($(this).find('a').attr('href'));
	      });
	    
	    
	    function loadJSPContent(url) {
	      $.ajax({
	        url: url,
	        dataType: 'html',
	        success: function(response) {
	          $('#dashboard-content').html(response);
	        },
	        error: function(xhr, status, error) {
	          console.log("Error loading JSP content: " + error);
	        }
	      });
	    }
	   
	    });
	

	    
      
  </script>
</body>
</html>