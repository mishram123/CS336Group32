<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Reservation</title>
</head>
<body>
    <h2>Flight Reservation Form</h2>
    <form action="makeReservation.jsp" method="post">
        User ID: <input type="text" name="userId" required><br>
        Password: <input type="password" name="password" required><br>
        Flight Number: <input type="text" name="flightNumber" required><br>
        Ticket Number: <input type="text" name="ticketNumber" required><br>
        Seat Number: <input type="text" name="seatNumber" required><br>
        Total Fare: <input type="number" name="totalFare" required><br>
        Passenger Name: <input type="text" name="passengerName" required><br>
        Class: <input type="text" name="class" required><br>
        <input type="submit" value="Make Reservation">
    </form>
    
    <button onclick="showAvailableFlights()">Show Available Flights</button>
    <div id="flightsTable"><b>Available flights will be listed here...</b></div>

    <%
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String flightNumber = request.getParameter("flightNumber");
        String ticketNumber = request.getParameter("ticketNumber");
        String seatNumber = request.getParameter("seatNumber");
        String totalFare = request.getParameter("totalFare");
        String passengerName = request.getParameter("passengerName");
        String className = request.getParameter("class");

        if (userId != null && password != null && flightNumber != null && ticketNumber != null) {
        	ApplicationDB db = new ApplicationDB();	
        	Connection con = db.getConnection();	
        	Statement stmt = con.createStatement();
            try {
                // Assuming you have a DataSource called jdbc/FlightDB
                
                // Start transaction
              

                stmt = con.createStatement();

                // Step 1: Insert into user and customer if new user
                // Check if user exists first, if not, insert into user and customer
                // ...

                // Step 2: Insert ticket
                String sqlTicket = "INSERT INTO ticket VALUES ('" + ticketNumber + "', '" + seatNumber + "', " + totalFare + ", '" + passengerName + "', '" + className + "', ...)";
                stmt.executeUpdate(sqlTicket);

                // Step 3: Associate ticket with flight
                String sqlFlightTicket = "INSERT INTO ticketflightassociatedwith VALUES ('" + ticketNumber + "', '" + flightNumber + "', ...)";
                stmt.executeUpdate(sqlFlightTicket);

                // Commit transaction
                con.commit();
                out.println("<p>Reservation successful!</p>");
            } catch (Exception e) {
                if (con != null) {
                    try {
                        con.rollback();
                    } catch (SQLException se2) {
                        // Handle errors for JDBC
                        out.println("<p>Error: " + se2.getMessage() + "</p>");
                    }
                }
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                // Clean-up environment
                try {
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException se) {
                    out.println("<p>Error: " + se.getMessage() + "</p>");
                }
            }
        }
    %>
    <h2>Show Available Flights</h2>
    <form method="post">
        <input type="submit" name="showFlights" value="Show Available Flights">
    </form>

    <% 
        if (request.getParameter("showFlights") != null) {
            ApplicationDB db = new ApplicationDB();  
            Connection con = db.getConnection();  
            Statement stmt = con.createStatement();

            String sql = "SELECT flightNumber, AircraftID FROM flightservices"; // Modify query as needed
            ResultSet rs = stmt.executeQuery(sql);

            out.println("<table border='1'><tr><th>Flight Number</th><th>Aircraft ID</th></tr>");
            while (rs.next()) {
                out.println("<tr><td>" + rs.getString("flightNumber") + "</td><td>" + rs.getString("AircraftID") + "</td></tr>");
            }
            out.println("</table>");
            rs.close();
            stmt.close();
            con.close();
        }
    %>
</body>
</html>