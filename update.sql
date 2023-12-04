USE `flightreservationsystem`;

-- Airport Table
-- CREATE TABLE `airport` (
--   `ThreeLetterID` varchar(3) NOT NULL,
--   PRIMARY KEY (`ThreeLetterID`)
-- );

-- AirlineCompany Table
-- CREATE TABLE `airlinecompany` (
--   `TwoLetterID` varchar(2) NOT NULL,
--   PRIMARY KEY (`TwoLetterID`)
-- );

-- Flights Table
-- CREATE TABLE `flights` (
--   `flight_id` varchar(10) NOT NULL,
--   `origin_airport` varchar(3) NOT NULL,
--   `destination_airport` varchar(3) NOT NULL,
--   `departure_time` datetime NOT NULL,
--   `arrival_time` datetime NOT NULL,
--   PRIMARY KEY (`flight_id`),
--   FOREIGN KEY (`origin_airport`) REFERENCES `airport` (`ThreeLetterID`),
--   FOREIGN KEY (`destination_airport`) REFERENCES `airport` (`ThreeLetterID`)
-- );

INSERT INTO airport (ThreeLetterID) VALUES ('JFK');
INSERT INTO airport (ThreeLetterID) VALUES ('LAX');

INSERT INTO flights(flight_id, origin_airport, destination_airport, departure_time, arrival_time)
VALUES ('FL123', 'JFK', 'LAX', '2023-12-01 08:00:00', '2023-12-01 11:00:00');