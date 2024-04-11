<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		
		<a class="navbar-brand" href="#">
           <b> <span class="navbar-brand-s">S</span>hop<span class="navbar-brand-wa">Wa</span>ve</b>
        </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
				
				<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Profile</a></li>
				
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
				
			</ul>
		</div>
	</div>
</nav>

<style>
  .navbar-brand {
    color: #000; 
    font-family:  sans-serif; 
    font-size: 24px; 
  }
  
  
        .navbar-brand {
            font-family:  sans-serif; 
        }
        /* Style the "S" and "Wa" text in silver color */
        .navbar-brand-s {
            color: silver;
        }
        .navbar-brand-wa {
            color: silver;
        }
</style>


