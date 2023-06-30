<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dynamic Form Page</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Custom CSS to center the form */
        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 50vh;
        }
    </style>
</head>
<body>
    <div class="container form-container">
        <h2 class="mb-5">Please Fill the Form</h2>
        <form>
            <c:forEach items="${formData}" var="field">
                <c:set var="defaultValues" value="${field.defaultvalues}" />
                <c:choose>
                    <c:when test="${field.fieldType == 'dropdown'}">
                        <div class="mb-3 row">
                            <label for="field${field.enqr_fieldid}" class="col-sm-3 col-form-label">${field.label}</label>
                            <div class="col-sm-9">
								<select id="field${field.enqr_fieldid}" name="${field.enqr_fieldid}" data-type="dropdown" class="formField">
                                    <% String[] defaultValuesArray = ((String) pageContext.getAttribute("defaultValues")).split(","); %>
                                    <% for (String option : defaultValuesArray) { %>
                                        <option value="<%= option %>"><%= option %></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${field.fieldType == 'text'}">
                        <div class="mb-3 row">
                            <label for="field${field.enqr_fieldid}" class="col-sm-3 col-form-label">${field.label}</label>
                            <div class="col-sm-9">
                                <input id="field${field.enqr_fieldid}" name="${field.enqr_fieldid}" type="text" value="${field.defaultvalues}" class="formField" />
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${field.fieldType == 'file'}">
                        <div class="mb-3 row">
                            <label for="field${field.enqr_fieldid}" class="col-sm-3 col-form-label">${field.label}</label>
                            <div class="col-sm-9">
                                <input id="field${field.enqr_fieldid}" name="${field.enqr_fieldid}" type="file" class="formField" />
                            </div>
                        </div>
                    </c:when>
                </c:choose>
            </c:forEach>
            
            <!-- Hidden input fields for enqr_id and iter_id -->
	        <input type="hidden" id="enqr_id" name="enqr_id" value="${formData[0].enqr_id}"/>
            <input type="hidden" id="enqr_iteration_index" name="enqr_iteration_index" value="${formData[0].enqr_iteration_index}"/>
            <input type="hidden" id="enqr_uuid" name="enqr_uuid" value="${formData[0].enqr_uuid}"/>
            
	        
            <div class="mb-3 row">
                <div class="col-sm-12">
                    <button type="button" onclick="submitForm()">Submit</button>
                </div>
            </div>
        </form>
    </div>
        

    <!-- Add Bootstrap JS at the end of the body -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    
    
    <script type="text/javascript">
	    function submitForm() {
	    	var formData = {};
	        formData.fields = [];
	        
	     	// Add enqr_id and iter_id to the form data
            var enqrId = document.getElementById("enqr_id").value;
            var iterId = document.getElementById("enqr_iteration_index").value;
            var uuid = document.getElementById("enqr_uuid").value;
            formData.enqr_id = enqrId;
            formData.enqr_iteration_index = iterId;
            formData.enqr_uuid = uuid;

            
            console.log(formData.enqr_id);
            console.log(formData.iter_id);
            
	        var fieldName, fieldType, fieldValue="",fieldLabel;
            $(".formField").each(function () {
                fieldName = $(this).attr("name");
                
                fieldLabel = $("label[for='" + $(this).attr("id") + "']").text();
                
                if ($(this).is("select")) {
                    fieldType = "dropdown";
                    fieldValue = $(this).val();
                } else if ($(this).is("input[type='file']")) {
                    fieldType = "documentUpload";
                    fieldValue = $(this).prop("files")[0].name;
                } else {
                    fieldType = "text";
                    fieldValue = $(this).val();
                }                
                
                
                var dynamicFormField = {
                	enqr_fieldid: fieldName,
                	enqr_label: fieldLabel,
                	enqr_value: fieldValue
                };
	            console.log(dynamicFormField);
                formData.fields.push(dynamicFormField);
                console.log(formData);
            });
            
	        $.ajax({
	            url: "<c:url value='/submitting'/>",
	            type: "POST",
	            contentType: "application/json",
	            data: JSON.stringify(formData),
	            success: function (response) {
	                alert(response);
	            }
	        });
	    }
    </script>
</body>
</html>
