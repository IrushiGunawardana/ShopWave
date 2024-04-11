
//IT22312426
//D.D.Irushi Gunawardaana

package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
    // Static variable to hold the database connection
    private static Connection connection = null;

    // Method to get a database connection
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        // Check if the connection is not already established
        if (connection == null) {
            try {
                // Load the MySQL JDBC driver class
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection to the database
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshoppingplatform", "root", "irushi123");
                
                
                System.out.print("Connected to the database");
            } catch (ClassNotFoundException e) {
                // Handle a ClassNotFoundException if the MySQL driver class is not found
                e.printStackTrace();
            } catch (SQLException e) {
                // Handle a SQLException if there's an issue with the database connection
                e.printStackTrace();
            }
        }
        // Return the established database connection
        return connection;
    }
}
