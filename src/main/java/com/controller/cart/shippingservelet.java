//IT22312426
//D.D.Irushi Gunawardaana

package com.controller.cart;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.cart.shippingdbutill;
import com.model.cart.shipping;






@WebServlet("/")
public class shippingservelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private shippingdbutill shiputil;
	
	public void init() {
		shiputil = new shippingdbutill ();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertshipping(request, response);
				break;
			case "/delete":
				deleteshipping(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateshipping(request, response);
				break;
			default:
				listshipping(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listshipping(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		// Retrieve and display the list of shipping records
		List<shipping> listshipping = shiputil.selectAllshipping();
		request.setAttribute("listshipping", listshipping);
		RequestDispatcher dispatcher = request.getRequestDispatcher("shipping.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Display a form for adding a new shipping record
		RequestDispatcher dispatcher = request.getRequestDispatcher("shippingform.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		// Display a form for editing an existing shipping record
		int id = Integer.parseInt(request.getParameter("id"));
		shipping existingshipping = shiputil.selectshipping(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("shippingform.jsp");
		request.setAttribute("shipping", existingshipping);
		dispatcher.forward(request, response);

	}


	private void insertshipping(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		// Insert a new shipping record based on user input
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String country = request.getParameter("country");
		shipping newshipping = new shipping(name, address, country);
		shiputil.insertshipping(newshipping);
		response.sendRedirect("list");
	}

	private void updateshipping(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		// Update an existing shipping record based on user input
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String country = request.getParameter("country");

		shipping book = new shipping(id, name, address, country);
		shiputil.updateshipping(book);
		response.sendRedirect("list");
	}

	private void deleteshipping(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		// Delete a shipping record based on the provided ID
		int id = Integer.parseInt(request.getParameter("id"));
		shiputil.deleteshipping(id);
		response.sendRedirect("list");

	}

}
