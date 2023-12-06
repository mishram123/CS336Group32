<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>FAQ - Flight Reservation System</title>
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

        button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
        
        /* Add more styles as needed */
    </style>
    <script>
        function askQuestion() {
            var newQuestion = prompt("Enter your question:");

            if (newQuestion !== null) {
                // Assuming your addQuestion.jsp is in the same directory
                window.location.href = "addQuestion.jsp?newQuestion=" + encodeURIComponent(newQuestion);
            }
        }
    </script>
</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='CustomerMainPage.jsp'">Back to Customer Main Page</button>
    <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    
    <h2>Frequently Asked Questions</h2>

    <table>
        <tr>
            <th>Question</th>
            <th>Answer</th>
        </tr>

        <%
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement statement = connection.createStatement();

                ResultSet rs = statement.executeQuery("SELECT * FROM FAQ");

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getString("question") %></td>
                        <td><%= rs.getString("answer") %></td>
                    </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>

    <!-- Ask a Question Button -->
    <button onclick="askQuestion()">Ask a Question</button>
</body>
</html>
