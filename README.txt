CS336 Group 032 Readme

Login Credentials:
Customer:
User:                  Password:
Customer1         CustomerPassword1
Customer12       CustomerPassword12

Customer Representative:
User:    Password:
Rep1     Rep1
Rep3     Rep3

Admin:
User:      Password:
Admin1  Admin1

Important information:
In ApplicationDB.java found in src\main\java\com\cs336\pkg, Please update the:
String connectionUrl ="jdbc:mysql://localhost:3306/FlightReservationSystem";
On line 13 to the connectionURL to your local MySql with our FlightReservationSystem.sql script

And please edit: connection = DriverManager.getConnection(connectionUrl,"root", "Enter Your MYSQL Password Here");
On line 30 To your mysql server username and password.
