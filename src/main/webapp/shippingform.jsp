//IT22312426
//D.D.Irushi Gunawardaana

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>

    <meta charset="ISO-8859-1">
    <%@ include file="/includes/head.jsp" %>
    <title>Shipping Details Form</title>
    
    <script>
        function validateForm() {
        	
        	// Get the values of the name, address, and country fields from the form
            var name = document.forms["shippingForm"]["name"].value;
            var address = document.forms["shippingForm"]["address"].value;
            var country = document.forms["shippingForm"]["country"].value;

            if (name === "") {
                alert("Name must be filled out");
                return false;
            }
            if (address === "") {
                alert("Shipping Address must be filled out");
                return false;
            }
            if (country === "") {
                alert("Shipping Country must be filled out");
                return false;
            }

            return true; // Form is valid
        }
    </script>
</head>
<body style="background-color: black;">
    <%@ include file="/includes/navbar.jsp" %>
    
    <br>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:choose>
                    <c:when test="${shipping != null}">
                        <form name="shippingForm" action="<%=request.getContextPath()%>/update" method="post"  onsubmit="return validateForm()">
                    </c:when>
                    <c:otherwise>
                        <form  name="shippingForm" action="<%=request.getContextPath()%>/insert" method="post" onsubmit="return validateForm()">
                    </c:otherwise>
                </c:choose>

                <caption>
                    <h2>
                        <c:choose>
                            <c:when test="${shipping != null}">
                                Edit Shipping Details
                            </c:when>
                            <c:otherwise>
                                Add New Shipping Details
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </caption>

                <c:choose>
                    <c:when test="${shipping != null}">
                        <input type="hidden" name="id" value="<c:out value='${shipping.id}' />" />
                    </c:when>
                </c:choose>

                <fieldset class="form-group">
                    <label> Name</label>
                    <input type="text" value="<c:out value='${shipping.name}' />" class="form-control" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Shipping Address</label>
                    <input type="text" value="<c:out value='${shipping.address}' />" class="form-control" name="address">
                </fieldset>

                <fieldset class="form-group">
                    <label>Shipping Country</label>
                    <input type="text" value="<c:out value='${shipping.country}' />" class="form-control" name="country">
                </fieldset>

                <button type="submit" class="btn btn-dark">Save</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
