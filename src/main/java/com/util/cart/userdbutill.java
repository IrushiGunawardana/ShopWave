//IT22312426
//D.D.Irushi Gunawardaana

package com.util.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.cart.loggedcustomer;

public class userdbutill {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public userdbutill(Connection con) {
        this.con = con;
    }

    // Method for user login, taking email and password as input
    public loggedcustomer userLogin(String email, String password) {
        loggedcustomer user = null;
        try {
            // Define the SQL query to select a user by email and password
            query = "SELECT * FROM loggedcustomer WHERE email=? AND password=?";
            
            // Prepare the SQL statement
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            
            // Execute the query and retrieve the result set
            rs = pst.executeQuery();
            
            // If a user is found, create a loggedcustomer object and populate it with data
            if (rs.next()) {
                user = new loggedcustomer();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions that may occur
            System.out.print(e.getMessage());
        }
        return user; // Return the user object, which may be null if no user is found
    }
}



