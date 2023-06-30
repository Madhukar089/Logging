<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Details</title>
    <!-- Add Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/css/bootstrap.min.css">
    <style>
    /* Add space between form elements */
    .form-group {
        margin-bottom: 1.5rem;
    }
    
    /* Center the heading */
    .text-left {
        text-align: left;
        margin-top: 40px;
    }
    
    /* Adjust the form size */
    .col-md-6 {
        max-width: 400px;
        margin: 0 auto;
    }
   
    
    /* Style the table */
    table {
        width: 100%;
    }
    
    /* Add padding to table cells */
    td, th {
        padding: 10px;
    }
    
    /* Style the overlay */
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 9999;
    }
    
    /* Style the preview container */
    .preview-container {
        background-color: #fff;
        padding: 20px;
        max-width: 600px;
        width: 80%;
        max-height: 80%;
        overflow-y: auto;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    
    /* Style the response message */
    #response-message {
        margin-top: 20px;
        padding: 10px;
        font-weight: bold;
        color: #333;
    }
    
		  
</style>

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>

</head>
<body>

	
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
        	<h4 class="text-left mb-4">Request Details</h4>
        	
            <form id="enquiry-form">
                
                <div class="form-group">
                    <label>Enquire Id:</label>
                    <input id="enqrId" name="enqId" class="form-control" value="${enquiryDetails.enqId}" disabled>
                </div>
                <div class="form-group">
                    <label>Customer Id:</label>
                    <input id="custId" name="custId" class="form-control" value="${enquiryDetails.custId}" disabled>
                </div>
                <div class="form-group">
                    <label>Created By:</label>
                    <input type="text" id="createdBy" class="form-control" name="createdby" value="${enquiryDetails.createdBy}" disabled>
                </div>
                <div class="form-group">
                    <label>Purpose:</label>
                    <input type="text" id="purpose" class="form-control" name="purpose" value="${enquiryDetails.purpose}" disabled>
                </div>
                
                <div class="form-group">
                    <label>Status:</label>
                    <input type="text" id="status" class="form-control" value="${enquiryDetails.status}" disabled>
                </div>
                <div id="fields-container"></div>
                <button type="button" class="btn btn-primary" onclick="addField()">Add Field</button>
                <button type="button" class="btn btn-primary" onclick="previewFields()">Preview</button>
                
                <!-- Add a hidden input field to store the dynamic field data -->
                <input type="hidden" id="dynamicFieldData" name="dynamicFieldData" value="">
            </form>
        </div>
        
        <div class="col-md-6">
            <!-- Table -->
            <h4 class="text-left mb-4">Previous Responses</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Enquire Id</th>
                        <th>Iteration Index</th>
                        <th>Field Id</th>
                        <th>Field Label</th>
                        <th>Field Response</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${CustomerResponse}" var="response">
                        <tr>
                            <td>${response.enqr_id}</td>
                            <td>${response.enqr_iteration_index}</td>
                            <td>${response.enqr_fieldid}</td>
                            <td>${response.label}</td>
                            <td>${response.enqr_value}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Add Bootstrap JS script and custom JavaScript code here -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
<script>
    var fieldNumber = 1;
    function addField() {
        var fieldContainer = document.getElementById("fields-container");
        // Prompt for field type
        var fieldType = prompt("Enter the field type ('input', 'dropdown', or 'documentUpload'):");
        // Create a new field div
        var fieldDiv = document.createElement("div");
        fieldDiv.classList.add("form-group");
        // Create the label for the field
        var label = prompt("Enter the label for the field:");
        // Create the label element
        var labelElement = document.createElement("label");
        labelElement.textContent = label;
        var labelText = labelElement.textContent;
        // Append the label element to the field div
        fieldDiv.appendChild(labelElement);
        // Create the field element based on the field type
        if (fieldType === "input") {
            var fieldElement = document.createElement("input");
            fieldElement.setAttribute("type", "text");
        } else if (fieldType === "dropdown") {
            // Create the select element
            var fieldElement = document.createElement("select");
            // Prompt for options
            var options = prompt("Enter the options for the dropdown (comma-separated):");
            var optionArray = options.split(",");
            // Create the options for the dropdown
            optionArray.forEach(function (option) {
                var optionElement = document.createElement("option");
                optionElement.textContent = option.trim();
                fieldElement.appendChild(optionElement);
            });
            fieldElement.setAttribute("type", "dropdown");
            fieldElement.setAttribute("label",labelElement);
            fieldElement.setAttribute("option",options);
        } else if (fieldType === "documentUpload") {
            var fieldElement = document.createElement("input");
            fieldElement.setAttribute("type", "file");
        } else {
            alert("Invalid field type!");
            return;
        }
        // Set common attributes for the field element
        fieldElement.classList.add("form-control");
        var fieldId = fieldNumber;
        fieldElement.setAttribute("id", fieldId);
        fieldElement.setAttribute("name", "dynamicFields[]");
        fieldElement.setAttribute("label",labelText);
        
        console.log(fieldElement);
        // Append the field element to the field div
        fieldDiv.appendChild(fieldElement);
        // Create the delete button
        var deleteButton = document.createElement("button");
        deleteButton.setAttribute("type", "button");
        deleteButton.classList.add("btn", "btn-danger");
        deleteButton.textContent = "Delete";
        deleteButton.addEventListener("click", function() {
            fieldContainer.removeChild(fieldDiv);
        });
        // Append the delete button to the field div
        fieldDiv.appendChild(deleteButton);
        // Append the field div to the container
        fieldContainer.appendChild(fieldDiv);
        // Increment the field number
        fieldNumber++;
    }
    
    function previewFields() {
        // Create a div element for the overlay
        var overlay = document.createElement("div");
        overlay.classList.add("overlay");

        // Create a div element for the preview content
        var previewContainer = document.createElement("div");
        previewContainer.classList.add("preview-container");

        var submitHeading = document.createElement("h4");
        submitHeading.textContent = "Please Fill Form";
        previewContainer.appendChild(submitHeading);

        // Get the form element and dynamically generated fields
        var form = document.getElementById("enquiry-form");
        var dynamicFields = form.querySelectorAll('[name="dynamicFields[]"]');
        
        // Loop through the dynamic fields and add them to the preview container
        for (var i = 0; i < dynamicFields.length; i++) {
            var field = dynamicFields[i];
            var label = field.previousSibling.textContent;
            var fieldId = field.getAttribute("id");
            var fieldType = field.getAttribute("type");
            var fieldValue = field.value;
            // Create a div element for the field
            var fieldDiv = document.createElement("div");
            fieldDiv.classList.add("form-group");

            // Create the label element
            var labelElement = document.createElement("label");
            labelElement.textContent = label;

            // Append the label element to the field div
            fieldDiv.appendChild(labelElement);

            // Create a div to display the field ID
            var fieldIdDiv = document.createElement("div");
            fieldIdDiv.textContent = "Field ID: " + fieldId;
            fieldDiv.appendChild(fieldIdDiv);

            // Append the dynamic field to the field div
            fieldDiv.appendChild(field.cloneNode(true));

            // Append the field div to the preview container
            previewContainer.appendChild(fieldDiv);
        }

        var submitButton = document.createElement("button");
        submitButton.setAttribute("type", "button");
        submitButton.classList.add("btn", "btn-primary");
        submitButton.textContent = "Submit";
        submitButton.addEventListener("click", function() {
            submitForm();
        });
        previewContainer.appendChild(submitButton);
        
        var responseDiv = document.createElement("div");
	    responseDiv.id = "response-message"; // Set an ID for easier manipulation
	    previewContainer.appendChild(responseDiv);
        // Append the preview container to the overlay
        overlay.appendChild(previewContainer);

        // Add the overlay to the document body
        document.body.appendChild(overlay);

        // Add a click event listener to the overlay to remove it when clicked outside the preview content
        overlay.addEventListener("click", function(event) {
            if (event.target === overlay) {
                overlay.parentNode.removeChild(overlay);
            }
        });
    }

    function submitForm() {
        // Get the form element and dynamically generated fields
        var form = document.getElementById("enquiry-form");
        var dynamicFields = form.querySelectorAll('[name="dynamicFields[]"]');

        // Create an array to store the dynamic field data
        var dynamicFieldData = [];

        // Loop through the dynamic fields and store the data in the array
        for (var i = 0; i < dynamicFields.length; i++) {
		  var field = dynamicFields[i];
		  var fieldType = field.getAttribute("type");
		  var defaultValues = (fieldType === "dropdown") ? field.getAttribute("option") : field.value;
		
		  var fieldData = {
		    enqr_id: document.getElementById("enqrId").value,
		    enqr_fieldid: field.getAttribute("id"),
		    fieldType: fieldType,
		    defaultvalues: defaultValues,
		    enqr_fieldorder: field.getAttribute("id"),
		    label: field.getAttribute("label")
		  };
		  
		  
		  dynamicFieldData.push(fieldData);
		}
     	
        // Set the dynamic field data in the hidden input field
        document.getElementById("dynamicFieldData").value = JSON.stringify(dynamicFieldData);
		console.log(document.getElementById("dynamicFieldData").value);
        
		$.ajax({
            url: "updateEnquiry",
            type: "POST",
            data: JSON.stringify(dynamicFieldData),
            contentType: "application/json",
            success: function(response) {
            	 // Handle the success response
                console.log(response);
             	// Update the response message on the preview overlay
                var responseDiv = document.getElementById("response-message");
                responseDiv.textContent = response;
            },
            error: function(xhr, status, error) {
                // Handle the error response
                console.log(xhr.responseText);
             	// Update the response message on the preview overlay
                var responseDiv = document.getElementById("response-message");
                responseDiv.textContent = "Error updating data: " + xhr.responseText;
            }
        });
    }
    function activateTab(element) {
	    $('.nav-link').removeClass('active');
	    $(element).addClass('active');
  	}
	
</script>

</body>
</html>