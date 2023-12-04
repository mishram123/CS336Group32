<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Flight Search</title>
</head>
<body>

<form action="Booking.jsp" method="post">
    Origin Airport: <input type="text" name="origin" required><br>
    Destination Airport: <input type="text" name="destination" required><br>
    Departure Date: <input type="date" name="departureDate" required><br>
    Return Date (optional): <input type="date" name="returnDate"><br>
    Flexible Dates: <input type="checkbox" name="isFlexible"><br>
    <input type="submit" value="Search">
</form>

<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String departureDate = request.getParameter("departureDate");
        String returnDate = request.getParameter("returnDate");
        boolean isFlexible = request.getParameter("isFlexible") != null;

        try {
            // Assuming ApplicationDB is your database connection class
            ApplicationDB db = new ApplicationDB(); 
            Connection con = db.getConnection();

            String query = "SELECT * FROM flights WHERE origin_airport = ? AND destination_airport = ?";
            if (isFlexible) {
                query += " AND departure_time BETWEEN DATE_SUB(?, INTERVAL 3 DAY) AND DATE_ADD(?, INTERVAL 3 DAY)";
            } else {
                query += " AND departure_time = ?";
            }
            
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, origin);
            pstmt.setString(2, destination);
            pstmt.setString(3, departureDate);
            if (isFlexible) {
                pstmt.setString(4, departureDate);
            }
            ResultSet result = pstmt.executeQuery();

            out.print("<table border='1'><tr><th>Flight ID</th><th>Origin</th><th>Destination</th><th>Departure Time</th><th>Arrival Time</th></tr>");
            while (result.next()) {
                out.print("<tr>");
                out.print("<td>" + result.getString("flight_id") + "</td>");
                out.print("<td>" + result.getString("origin_airport") + "</td>");
                out.print("<td>" + result.getString("destination_airport") + "</td>");
                out.print("<td>" + result.getString("departure_time") + "</td>");
                out.print("<td>" + result.getString("arrival_time") + "</td>");
                out.print("</tr>");
            }
            out.print("</table>");
            con.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
        }
    }
%>

</body>
</html>
