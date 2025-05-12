-- Archivo donde se crean las tablas para luego insertar los datos tratar de mantener el mismo orden para su posterior edicion

-- Tabla de aeropuerto
CREATE TABLE Airport (
  Id_Airport SERIAL PRIMARY KEY,
  Airport_Name VARCHAR(100),
  Airport_City VARCHAR(100),
  Airport_Country VARCHAR(50),
  Airport_Timezone VARCHAR(50),
  Airport_Iso_Region VARCHAR(20),
  Airport_Is_Intl BOOLEAN,
  Airport_Continent VARCHAR(50),
  Airport_Iso_Country VARCHAR(4),
  Airport_Code VARCHAR(5)
);

-- Tabla de aeronave
CREATE TABLE Aircraft (
  Id_Aircraft SERIAL PRIMARY KEY,
  Model VARCHAR(100),
  Range INT,
  Velocity INT,
  Aircraft_Class VARCHAR(50)
);

-- Tabla de pasajero
CREATE TABLE Passenger (
  Id_Passenger SERIAL PRIMARY KEY,
  Name VARCHAR(100),
  Last_Name VARCHAR(100),
  Passport VARCHAR(50),
  Age INT
);

-- Tabla de cuenta de usuario
CREATE TABLE User_Account (
  Account_Id SERIAL PRIMARY KEY,
  User_Name VARCHAR(100),
  User_LastName VARCHAR(100)
);

-- Tabla de teléfono
CREATE TABLE Phone (
  Id_Telephone SERIAL PRIMARY KEY,
  Phone_Number VARCHAR(20),
  Id_Account INT,
  FOREIGN KEY(Id_Account) REFERENCES User_Account(Account_Id)
);

-- Tabla de programa de fidelización
CREATE TABLE Loyalty_Program (
  Id_Program SERIAL PRIMARY KEY,
  Program_Name VARCHAR(100),
  Program_Level VARCHAR(50),
  Award_Points INT
);

-- Tabla de usuario frecuente
CREATE TABLE Frequent_Flyer (
  Id_User INT,
  Id_Program INT,
  PRIMARY KEY(Id_User, Id_Program),
  FOREIGN KEY(Id_User) REFERENCES User_Account(Account_Id),
  FOREIGN KEY(Id_Program) REFERENCES Loyalty_Program(Id_Program)
);

-- Tabla de reserva
CREATE TABLE Booking (
  Booking_Ref VARCHAR(50) PRIMARY KEY,
  Booking_Date DATE,
  Price NUMERIC NOT NULL,
  Booking_Name VARCHAR(100),
  Update_Ts TIMESTAMP,
  Account_Id INT,
  FOREIGN KEY (Account_Id) REFERENCES User_Account(Account_Id)
);

-- Tabla de segmento de vuelo
CREATE TABLE Flight_Segment (
  Id_Segment SERIAL PRIMARY KEY,
  Leg_Number INT,
  IS_Returning BOOLEAN,
  Booking_Leg_Update_Ts TIMESTAMP
);

-- Tabla de pase de abordaje
CREATE TABLE Boarding_Pass (
  Id_Passenger INT,
  Id_Segment INT,
  Seat VARCHAR(10) NOT NULL,
  Boarding_Time TIME NOT NULL,
  Precheck BOOLEAN NOT NULL,
  Boarding_Pass_Update_Ts TIMESTAMP,
  PRIMARY KEY(Id_Passenger, Id_Segment),
  FOREIGN KEY(Id_Passenger) REFERENCES Passenger(Id_Passenger),
  FOREIGN KEY(Id_Segment) REFERENCES Flight_Segment(Id_Segment)
);

-- Tabla de vuelo
CREATE TABLE Flight (
  Id_Flight SERIAL PRIMARY KEY,
  Flight_Date DATE,
  Scheduled_Departure TIMESTAMP,
  Scheduled_Arrival TIMESTAMP,
  Actual_Departure TIMESTAMP,
  Actual_Arrival TIMESTAMP,
  Flight_Status VARCHAR(50),
  Flight_Update_Ts TIMESTAMP,
  Id_Aircraft INT,
  Id_Departure_Airport INT,
  Id_Arrival_Airport INT,
  FOREIGN KEY(Id_Aircraft) REFERENCES Aircraft(Id_Aircraft),
  FOREIGN KEY(Id_Departure_Airport) REFERENCES Airport(Id_Airport),
  FOREIGN KEY(Id_Arrival_Airport) REFERENCES Airport(Id_Airport)
);
