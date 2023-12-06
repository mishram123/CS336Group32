<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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
            padding: 20px;
        }
        .airplane-logo {
            max-width: 300px;
            position: absolute;
            left: 20px;
            top: 120px;
        }
        .search-section {
            width: 200px;
            margin-left: auto;
            padding: 10px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        .search-button {
            display: block;
            margin: 20px 0;
            padding: 10px;
            background-color: #4caf50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
        }
        .faq-section {
            margin-left: 20px; /* Adjust the margin as needed */
        }
        .faq-button {
            display: block;
            margin: 20px 0;
            padding: 10px;
            background-color: #337ab7; /* Choose a color that fits your design */
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
        }
        .reservations {
            position: absolute;
            left: 20px;
            bottom: 20px;
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
        <div class="search-section">
            <a href="searchFlights.jsp" class="search-button">Search Flights</a>
        </div>

        <!-- Add FAQ button here -->
        <div class="faq-section">
            <a href="faq.jsp" class="faq-button">FAQ</a>
        </div>
    </div>

    <div class="reservations">
        <div>
            <h3>Past Reservations</h3>
            <ul>
                <li>Flight ABC123</li>
                <li>Flight DEF456</li>
            </ul>
        </div>
        <div>
            <h3>Upcoming Tickets</h3>
            <ul>
                <li>Flight GHI789</li>
                <li>Flight JKL012</li>
            </ul>
        </div>
    </div>
</body>
</html>
