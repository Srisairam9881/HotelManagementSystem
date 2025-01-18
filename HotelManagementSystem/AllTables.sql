use hotel;
-- Creating UserProfile table
CREATE TABLE UserProfile (
    UserID INTEGER NOT NULL,
    FullName VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    MobileNumber VARCHAR(15) NOT NULL,
    Password VARCHAR(30) NOT NULL,
    Role VARCHAR(10) CHECK (Role IN ('Admin', 'Customer')),
    PRIMARY KEY (UserID)
);

-- Creating RoomType table
CREATE TABLE RoomType (
    RoomTypeID INTEGER NOT NULL auto_increment,
    RoomTypeName VARCHAR(20) CHECK (RoomTypeName IN ('suite', 'single room', 'double room')),
    Price DECIMAL(10, 2) NOT NULL,
    ServiceCharge DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (RoomTypeID)
);

-- Creating Rooms table
CREATE TABLE Rooms (
    RoomID INTEGER NOT NULL auto_increment,
    RoomTypeID INTEGER NOT NULL,
    FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID),
    PRIMARY KEY (RoomID)
);

-- Creating Reservation table
CREATE TABLE Reservation (
    ReservationID INTEGER NOT NULL auto_increment,
    UserID INTEGER NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    RoomTypeID INTEGER NOT NULL,
    NoOfRooms INTEGER NOT NULL,
    Status VARCHAR(10) CHECK (Status IN ('Approved', 'Cancelled', 'Rejected')),
    FOREIGN KEY (UserID) REFERENCES UserProfile(UserID),
    FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID),
    PRIMARY KEY (ReservationID)
);

-- Creating RoomReservations table
CREATE TABLE RoomReservations (
    RoomReservationID INTEGER NOT NULL auto_increment,
    RoomID INTEGER NOT NULL,
    ReservationID INTEGER NOT NULL,
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
    PRIMARY KEY (RoomReservationID)
);

-- Creating Billing table
CREATE TABLE Billing (
    BillID INTEGER NOT NULL auto_increment,
    ReservationID INTEGER NOT NULL,
    RoomAmount DECIMAL(10, 2) NOT NULL,
    AdditionalCharges DECIMAL(10, 2) DEFAULT 0,
    PaymentStatus VARCHAR(10) CHECK (PaymentStatus IN ('Paid', 'Unpaid')),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
    PRIMARY KEY (BillID)
);