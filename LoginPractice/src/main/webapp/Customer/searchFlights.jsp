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
        
        <!-- Checkbox for flexibility -->
    	<label for="isFlexible">Flexible Dates:</label>
    	<input type="checkbox" id="isFlexible" name="isFlexible">

        <!-- Checkbox for sorting options -->
        <label for="sortEconomy">Sort by Economy Price:</label>
        <input type="checkbox" id="sortEconomy" name="sortEconomy">

        <label for="sortBusiness">Sort by Business Price:</label>
        <input type="checkbox" id="sortBusiness" name="sortBusiness">

        <label for="sortFirstClass">Sort by First Class Price:</label>
        <input type="checkbox" id="sortFirstClass" name="sortFirstClass">
        
        <label for="sortDuration">Sort by Duration:</label>
		<input type="checkbox" id="sortDuration" name="sortDuration">
		
		<label for="sortTakeoffTime">Sort by Takeoff Time:</label>
		<input type="checkbox" id="sortTakeoffTime" name="sortTakeoffTime">
		
		<label for="sortLandingTime">Sort by Landing Time:</label>
		<input type="checkbox" id="sortLandingTime" name="sortLandingTime">

        <label for="sortOrder">Sort Order:</label>
        <select id="sortOrder" name="sortOrder">
            <option value="asc">Ascending</option>
            <option value="desc">Descending</option>
        </select>
        
        <label for="numStops">Number of Stops:</label>
    	<input type="text" id="numStops" name="numStops">
    	
    	<label for="airline">Enter Airline:</label>
    	<input type="text" id="airline" name="airline" placeholder="Enter airline code (e.g., AA)">
    	
    	<label for="takeoffTime">Takeoff Time (24-hour format):</label>
		<input type="time" id="takeoffTime" name="takeoffTime">
		
		<label for="landingTime">Landing Time (24-hour format):</label>
		<input type="time" id="landingTime" name="landingTime">
    	
    	<label for="maxFare">Maximum Fare:</label>
		<input type="text" id="maxFare" name="maxFare">
    	


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
            <th>Duration</th>
            <!-- Add more header columns as needed -->
        </tr>

        <%
            String startAirport = request.getParameter("startAirport");
            String endAirport = request.getParameter("endAirport");
            boolean roundTrip = "on".equals(request.getParameter("roundTripCheckbox"));
            String departureDate = request.getParameter("departureDate");
            String returnDate = request.getParameter("returnDate");
            boolean isFlexible = "on".equals(request.getParameter("isFlexible"));
            boolean sortEconomy = "on".equals(request.getParameter("sortEconomy"));
            boolean sortBusiness = "on".equals(request.getParameter("sortBusiness"));
            boolean sortFirstClass = "on".equals(request.getParameter("sortFirstClass"));
            String sortOrder = request.getParameter("sortOrder");
            
            PreparedStatement preparedStatement = null; // Declare preparedStatement

            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();

                // Update the SQL query to handle round trip, date filtering, and sorting
                String query = ""; // Declare the query variable

                if (roundTrip) {
                    // Round trip search: check departure and arrival airports for both outbound and return
                    query = "SELECT * FROM flightservices WHERE " +
                            "((origin_airport = ? AND destination_airport = ?) OR (origin_airport = ? AND destination_airport = ?)) ";

                    if (isFlexible) {
                        query += "AND (departure_date BETWEEN ? AND DATE_ADD(?, INTERVAL 3 DAY)) ";
                    } else {
                        query += "AND (departure_date = ? OR departure_date = ?) ";
                    }
                    int parameterIndex = 7;

                    if (request.getParameter("numStops") != null && !request.getParameter("numStops").isEmpty()) {
                        query += "AND number_of_stops = ? ";
                        
                    }
                    if (request.getParameter("airline") != null && !request.getParameter("airline").isEmpty()) {
                        query += "AND airline = ? ";
                        
                    }
                    if (request.getParameter("maxFare") != null && !request.getParameter("maxFare").isEmpty()) {
                        query += "AND (economy_fare <= ? OR business_fare <= ? OR first_class_fare <= ?) ";
                    }
                    if (request.getParameter("takeoffTime") != null && !request.getParameter("takeoffTime").isEmpty()) {
                        query += "AND departure_times >= ? ";
                    }
                    if (request.getParameter("landingTime") != null && !request.getParameter("landingTime").isEmpty()) {
                        query += "AND arrival_times <= ? ";
                    }
                    if (sortEconomy) {
                        query += "ORDER BY economy_fare " + sortOrder;
                    } else if (sortBusiness) {
                        query += "ORDER BY business_fare " + sortOrder;
                    } else if (sortFirstClass) {
                        query += "ORDER BY first_class_fare " + sortOrder;
                    } else if (request.getParameter("sortDuration") != null) {
                        query += "ORDER BY duration " + sortOrder;
                    } else if (request.getParameter("sortTakeoffTime") != null) {
                        query += "ORDER BY departure_times " + sortOrder;
                    } else if (request.getParameter("sortLandingTime") != null) {
                        query += "ORDER BY arrival_times " + sortOrder;
                    }

                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setString(1, startAirport);
                    preparedStatement.setString(2, endAirport);
                    preparedStatement.setString(3, endAirport); // Flip the airports for the return leg
                    preparedStatement.setString(4, startAirport); // Flip the airports for the return leg
                    if (isFlexible) {
                        if (departureDate != null && !departureDate.isEmpty()) {
                            preparedStatement.setDate(5, java.sql.Date.valueOf(departureDate));
                            preparedStatement.setDate(6, java.sql.Date.valueOf(departureDate));
                        } else {
                            // Handle the case where departureDate is not valid
                            // You might want to set a default date or handle it in another way
                        }
                        
                    } else {
                        if (departureDate != null && !departureDate.isEmpty()) {
                            preparedStatement.setDate(5, java.sql.Date.valueOf(departureDate));
                            preparedStatement.setDate(6, java.sql.Date.valueOf(returnDate));
                        } else {
                            // Handle the case where departureDate is not valid
                            // You might want to set a default date or handle it in another way
                        }
                    }
                    if (request.getParameter("numStops") != null && !request.getParameter("numStops").isEmpty()) {
                        preparedStatement.setInt(parameterIndex, Integer.parseInt(request.getParameter("numStops")));
                        parameterIndex++;
                    }
                    if (request.getParameter("airline") != null && !request.getParameter("airline").isEmpty()) {
                        preparedStatement.setString(parameterIndex, request.getParameter("airline"));
                        parameterIndex++;
                    }
                    if (request.getParameter("maxFare") != null && !request.getParameter("maxFare").isEmpty()) {
                        float maxFare = Float.parseFloat(request.getParameter("maxFare"));
                        preparedStatement.setFloat(parameterIndex++, maxFare);
                        preparedStatement.setFloat(parameterIndex++, maxFare);
                        preparedStatement.setFloat(parameterIndex++, maxFare);
                    }
                    if (request.getParameter("takeoffTime") != null && !request.getParameter("takeoffTime").isEmpty()) {
                        preparedStatement.setString(parameterIndex++, request.getParameter("takeoffTime"));
                    }
                    if (request.getParameter("landingTime") != null && !request.getParameter("landingTime").isEmpty()) {
                        preparedStatement.setString(parameterIndex++, request.getParameter("landingTime"));
                    }
                } else {
                    // One-way search: check only departure airport
                    query = "SELECT * FROM flightservices WHERE origin_airport = ? AND destination_airport = ? ";

                    if (isFlexible) {
                        query += "AND (departure_date BETWEEN ? AND DATE_ADD(?, INTERVAL 3 DAY)) ";
                    } else {
                        query += "AND (departure_date = ?) ";
                    }
                    int parameterIndex = 4;
                    if (request.getParameter("numStops") != null && !request.getParameter("numStops").isEmpty()) {
                        query += "AND number_of_stops = ? ";
                    }
                    if (request.getParameter("airline") != null && !request.getParameter("airline").isEmpty()) {
                        query += "AND airline = ? ";
                    }
                    if (request.getParameter("maxFare") != null && !request.getParameter("maxFare").isEmpty()) {
                        query += "AND (economy_fare <= ? OR business_fare <= ? OR first_class_fare <= ?) ";
                    }
                    if (request.getParameter("takeoffTime") != null && !request.getParameter("takeoffTime").isEmpty()) {
                        query += "AND departure_times >= ? ";
                    }
                    if (request.getParameter("landingTime") != null && !request.getParameter("landingTime").isEmpty()) {
                        query += "AND arrival_times <= ? ";
                    }

                    if (sortEconomy) {
                        query += "ORDER BY economy_fare " + sortOrder;
                    } else if (sortBusiness) {
                        query += "ORDER BY business_fare " + sortOrder;
                    } else if (sortFirstClass) {
                        query += "ORDER BY first_class_fare " + sortOrder;
                    } else if (request.getParameter("sortDuration") != null) {
                        query += "ORDER BY duration " + sortOrder;
                    } else if (request.getParameter("sortTakeoffTime") != null) {
                        query += "ORDER BY departure_times " + sortOrder;
                    } else if (request.getParameter("sortLandingTime") != null) {
                        query += "ORDER BY arrival_times " + sortOrder;
                    }


                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setString(1, startAirport);
                    preparedStatement.setString(2, endAirport);
                    if (isFlexible) {
                        if (departureDate != null && !departureDate.isEmpty()) {
                            preparedStatement.setDate(3, java.sql.Date.valueOf(departureDate));
                            preparedStatement.setDate(4, java.sql.Date.valueOf(departureDate));
                            parameterIndex++;
                        } else {
                            // Handle the case where departureDate is not valid
                            // You might want to set a default date or handle it in another way
                        }
                    } else {
                        if (departureDate != null && !departureDate.isEmpty()) {
                            preparedStatement.setDate(3, java.sql.Date.valueOf(departureDate));
                        } else {
                            // Handle the case where departureDate is not valid
                            // You might want to set a default date or handle it in another way
                        }
                    }
                    if (request.getParameter("numStops") != null && !request.getParameter("numStops").isEmpty()) {
                        preparedStatement.setInt(parameterIndex, Integer.parseInt(request.getParameter("numStops")));
                        parameterIndex++;
                    }
                    if (request.getParameter("airline") != null && !request.getParameter("airline").isEmpty()) {
                        preparedStatement.setString(parameterIndex, request.getParameter("airline"));
                        parameterIndex++;
                    }
                    if (request.getParameter("maxFare") != null && !request.getParameter("maxFare").isEmpty()) {
                        float maxFare = Float.parseFloat(request.getParameter("maxFare"));
                        preparedStatement.setFloat(parameterIndex++, maxFare);
                        preparedStatement.setFloat(parameterIndex++, maxFare);
                        preparedStatement.setFloat(parameterIndex++, maxFare);
                    }
                    if (request.getParameter("takeoffTime") != null && !request.getParameter("takeoffTime").isEmpty()) {
                        preparedStatement.setString(parameterIndex++, request.getParameter("takeoffTime"));
                    }
                    if (request.getParameter("landingTime") != null && !request.getParameter("landingTime").isEmpty()) {
                        preparedStatement.setString(parameterIndex++, request.getParameter("landingTime"));
                    }
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
                        <td><%= rs.getString("duration") %></td>
                        <!-- Add more data columns as needed -->
                    </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                // Close the preparedStatement in the finally block
                if (preparedStatement != null) {
                    try {
                        preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </table>
</body>
</html>
