<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Aircraft Data Query</title>
    <style>
        /* Your existing styles */
    </style>
</head>
<body>
    <h2>Aircraft Data Query</h2>

    <!-- Form to enter aircraft ID -->
    <form method="post">
        <label for="aircraftIdInput">Enter Aircraft ID:</label>
        <input type="text" id="aircraftIdInput" name="aircraftIdInput">
        <input type="submit" value="Query">
    </form>

    <table>
        <!-- Table headers -->
        <tr>
            <th>Account ID</th>
            <th>Aircraft ID</th>
            <th>Waiting List Position</th>
        </tr>

        <% 
            String aircraftId = request.getParameter("aircraftIdInput");
            String url = "jdbc:mysql://localhost:3306/yourDatabase"; // Replace with your DB details
            String user = "yourUsername";
            String password = "yourPassword";
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, password);
                stmt = con.createStatement();
                String sql = "SELECT accountID, aircraftID, waitingListPosition FROM yourTableName"; // Replace with your table name and columns

                if (aircraftId != null && !aircraftId.trim().isEmpty()) {
                    sql += " WHERE aircraftID = '" + aircraftId + "'"; // Query for specific aircraft ID
                }

                rs = stmt.executeQuery(sql);

                while(rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("accountID") + "</td>");
                    out.println("<td>" + rs.getString("aircraftID") + "</td>");
                    out.println("<td>" + rs.getString("waitingListPosition") + "</td>");
                    out.println("</tr>");
                }
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                if(rs != null) try { rs.close(); } catch(SQLException ex) { ex.printStackTrace(); }
                if(stmt != null) try { stmt.close(); } catch(SQLException ex) { ex.printStackTrace(); }
                if(con != null) try { con.close(); } catch(SQLException ex) { ex.printStackTrace(); }
            }
        %>
    </table>
</body>
</html>