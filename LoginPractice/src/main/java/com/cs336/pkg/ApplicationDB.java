package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ApplicationDB{
	public ApplicationDB() {
		
	}
	
	public Connection getConnection() {
		String connectionUrl = "jdbc:mysql://localhost:3306/FlightReservationSystem";
		Connection connection = null;
		try {
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			//Create a connection to your DB
			connection = DriverManager.getConnection(connectionUrl,"root", "L0chan#M123");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
	}
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		ApplicationDB dao = new ApplicationDB();
		Connection connection = dao.getConnection();
		
		System.out.println(connection);		
		dao.closeConnection(connection);
	}
}