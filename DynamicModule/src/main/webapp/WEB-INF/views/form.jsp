<!-- form-page.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>Form Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            var fieldCounter = 0;

            // Function to add a new form field
            function addFormField(fieldType, label) {
                fieldCounter++;
                var newField = '';

                if (fieldType === 'input') {
                    newField = '<div>' +
                                    '<label for="inputField' + fieldCounter + '">' + label + '</label>' +
                                    '<input type="text" id="inputField' + fieldCounter + '" name="inputField' + fieldCounter + '">' +
                                '</div>';
                } else if (fieldType === 'dropdown') {
                    newField = '<div>' +
                                    '<label for="dropdownField' + fieldCounter + '">' + label + '</label>' +
                                    '<select id="dropdownField' + fieldCounter + '" name="dropdownField' + fieldCounter + '">' +
                                        '<option value="Option 1">Option 1</option>' +
                                        '<option value="Option 2">Option 2</option>' +
                                        '<option value="Option 3">Option 3</option>' +
                                    '</select>' +
                                '</div>';
                } else if (fieldType === 'document') {
                    newField = '<div>' +
                                    '<label for="fileField' + fieldCounter + '">' + label + '</label>' +
                                    '<input type="file" id="fileField' + fieldCounter + '" name="fileField' + fieldCounter + '">' +
                                '</div>';
                }

                $('#formFields').append(newField);
            }

            // Event listener for the "Add Field" button
            $('#addFieldButton').click(function() {
                var fieldType = prompt("Enter the field type (input/dropdown/document):");
                var fieldLabel = prompt("Enter the field label:");
                if (fieldType && fieldLabel) {
                    addFormField(fieldType, fieldLabel);
                }
            });
        });
    </script>
</head>
<body>
    <h1>Form</h1>
    <form action="success" method="post">
        <div id="formFields">
            <!-- Existing form fields -->
        </div>

        <button type="button" id="addFieldButton">Add Field</button>

        <br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
