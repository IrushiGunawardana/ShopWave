//IT22312426
//D.D.Irushi Gunawardaana

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.DBconnection"%>
<%@page import="com.util.cart.itemdbutill"%>
<%@page import="com.model.cart.*"%>
<%@page import="java.util.*"%>  
<%
  

  //Check if a logged-in customer is in the session, set it as a request attribute
  loggedcustomer auth = (loggedcustomer) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
    
 // Initialize the item database utility with a database connection
    itemdbutill pd = new itemdbutill(DBconnection.getConnection());
 
 // Get a list of all products from the database
    List<Item> products = pd.getAllProducts();
 
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
    <title>Welcome </title>
     
     <%@include file="/includes/head.jsp"%>

     <style>

      .custom-img {
       width: 100%; 
       height: 200px; 
       object-fit: cover; 
      } 

      .titlename{
       color:white;
       font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
       font-size:30px;
   
       }

      </style>
   </head>

   <body style="background-color: black;">


    <%@include file="/includes/navbar.jsp"%>
  
  <br>
    <center>
      <h1 class="titlename">Welcome to Shop Wave</h1>
    </center>
  <div class="container">
		<div class="card-header my-3"></div>
		<br>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Item p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top custom-img" src="product-images/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: $<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> 
							<a class="btn btn-dark" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no products");
			}
			%>

		</div>
	</div>
 <%@include file="/includes/footer.jsp"%>
 
</body>
</html>