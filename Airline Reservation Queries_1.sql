-- #1 Lines 2 to 15 lists all flights and their details such as the number of seats by class 
SELECT 
    Flight.FlightID, 
    Flight_Class.FlightClassID, 
    Flight.AirlineID, 
    Flight.DepartureCity, 
    Flight.ArrivalCity, 
    Flight.DepartureDateTime, 
    Flight.ArrivalDateTime, 
    Flight_Class.ClassName, 
    Flight_Class.TotalClassSeats 
FROM 
    Flight INNER JOIN Flight_Class 
ON 
    Flight.FlightID = Flight_Class.FlightID;

-- #2 Lines 18 to 29 upgrades a passenger's flight class from economy to first without altering the price
UPDATE 
    Booking 
SET 
    FlightClassID = 'AF02_First', SeatNumber = 'A05' 
WHERE 
    BookingReference = 'QPR456';
SELECT 
    * 
FROM 
    Booking 
WHERE 
    BookingReference = 'QPR456';

-- #3 Lines 32 to 39 deletes a payment record from the payment table
DELETE FROM
    Payment
WHERE
    PaymentID = 1;
SELECT
    *
FROM
    Payment;

-- #4 Lines 42 to 61 deletes a flight record from the flight table and confirms the delete on cascade function for every table associated with the flight record
DELETE FROM
    Flight
WHERE
    FlightId = 'AC01';
SELECT
    *
FROM
    Airport;        
SELECT
    *
FROM
    Flight;
SELECT
    *
FROM
    Booking;   
SELECT
    *
FROM
    Flight_Class;      

-- #5 Lines 64 to 73 lists all the bookings for a flight including the booking office
SELECT
    Booking.*,
    Booking_Office.City,
    Booking_Office.Country
FROM
    Booking INNER JOIN Booking_Office
ON
    Booking.OfficeID = Booking_Office.OfficeID    
WHERE
    FlightID = 'BA01';

-- #6 Lines 76 to 84 lists all bookings associated with a customer
SELECT
    Booking.*,
    Reference.CustomerID
FROM
    Booking INNER JOIN Reference
ON
    Booking.BookingReference = Reference.BookingReference
WHERE
    CustomerID = 'FH1984';

 -- #7 Lines 87 to 92 lists the payments made grouped by the currency
SELECT
    Currency,
    SUM(PaymentDue)    
FROM
    Payment
GROUP BY
    Currency;

-- Lines 96 to 109 combines 3 tables from the database
SELECT
    Customers.*,
    Reference.ReferenceID,
    Booking.FlightID,
    Booking.SeatNumber,
    Payment.PaymentStatus
FROM
    Customers INNER JOIN Reference
ON
    Customers.CustomerID = Reference.CustomerID
INNER JOIN Booking
ON Reference.BookingReference = Booking.BookingReference
INNER JOIN Payment
ON Booking.BookingReference = Payment.BookingReference;