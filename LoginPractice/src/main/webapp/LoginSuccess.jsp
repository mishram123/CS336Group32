<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Successful</title>
    <!-- Add any additional styling or metadata here -->
</head>
<body>
    <div align="center">
        <h2>Congratulations! Login Successful</h2>
        <p>Welcome, <%= session.getAttribute("user") %>!</p>
        <!-- You can customize the content of the successful login page -->
    </div>
</body>
</html>
