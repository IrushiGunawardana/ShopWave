
//IT22312426
//D.D.Irushi Gunawardaana

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.util.cart.itemdbutill"%>
<%@page import="com.connection.DBconnection"%>
<%@page import="com.model.cart.*"%>
<%@page import="java.util.*"%>

<%

//Create a decimal format object to format numbers to two decimal places
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

//Get the logged-in customer from the session
loggedcustomer auth = (loggedcustomer) request.getSession().getAttribute("auth");
if (auth != null) {
	
	// If a logged-in customer exists, set it as a request attribute
    request.setAttribute("person", auth);
}
//Get the cart list from the session
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	
	// Initialize the item database utility with a database connection
    itemdbutill pDao = new itemdbutill(DBconnection.getConnection());
    cartProduct = pDao.getCartProducts(cart_list);
    
 // Get the cart products and total cart price
    double total = pDao.getTotalCartPrice(cart_list);
    request.setAttribute("total", total);
    request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>


    <meta charset="ISO-8859-1">
    <title>Shopping cart</title>
    
    <%@include file="/includes/head.jsp"%>
    
    <style type="text/css">
        .table tbody td {
            vertical-align: middle;
        }
        .btn-incre, .btn-decre {
            box-shadow: none;
            font-size: 25px;
        }
    </style>
    
    <script type="text/javascript">
        function validateQuantityInput(input) {
            var quantity = parseInt(input.value);
            if (isNaN(quantity) || quantity <= 0) {
                // Display an error message
                alert("Quantity must be a positive number.");
                input.value = 1; // Reset the quantity to 1
                return false; // Prevent form submission
            }
            return true;
        }
    </script>
</head>
<body>

    <%@include file="/includes/navbar.jsp"%>
    
    <div class="container my-3">
        <div class="d-flex py-3">
            <h3>Total Price: $ ${(total > 0) ? dcf.format(total) : 0} </h3>
            <a class="mx-3 btn btn-dark" href="cart-check-out">Check Out</a>
        </div>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price <b>$</b></th>
                    <th scope="col">Buy Now</th>
                    <th scope="col">Cancel</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (cart_list != null) {
                    for (Cart c : cartProduct) {
                %>
                <tr>
                    <td><%=c.getName()%></td>
                    <td><%=c.getCategory()%></td>
                    <td><%= dcf.format(c.getPrice())%></td>
                    <td>
                        <form action="order-now" method="post" class="form-inline">
                            <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                            <div class="form-group d-flex justify-content-between">
                                <a class="btn btn-sm btn-incre "
                                    href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
                                <input type="text" name="quantity" class="form-control"
                                    value="<%=c.getQuantity()%>" onblur="return validateQuantityInput(this);">
                                <a class="btn btn-sm btn-decre "
                                    href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                            </div>
                            <button type="submit" class="btn btn-dark btn-sm">Buy</button>
                        </form>
                    </td>
                    <td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
                </tr>
                <%
                    }
                }
                %>
            </tbody>
        </table>
    </div>
    
    <%@include file="/includes/footer.jsp"%>
    
</body>
</html>
