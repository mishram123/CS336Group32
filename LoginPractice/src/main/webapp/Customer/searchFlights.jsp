<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Flights - Flight Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: #fff;
        }

        /* Add more styles as needed */
    </style>
</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='CustomerMainPage.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Customer Main Page</button>
    <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    
    <h2>Search Flights</h2>

    <!-- Search Form -->
    <form method="post" action="searchFlights.jsp">
        <label for="startAirport">Start Airport:</label>
        <input type="text" id="startAirport" name="startAirport" required>

        <label for="endAirport">End Airport:</label>
        <input type="text" id="endAirport" name="endAirport" required>

        <label for="roundTripCheckbox">Round Trip:</label>
        <input type="checkbox" id="roundTripCheckbox" name="roundTripCheckbox">

        <!-- Date fields for one-way or departure date for round-trip -->
        <label for="departureDate">Departure Date:</label>
        <input type="date" id="departureDate" name="departureDate" required>

        <!-- Date field for return date for round-trip -->
        <label for="returnDate">Return Date:</label>
        <input type="date" id="returnDate" name="returnDate">

        <button type="submit">Search</button>
    </form>

    <!-- Display Search Results -->
    <table>
        <tr>
            <th>Flight Number</th>
        <th>Aircraft ID</th>
        <th>Origin Airport</th>
        <th>Destination Airport</th>
        <th>Departure Date</th>
        <th>Departure Time</th>
        <th>Arrival Date</th>
        <th>Arrival Time</th>
        <th>Economy Fare</th>
        <th>Business Fare</th>
        <th>First Class Fare</th>
        <th>Airline</th>
        <th>Number of Stops</th>
        <th>Flight Type</th>
            <!-- Add more header columns as needed -->
        </tr>

        <%
            String startAirport = request.getParameter("startAirport");
            String endAirport = request.getParameter("endAirport");
            String roundTrip = request.getParameter("roundTripCheckbox");
            String departureDate = request.getParameter("departureDate");
            String returnDate = request.getParameter("returnDate");

            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();

                // Update the SQL query to handle round trip and date filtering
                String query = "SELECT * FROM flightservices WHERE origin_airport = ? AND destination_airport = ? AND departure_date >= ?";
                if ("on".equals(roundTrip)) {
                    query += " AND ((arrival_date <= ?) OR (departure_date <= ?))";
                }

                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, startAirport);
                preparedStatement.setString(2, endAirport);
                preparedStatement.setString(3, departureDate);

                // Set parameters for round trip and return date if applicable
                if ("on".equals(roundTrip)) {
                    preparedStatement.setString(4, returnDate);
                    preparedStatement.setString(5, returnDate);
                }

                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getString("flightNumber") %></td>
                    <td><%= rs.getString("AircraftID") %></td>
                    <td><%= rs.getString("origin_airport") %></td>
                    <td><%= rs.getString("destination_airport") %></td>
                    <td><%= rs.getString("departure_date") %></td>
                    <td><%= rs.getString("departure_times") %></td>
                    <td><%= rs.getString("arrival_date") %></td>
                    <td><%= rs.getString("arrival_times") %></td>
                    <td><%= rs.getFloat("economy_fare") %></td>
                    <td><%= rs.getFloat("business_fare") %></td>
                    <td><%= rs.getFloat("first_class_fare") %></td>
                    <td><%= rs.getString("airline") %></td>
                    <td><%= rs.getInt("number_of_stops") %></td>
                    <td><%= rs.getString("flight_type") %></td>
                        <!-- Add more data columns as needed -->
                    </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
