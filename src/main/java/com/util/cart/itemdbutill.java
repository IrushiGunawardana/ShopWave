//IT22312426
//D.D.Irushi Gunawardaana

package com.util.cart;

import java.sql.*;
import java.util.*;

import com.model.cart.Cart;
import com.model.cart.Item;

public class itemdbutill {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public itemdbutill(Connection con) {
		super();
		this.con = con;
	}
	
	// Get a list of all product in the database
	public List<Item> getAllProducts() {
        List<Item> book = new ArrayList<>();
        try {
        	// Define the SQL query to retrieve all products
            query = "select * from items";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            
         // Iterate through the result set and populate the list of items
            while (rs.next()) {
            	Item row = new Item();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	
	// Get a single product by its ID
	 public Item getSingleProduct(int id) {
		 Item row = null;
	        try {
	        	// Define the SQL query to retrieve a product by ID
	            query = "select * from items where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();
                
	            // Populate the item with data if found
	            while (rs.next()) {
	            	row = new Item();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
	// Calculate the total price of items in the cart
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                	
                	// Define the SQL query to retrieve the price of an item by ID
                    query = "select price from items where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    
                   // Calculate the total price
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

	// Get a list of products in the cart with quantities
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                	
                	// Define the SQL query to retrieve a product by ID
                    query = "select * from items where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    
                 // Populate the cart with item data and quantities
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
}