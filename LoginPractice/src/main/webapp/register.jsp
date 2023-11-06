<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register New User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            display: flex;
            justify-content: space-between;
            width: 80%;
        }

        .welcome-screen {
            background-color: #007BFF;
            color: #fff;
            border-radius: 5px;
            width: 45%;
            padding: 20px;
            text-align: center;
        }

        .registration-container {
            background-color: #fff;
            border: 2px solid #000;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 45%;
            padding: 20px;
        }

        .registration-container h2 {
            color: #333;
            text-align: center;
        }

        .registration-container label {
            display: block;
            margin-bottom: 8px;
        }

        .registration-container input,
        .registration-container select {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .registration-container button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 80%;
        }

        .registration-container button:hover {
            background-color: #0056b3;
        }

        .registration-container p#error {
            color: red;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="welcome-screen">
            <h2>Welcome to Our Website</h2>
            <p>This is the welcome content. You can add more information here.</p>
        </div>

        <div class="registration-container">
            <h2>Register New User</h2>
            <form id="registrationForm" action="registration.jsp" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="role">Role:</label>
                <select id="role" name="role">
                    <option value="Customer">Customer</option>
                    <option value="Customer Representative">Customer Representative</option>
                    <option value="Site Admin">Site Admin</option>
                </select>

                <button type="submit">Register</button>
            </form>
            <p id="error">
                <%= request.getAttribute("errorMessage") %>
            </p>
        </div>
    </div>

    <%-- Server-side registration logic can be implemented in the "registration.jsp" --%>
</body>
</html>
