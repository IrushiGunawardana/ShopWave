//IT22312426
//D.D.Irushi Gunawardaana


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.model.cart.*"%>
<%@page import="java.util.*"%> 

<%


//Get the logged-in customer from the session
 loggedcustomer auth = (loggedcustomer) request.getSession().getAttribute("auth");
 	if (auth != null) {
 	// If a logged-in customer exists, redirect to the shopenter.jsp page
 		response.sendRedirect("shopenter.jsp");
 	}
    // Get the cart list from the session
 	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
 	if (cart_list != null) {
 	// If the cart list exists, set it as a request attribute
 		request.setAttribute("cart_list", cart_list);
 	}
 	
 %>
	 
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Welcome To ShopWave</title>
<%@include file="/includes/head.jsp"%>

 <script type="text/javascript">
        // JavaScript function to validate email
        function validateEmail() {
        	 // Get the email input element
            var emailInput = document.getElementById("login-email");
            var email = emailInput.value;
            if (email.indexOf("@") == -1) {
                alert("Please enter a valid email address.");
                emailInput.focus();
                return false;
            }
            return true;
        }
    </script>
    
    <style>
   

  body{
    background-color: black;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .container{
        display:flex;
        justify-content: center;
        
    }
    .card{
        color: black;
        background:white;
        width: 300px;
        margin: 50px;
        text-align: center;
        border-radius: 20px;
        box-shadow: silver;
        height :400px;
      
    
    }

  .card h2{
    padding: 10px;
 
  }
  .card p {
    padding: 5px;
  }
  
  .card:hover{
    background-color:  silver;
    color:white;
    cursor: pointer;
    transform: scale(1.03);
    transition: all 1s ease;

  }
  
 .text1{
   color:white;
 }
 
  .cardm-header{
  color:white;
  }
  
  .text4{
  color:white;
  }
    </style>
   
   


</head>

<body style="background-color: black;">


  <%@include file="/includes/navbar.jsp"%>
  
  
  <div>
  <center>
  <h1 class = "text4">Welcome to Shop Wave - Your Ultimate Online Shopping Destination!</h1></center>
  </div>

  
    <section class="container">
            <div class="card">
                
                <h2>Product Categories</h2 >
                <p>
                    Discover a Variety of Products: Showcasing the diverse range of product categories available on your platform. From electronics to fashion, home decor to beauty products, your users can find everything they need in one place.</p>
                </div>

            <div class="card">

                <h2>Featured Products</h2 >
                <p>Top Picks of the Week: Highlight a curated selection of popular and high-quality products. These items can include new arrivals, best sellers, or seasonal promotions, providing a snapshot of what's trending</p>
            </div>

            <div class="card">
                
                <h2>User Reviews </h2 >
                <p>Hear from Satisfied Shoppers: Display user reviews and testimonials to build trust with potential customers. Real feedback from happy shoppers can help convince new visitors to make a purchase.</p>
                   
                </div>
        </section>
        <br>
        <br>
        <section class="container">
            <div class="card">
              
                <h2>Special Offers and Discounts</h2 >
                <p>Save Big on Every Purchase: Promote ongoing sales, discounts, and special offers. Whether it's a seasonal sale, a "deal of the day," or a loyalty program, encourage users to take advantage of cost-saving opportunities</p>
            </div>

            <div class="card">
              
                <h2>Mobile App Access</h2 >
                <p>Shop on the Go: Highlight the availability of your mobile app for both Android and iOS. Mention the convenience and benefits of shopping through the app, such as exclusive offers and a smoother user experience.</p>
                
            </div>

            <div class="card">
               
                <h2>Customer Support </h2 >
                <p>We're Here to Help: Provide contact information and support options, including live chat, email, and a customer service hotline. Let users know that help is readily available if they have questions or encounter any issues.</p>
            </div>
        </section>


   <div class="containerr">
		<div class="cardm w-50 mx-auto my-5">
			<div class="cardm-header text-center">Enter to shop</div>
			<div class="cardm-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label class="text1">Email address</label> 
						<input type="email" name="login-email" class="form-control" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label class ="text1">Password</label> 
						<input type="password" name="login-password" class="form-control" placeholder="Password">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Enter</button>
					</div>
				</form>
			</div>
		</div>
	</div>
   
 
 <%@include file="/includes/footer.jsp"%>
</body>

</html>