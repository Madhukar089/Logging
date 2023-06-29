<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login Page</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
 
   
    .login-container {
      background: #fff;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    
    .login-container .message{
    	justify-content:center;
    }
  </style>
</head>
<body>
  
    <div class="row">
    	<div class="container">
		  <div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
		    <div class="message text-center">
		      <p>${message}</p>
		    </div>
		  </div>
      <div class="col-md-6 offset-md-3 login-container">
        <h3 class="text-center mb-4">Admin Login</h3>
        <form action="dashboard" method="post">
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" placeholder="Enter your email">
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input  name="password" type="password" class="form-control" id="password" placeholder="Enter your password">
          </div>
          <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>