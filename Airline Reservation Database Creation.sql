-- Lines 2 to 3 create the database
CREATE DATABASE ERD_23196263;
USE ERD_23196263;

--Lines 6 to 19 create the Booking_Office table and inserts the values
CREATE TABLE Booking_Office (
   OfficeID VARCHAR(4) NOT NULL PRIMARY KEY,
   City VARCHAR(30) NOT NULL,
   Country VARCHAR(30) NOT NULL 
);

INSERT INTO Booking_Office (OfficeID, City, Country)
    VALUES ('AR78', 'Toronto', 'Canada');
INSERT INTO Booking_Office (OfficeID, City, Country)
    VALUES ('AR46', 'New York', 'US');
INSERT INTO Booking_Office (OfficeID, City, Country)
    VALUES ('AR33', 'Paris', 'France');
INSERT INTO Booking_Office (OfficeID, City, Country)
    VALUES ('AR99', 'Rome', 'Italy'); 

-- Lines 22 to 38 create the Airline table and inserts the values
CREATE TABLE Airline (
    AirlineID VARCHAR(10) NOT NULL PRIMARY KEY,
    AirlineName VARCHAR(30) NOT NULL
);

INSERT INTO Airline (AirlineID, AirlineName)
    VALUES ('AirCan', 'Air Canada');
INSERT INTO Airline (AirlineID, AirlineName)
    VALUES ('USAir', 'US Airways');
INSERT INTO Airline (AirlineID, AirlineName)
    VALUES ('BritAir', 'British Airways');
INSERT INTO Airline (AirlineID, AirlineName)
    VALUES ('AirFra', 'Air France');
INSERT INTO Airline (AirlineID, AirlineName)
    VALUES ('LuftAir', 'Lufthansa Airways');
INSERT INTO Airline (AirlineID, AirlineName)
    VALUES ('AirItal', 'Air Italia');

-- Lines 41 to 61 create the Flight table and inserts the values
CREATE TABLE Flight (
    FlightID VARCHAR(4) NOT NULL PRIMARY KEY,
    AirlineID VARCHAR (10) NOT NULL,
    DepartureCity VARCHAR (30) NOT NULL,
    ArrivalCity VARCHAR (30) NOT NULL,
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL,
    TotalSeats INT NOT NULL,
    BookedSeats INT,
    EmptySeats INT,
    FlightStatus VARCHAR (30) NOT NULL,
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID)
    ON DELETE CASCADE
);

INSERT INTO Flight (FlightID, AirlineID, DepartureCity, ArrivalCity, DepartureDateTime, ArrivalDateTime, TotalSeats, BookedSeats, EmptySeats, FlightStatus)
    VALUES ('AC01', 'AirCan', 'Toronto', 'Montreal', '2023-01-02 18:05:00', '2023-02-02 13:05:00', 40, 15, 25, 'On Schedule');
INSERT INTO Flight (FlightID, AirlineID, DepartureCity, ArrivalCity, DepartureDateTime, ArrivalDateTime, TotalSeats, BookedSeats, EmptySeats, FlightStatus)
    VALUES ('AF02', 'AirFra', 'New York', 'Paris', '2023-05-03 10:05:00', '2023-05-04 18:05:00', 60, 50, 10, 'Delayed');
INSERT INTO Flight (FlightID, AirlineID, DepartureCity, ArrivalCity, DepartureDateTime, ArrivalDateTime, TotalSeats, BookedSeats, EmptySeats, FlightStatus)
    VALUES ('BA01', 'BritAir', 'Paris', 'London', '2023-08-04 19:05:00', '2023-08-07 18:05:00', 10, 5, 5, 'In Flight');

-- Lines 64 to 88 create the Flight_Class table and inserts the values
CREATE TABLE Flight_Class (
    FlightClassID VARCHAR (13) NOT NULL PRIMARY KEY,
    FlightID VARCHAR(4) NOT NULL,
    ClassName VARCHAR (8) NOT NULL,
    TotalClassSeats INT NOT NULL,
    BookedClassSeats INT,
    AvailableClassSeats INT,
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
    ON DELETE CASCADE
);

INSERT INTO Flight_Class (FlightClassID, FlightID, ClassName, TotalClassSeats, BookedClassSeats, AvailableClassSeats)
    VALUES ('AC01_Economy', 'AC01', 'Economy', 25, 5, 20);
INSERT INTO Flight_Class (FlightClassID, FlightID, ClassName, TotalClassSeats, BookedClassSeats, AvailableClassSeats)
    VALUES ('AC01_Business', 'AC01', 'Business', 10, 7, 3);
INSERT INTO Flight_Class (FlightClassID, FlightID, ClassName, TotalClassSeats, BookedClassSeats, AvailableClassSeats)
    VALUES ('AC01_First', 'AC01', 'First', 5, 3, 2);
INSERT INTO Flight_Class (FlightClassID, FlightID, ClassName, TotalClassSeats, BookedClassSeats, AvailableClassSeats)
    VALUES ('AF02_Economy', 'AF02', 'Economy', 50, 37, 13);
INSERT INTO Flight_Class (FlightClassID, FlightID, ClassName, TotalClassSeats, BookedClassSeats, AvailableClassSeats)
    VALUES ('AF02_Business', 'AF02', 'Business', 10, 8, 2);
INSERT INTO Flight_Class (FlightClassID, FlightID, ClassName, TotalClassSeats, BookedClassSeats, AvailableClassSeats)
    VALUES ('AF02_First', 'AF02', 'First', 5, 1, 4);
INSERT INTO Flight_Class (FlightClassID, FlightID, ClassName, TotalClassSeats, BookedClassSeats, AvailableClassSeats)
    VALUES ('BA01_First', 'BA01', 'First', 10, 3, 7);    

-- Lines 91 to 107 create the Airport table and inserts the values
CREATE TABLE Airport (
    AirportID VARCHAR(3) NOT NULL PRIMARY KEY,
    AirportName VARCHAR(30) NOT NULL,
    FlightID VARCHAR (4) NOT NULL,
    DepartureCity VARCHAR(30) NOT NULL,
    Country VARCHAR(30) NOT NULL,
    AirportTax FLOAT NOT NULL,
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
    ON DELETE CASCADE
);

INSERT INTO Airport (AirportID, AirportName, FlightID, DepartureCity, Country, AirportTax)
    VALUES ('YYZ', 'Pearson', 'AC01', 'Toronto', 'Canada', 120);
INSERT INTO Airport (AirportID, AirportName, FlightID, DepartureCity, Country, AirportTax)
    VALUES ('JFK', 'John F Kennedy', 'AF02', 'New York', 'US', 150);
INSERT INTO Airport (AirportID, AirportName, FlightID, DepartureCity, Country, AirportTax)
    VALUES ('CDG', 'Charles de Gaulle', 'BA01', 'Paris', 'France', 110);

-- Lines 110 to 130 create the Customers table and inserts the values
CREATE TABLE Customers (
    CustomerID VARCHAR(6) NOT NULL PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    DOB DATE NOT NULL,
    CountryCode INT NOT NULL,
    MobileNumber DECIMAL(10,0) NOT NULL,
    EmailAddress VARCHAR (30) NOT NULL,
    Nationality VARCHAR (30) NOT NULL,
    IDType VARCHAR(30) NOT NULL,
    IDNumber VARCHAR(20) NOT NULL
);

INSERT INTO Customers (CustomerID, FirstName, LastName, DOB, CountryCode, MobileNumber, EmailAddress, Nationality, IDType, IDNumber)
    VALUES ('FH1984', 'Francis', 'Hernan', '1984-05-26', 52, 5302504963, 'francis@gmail.com', 'Mexico', 'Passport', 'AB771216');
INSERT INTO Customers (CustomerID, FirstName, LastName, DOB, CountryCode, MobileNumber, EmailAddress, Nationality, IDType, IDNumber)
    VALUES ('MP2000', 'Max', 'Paul', '2000-09-20', 1, 8518471773, 'max@gmail.com', 'Canada', 'Resident ID', 'FC661862');
INSERT INTO Customers (CustomerID, FirstName, LastName, DOB, CountryCode, MobileNumber, EmailAddress, Nationality, IDType, IDNumber)
    VALUES ('CL1993', 'Constance','Lane', '1993-04-17', 33, 6920810370, 'constance@gmail.com', 'France', 'Passport', 'CN759710');
INSERT INTO Customers (CustomerID, FirstName, LastName, DOB, CountryCode, MobileNumber, EmailAddress, Nationality, IDType, IDNumber)
    VALUES('LL1987', 'Lisa', 'Lang', '1987-11-22', 49, 6330785726, 'lisa@gmail.com', 'Germany', 'Passport', 'GR192336');

-- Lines 133 to 163 create the Booking table and inserts the values
CREATE TABLE Booking (
    BookingReference VARCHAR (6) NOT NULL PRIMARY KEY,
    OfficeID VARCHAR (4) NOT NULL,
    FlightID VARCHAR (4) NOT NULL,
    FlightClassID VARCHAR (13) NOT NULL,
    BookingDateTime DATETIME NOT NULL,
    SeatNumber VARCHAR (3) NOT NULL,
    Currency VARCHAR (3) NOT NULL,
    FlightPrice FLOAT NOT NULL,
    AirportTax FLOAT NOT NULL,
    TotalPrice FLOAT NOT NULL,
    PaymentType VARCHAR (20) NOT NULL,
    BookingStatus VARCHAR (6) NOT NULL,
    FOREIGN KEY (OfficeID) REFERENCES Booking_Office(OfficeID)
    ON DELETE CASCADE,
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
    ON DELETE CASCADE,
    FOREIGN KEY (FlightClassID) REFERENCES Flight_Class(FlightClassID)
    ON DELETE CASCADE
);

INSERT INTO Booking (BookingReference, OfficeID, FlightID, FlightClassID, BookingDateTime, SeatNumber, Currency, FlightPrice, AirportTax, TotalPrice, PaymentType, BookingStatus)
    VALUES ('QPR456', 'AR46', 'AF02', 'AF02_Economy', '2022-11-30 06:05:00', 'H13', 'USD', 1500, 115, 1615, 'Cash', 'Booked');
INSERT INTO Booking (BookingReference, OfficeID, FlightID, FlightClassID, BookingDateTime, SeatNumber, Currency, FlightPrice, AirportTax, TotalPrice, PaymentType, BookingStatus)
    VALUES ('FGY782', 'AR78', 'AC01', 'AC01_Business', '2022-12-03 10:05:00', 'C10', 'CAD', 1875, 120, 1995, 'Debit Card', 'Booked');
INSERT INTO Booking (BookingReference, OfficeID, FlightID, FlightClassID, BookingDateTime, SeatNumber, Currency, FlightPrice, AirportTax, TotalPrice, PaymentType, BookingStatus)
    VALUES ('NXD991', 'AR33', 'BA01', 'BA01_First', '2022-12-14 19:05:00', 'A05', 'EUR', 2250, 110, 2360, 'Credit Card', 'Booked');        
INSERT INTO Booking (BookingReference, OfficeID, FlightID, FlightClassID, BookingDateTime, SeatNumber, Currency, FlightPrice, AirportTax, TotalPrice, PaymentType, BookingStatus)
    VALUES ('MXG424', 'AR33', 'BA01', 'BA01_First', '2023-01-01 14:10:00', 'B02', 'EUR', 2250, 110, 2360, 'Debit Card', 'Booked');
INSERT INTO Booking (BookingReference, OfficeID, FlightID, FlightClassID, BookingDateTime, SeatNumber, Currency, FlightPrice, AirportTax, TotalPrice, PaymentType, BookingStatus)
    VALUES ('MXG425', 'AR33', 'BA01', 'BA01_First', '2023-01-01 14:10:00', 'B03', 'EUR',2250, 110, 2360, 'Debit Card', 'Booked');

-- Lines 166 to 185 create the Reference table and inserts the values
CREATE TABLE Reference(
    ReferenceID VARCHAR (5) NOT NULL,
    BookingReference VARCHAR (6) NOT NULL,
    CustomerID VARCHAR (6) NOT NULL,
    FOREIGN KEY (BookingReference) REFERENCES Booking(BookingReference)
    ON DELETE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
);

INSERT INTO Reference (ReferenceID, BookingReference, CustomerID)
    VALUES ('RF001', 'QPR456', 'FH1984');
INSERT INTO Reference (ReferenceID, BookingReference, CustomerID)
    VALUES ('RF002', 'FGY782', 'MP2000');
INSERT INTO Reference (ReferenceID, BookingReference, CustomerID)
    VALUES ('RF003', 'NXD991', 'CL1993');
INSERT INTO Reference (ReferenceID, BookingReference, CustomerID)
    VALUES ('RF004', 'MXG424', 'FH1984');
INSERT INTO Reference (ReferenceID, BookingReference, CustomerID)
VALUES ('RF005', 'MXG425', 'LL1987');

-- Lines 188 to 208 create the Payment table and inserts the values
CREATE TABLE Payment(
    PaymentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    BookingReference VARCHAR (6) NOT NULL,
    Currency VARCHAR (3) NOT NULL,
    PaymentDue FLOAT NOT NULL,
    PaymentDateTime DATETIME NOT NULL,
    PaymentStatus VARCHAR (20) NOT NULL,
    FOREIGN KEY (BookingReference) REFERENCES Booking(BookingReference)
    ON DELETE CASCADE
);

INSERT INTO Payment (BookingReference, Currency, PaymentDue, PaymentDateTime, PaymentStatus)
    VALUES ('QPR456', 'USD', 1615, '2022-12-01 06:05:00', 'Paid');
INSERT INTO Payment (BookingReference, Currency, PaymentDue, PaymentDateTime, PaymentStatus)
    VALUES ('FGY782', 'CAD', 1995, '2022-12-04 10:05:05', 'Paid');
INSERT INTO Payment (BookingReference, Currency, PaymentDue, PaymentDateTime, PaymentStatus)
    VALUES ('NXD991', 'EUR', 2360, '2022-12-15 19:05:10', 'Paid');  
INSERT INTO Payment (BookingReference, Currency, PaymentDue, PaymentDateTime, PaymentStatus)
    VALUES ('MXG424', 'EUR', 4720, '2023-01-02 14:10:15', 'Paid');
INSERT INTO Payment (BookingReference, Currency, PaymentDue, PaymentDateTime, PaymentStatus)
    VALUES ('MXG425', 'EUR', 4720, '2023-01-03 00:01:59', 'Paid');