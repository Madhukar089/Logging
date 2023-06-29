<!DOCTYPE html>
<html>
<head>
  <title>Edit Profile</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>

    .edit-profile-container {
      background: #fff;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .profile-picture {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
    }
  </style>
</head>
<body>




  <div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3 edit-profile-container">
        <div class="text-center">
          <h5>Current Profile Picture</h5>
          <img src="" alt="Profile Picture" class="profile-picture">
        </div>
        <div class="mt-4 text-center">
          <h5>Choose Profile Picture</h5>
          <input type="file" class="form-control-file" id="profilePicture" name="profilePicture">
        </div>
        <h3 class="text-center mb-4">Edit Profile</h3>
        <form action="updateProfile" method="post">
          <div class="form-group">
            <label for="fullName">Full Name</label>
            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name">
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
          </div>
          <div class="form-group">
            <label for="mobileno">Phone Number</label>
            <input type="number" class="form-control" id="mobileno" name="mobileno" placeholder="Enter your Phone Number">
          </div>
          <button type="submit" class="btn btn-primary btn-block">Update Profile</button>
        </form>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    // Add event listener to file input
    $(document).on('change', '#profilePicture', function(e) {
      // Get the selected file
      var file = e.target.files[0];

      // Create a FileReader object
      var reader = new FileReader();

      // Set the callback function for when file is loaded
      reader.onload = function(e) {
        // Get the data URL of the loaded file
        var dataURL = e.target.result;

        // Display the photo preview by setting the background image of the div
        $('.profile-picture').attr('src', dataURL);
      };

      // Read the file as data URL
      reader.readAsDataURL(file);
    });
  </script>
</body>
</html>