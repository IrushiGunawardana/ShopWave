//IT22312426
//D.D.Irushi Gunawardaana


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.util.cart.orderdbutill"%>
<%@page import="com.connection.DBconnection"%>
<%@page import="com.util.cart.itemdbutill"%>
<%@page import="com.model.cart.*"%>
<%@page import="java.util.*"%>

<%

//Create a decimal format object to format numbers to two decimal places
DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	// Get the logged-in customer from the session
	loggedcustomer auth = (loggedcustomer) request.getSession().getAttribute("auth");
	// Initialize a list of orders
	List<Order> orders = null;
	if (auth != null) {
		
		// Initialize the order database utility with a database connection.setAttribute("person", auth);
	    orderdbutill orderDao  = new orderdbutill(DBconnection.getConnection());
	 // Retrieve the user's orders using their ID
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("shopenter.jsp");
	}
	// Get the cart list from the session
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	// If the cart list exists, set it as a request attribute
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">

<title>orders </title>
<%@include file="/includes/head.jsp"%>

</head>

<body >
   <%@include file="/includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price <b>4</b></th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){
			
				%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%= o.getQunatity()%></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
 <br>
 <br>
 <br>
 <center>
 <a class="btn btn-sm btn-dark"   href = "shipping.jsp">Add Shipping Details</a>
 </center>
 
  <%@include file="/includes/footer.jsp"%>
  
</body>
</html>