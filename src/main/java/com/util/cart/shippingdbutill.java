//IT22312426
//D.D.Irushi Gunawardaana

package com.util.cart;


import com.model.cart.shipping;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class shippingdbutill {



	private String jdbcURL = "jdbc:mysql://localhost:3306/onlineshoppingplatform";
	private String jdbcUsername = "root";
	private String jdbcPassword = "irushi123";

	private static final String INSERT_USERS_SQL = "INSERT INTO shipping" + "  (name, address, country) VALUES "
			+ " (?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "select id,name,address,country from shipping where id =?";
	private static final String SELECT_ALL_USERS = "select * from shipping";
	private static final String DELETE_USERS_SQL = "delete from shipping where id = ?;";
	private static final String UPDATE_USERS_SQL = "update shipping set name = ?,address= ?, country =? where id = ?;";

	public shippingdbutill() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
   
	// Insert a shipping record into the database
	public void insertshipping(shipping user) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getAddress());
			preparedStatement.setString(3, user.getCountry());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	
	// Retrieve a shipping record by its ID
	public shipping selectshipping(int id) {
		shipping user = null;
		// Establishing a Connection
		try (Connection connection = getConnection();
				// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			//  Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			//  Process the ResultSet object.
			while (rs.next()) {
				String name = rs.getString("name");
				String address = rs.getString("address");
				String country = rs.getString("country");
				user = new shipping(id, name, address, country);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}
	 // Retrieve a list of all shipping records
	public List<shipping> selectAllshipping() {

	
		List<shipping> users = new ArrayList<>();
		// Establishing a Connection
		try (Connection connection = getConnection();

				//Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String address = rs.getString("address");
				String country = rs.getString("country");
				users.add(new shipping(id, name, address, country));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}
    
	// Delete a shipping record by its ID
	public boolean deleteshipping(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
   
	// Update a shipping record
	public boolean updateshipping(shipping user) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
			statement.setString(1, user.getName());
			statement.setString(2, user.getAddress());
			statement.setString(3, user.getCountry());
			statement.setInt(4, user.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
    
	// Handle SQLException and print detailed error information
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
