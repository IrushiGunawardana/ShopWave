
//IT22312426
//D.D.Irushi Gunawardaana

package com.controller.cart;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DBconnection;
import com.model.cart.*;
import com.util.cart.orderdbutill;


@WebServlet("/cart-check-out")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			// Create a date formatter for timestamp
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            
            // Retrieve the cart list and user authentication from the session
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			loggedcustomer auth = (loggedcustomer) request.getSession().getAttribute("auth");
			if(cart_list != null && auth!=null) {
				 // Iterate through the items in the cart and create orders
				for(Cart c:cart_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQunatity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					// Create an Order DAO and insert the order into the database
					orderdbutill oDao = new orderdbutill(DBconnection.getConnection());
					boolean result = oDao.insertOrder(order);
					if(!result) break;
				}
				
				// Clear the cart after successful checkout
				cart_list.clear();
				response.sendRedirect("orders.jsp");
			}else {
				if(auth==null) {
					
					// Redirect to the login page if the user is not authenticated
					response.sendRedirect("shopenter.jsp");
				}
				response.sendRedirect("cart.jsp");
			}
		} catch (ClassNotFoundException|SQLException e) {
			
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
