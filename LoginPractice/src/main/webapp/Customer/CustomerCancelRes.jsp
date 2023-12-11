<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Flight Reservation</title>
</head>
<body>
    <h1>Cancel Your Flight Reservation</h1>
    <form method="post">
        <label for="ticketNumber">Ticket Number:</label>
        <input type="text" id="ticketNumber" name="ticketNumber" required><br>
        <input type="submit" value="Cancel Reservation">
    </form>

    <%
        String ticketNumber = request.getParameter("ticketNumber");
        if (ticketNumber != null && !ticketNumber.isEmpty()) {
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            ApplicationDB db = new ApplicationDB();  
            Connection con = db.getConnection();

            try {
                con.setAutoCommit(false);

                String checkClass = "SELECT COUNT(*) FROM ticket WHERE TicketNumber = ? AND class IN ('first', 'business')";
                pstmt = con.prepareStatement(checkClass);
                pstmt.setString(1, ticketNumber);
                rs = pstmt.executeQuery();

                boolean isCancelable = false;
                if (rs.next()) {
                    isCancelable = rs.getInt(1) > 0;
                }

                if (isCancelable) {
                    String deleteFlight = "DELETE FROM ticketflightassociatedwith WHERE TicketNumber = ?";
                    pstmt = con.prepareStatement(deleteFlight);
                    pstmt.setString(1, ticketNumber);
                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        String deleteTicket = "DELETE FROM ticket WHERE TicketNumber = ?";
                        pstmt = con.prepareStatement(deleteTicket);
                        pstmt.setString(1, ticketNumber);
                        rowsAffected = pstmt.executeUpdate();

                        if (rowsAffected > 0) {
                            con.commit(); 
                            out.println("<h2>Reservation Cancelled Successfully</h2>");
                        } else {
                            con.rollback(); 
                            out.println("<h2>No such ticket found to cancel.</h2>");
                        }
                    } else {
                        out.println("<h2>No such ticket found in associated flights to cancel.</h2>");
                    }
                } else {
                    out.println("<h2>Ticket is either not found or is Economy class and cannot be cancelled.</h2>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
                if (con != null) try { con.rollback(); } catch (SQLException ex) {}
            } 
        }
    %>
</body>
</html>