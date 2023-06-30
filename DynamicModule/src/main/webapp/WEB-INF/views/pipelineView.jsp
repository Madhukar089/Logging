<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>PIPELINE</title>
    <style>
        /* Define the colors for different statuses */
        .ENQREJECTED, .RFPRREJECTED{
        	background-color: red;
        }
        .ENQINPR, .RFPINPR {
            background-color: yellow;
        }
        
        .ENQOPEN {
            background-color: orange;
        }
        
        .RFPRCOMPLETED, .ENQCOMPLETED {
            background-color: green;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>enq_id</th>
                <th>enqr_rejected</th>
                <th>enqr_received</th>
                <th>enqr_accepted</th>
                <th>converted_to_rfp</th>
                <th>rfpr_rejected</th>
                <th>rfp_approved</th>
                <th>rfp_completed</th>
            </tr>
        </thead>
        <tbody>
            <%-- Iterate over the collection of data from the model attribute --%>
            <c:forEach var="data" items="${myData}">
                <tr>
                    <td>${data.enqId}</td>
                    <td class="${data.status == 'ENQREJECTED' ? 'ENQREJECTED' : ''}"></td>
                    <td class="${data.status == 'ENQOPEN' ? 'ENQOPEN' : ''}"></td>
                    <td class="${data.status == 'ENQINPR' ? 'ENQINPR' : ''}"></td>
                    <td class="${data.status == 'ENQCOMPLETED' ? 'ENQCOMPLETED' : ''}"></td>
                    <td class="${data.status == 'RFPRREJECTED' ? 'RFPRREJECTED' : ''}"></td>
                    <td class="${data.status == 'RFPINPR' ? 'RFPINPR' : ''}"></td>
                    <td class="${data.status == 'RFPRCOMPLETED' ? 'RFPRCOMPLETED' : ''}"></td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
