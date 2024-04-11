//IT22312426
//D.D.Irushi Gunawardaana

package com.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DBconnection;
import com.model.cart.*;
import com.util.cart.*;

@WebServlet("/user-login")
public class logintoshop extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
            
		    // Create a User DAO and attempt to log in the user
			userdbutill udao = new userdbutill(DBconnection.getConnection());
			loggedcustomer user = udao.userLogin(email, password);
			if (user != null) {
				
				// Set the authenticated user in the session
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("home.jsp");
			} else {
				out.println("there is no user");
			}

		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		} 

	}
}