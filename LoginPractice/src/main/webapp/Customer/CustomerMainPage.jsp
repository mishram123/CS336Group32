<!DOCTYPE html>
<html>
<head>
    <title>Flight Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }
        .header {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            text-align: center;
        }
        .container {
            display: flex;
            justify-content: space-between;
            align-items: center; /* Center vertically */
            padding: 20px;
        }
        .airplane-logo {
            max-width: 300px;
        }
        .search-section,
        .faq-section {
            width: 200px;
            padding: 10px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            text-align: center; /* Center text */
        }
        .search-button,
        .faq-button {
            display: block;
            margin: 5px 0;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
        }
        .search-button {
            background-color: #4caf50;
        }
        .faq-button {
            background-color: #337ab7;
        }
        .reservations {
            /* Removed absolute positioning */
            background: #fff;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        .reservations div {
            margin-bottom: 10px;
        }
        .logout-button {
            position: absolute;
            left: 20px;
            top: 20px;
            padding: 5px 15px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome, Customer</h1>
        <!-- Logout button -->
        <form action="../Logout.jsp" method="post" style="position: absolute; top: 10px; left: 10px;">
            <input type="submit" value="Logout" class="logout-button"/>
        </form>
    </div>

    <div class="container">
        <img src="../airplane_logo.jpg" alt="Airplane Logo" class="airplane-logo">
        
        <!-- Move the FAQ button to the right side of the container -->
        <div class="faq-section">
            <a href="faq.jsp" class="faq-button">FAQ</a>
        </div>

        <div class="search-section">
            <a href="searchFlights.jsp" class="search-button">Search Flights</a>
        </div>
    </div>

    <div class="reservations">
        <div>
            <h3>Book Reservations</h3>
            <div class="search-section">
                <a href="CustomerBookRes.jsp" class="search-button">Book a Reservation</a>
            </div>
        </div>
        <div>
            <h3>Past Reservations</h3>
            <div class="search-section">
                <a href="CustomerPastRes.jsp" class="search-button">View Past Reservations</a>
            </div>
        </div>
        <div>
            <h3>Upcoming Tickets</h3>
            <div class="search-section">
                <a href="CustomerFutureRes.jsp" class="search-button">View Upcoming Reservations</a>
            </div>
        </div>
    </div>
</body>
</html>
