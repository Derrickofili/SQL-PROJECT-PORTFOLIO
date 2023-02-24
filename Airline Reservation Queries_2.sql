-- Lines 2 to 8 creates a table using GROUP BY with the SUM function
SELECT 
    Currency,
    SUM(FlightPrice)
FROM
    Booking
GROUP BY
    Currency;

--Lines 11 to 17 combines 2 tables from the database using INNER JOIN - Customers & Reference
SELECT
    Customers.*,
    Reference.ReferenceID
FROM
    Customers INNER JOIN Reference
ON
    Customers.CustomerID = Reference.CustomerID;

-- Lines 20 to 28 combines 3 tables from the database - Customers, Reference & Booking
SELECT
    Customers.*,
    Reference.ReferenceID
FROM
    Customers INNER JOIN Reference
ON
    Customers.CustomerID = Reference.CustomerID
INNER JOIN Booking
ON Reference.BookingReference = Booking.BookingReference;

-- Lines 31 to 41 creates a View using the JOIN
CREATE VIEW Temp
AS
    SELECT 
    Customers.*,
    Reference.ReferenceID
FROM
    Customers INNER JOIN Reference
ON
    Customers.CustomerID = Reference.CustomerID
INNER JOIN Booking
ON Reference.BookingReference = Booking.BookingReference;

-- Lines 44 to 52 runs a query on the View created
SELECT
    Nationality,
    COUNT(Nationality)
FROM
    Temp
GROUP BY
    Nationality
ORDER BY
    Count(Nationality) DESC;
    
-- Lines 55 to 72 creates a procedure to check the total available seats on a flight
DELIMITER $$
CREATE PROCEDURE 
    Seats(id VARCHAR(4))
BEGIN
    SELECT
        FlightID,
        SUM(AvailableClassSeats)
    FROM
        Flight_Class
    WHERE 
        FlightId = id
    GROUP BY
        FlightID
    ORDER BY
        FlightID;
END$$
DELIMITER;
CALL Seats('AC01');