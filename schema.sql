-- Archivo donde se crean las tablas para luego insertar los datos tratar de mantener el mismo orden para su posterior edicion

-- Tabla de vuelo
CREATE TABLE Flight (
  Id_Flight SERIAL PRIMARY KEY,
  flight_Date DATE,
  Scheduled_Departure TIME,
  Scheduled_Arrival TIME,
  Actual_Departure TIME,
  Actual_Arrival TIME,
  Flight_Status INT, --Revisar si realmente es un entero en la tabla
  Flight_Update_Ts TIME,
  Id_Aircraft INT,
  Id_Departure_Airport INT,
  Id_Arrival_Airport INT,
  FOREIGN KEY(Id_Aircraft) REFERENCES Aircraft(Id_Aircraft),
  FOREIGN KEY(Id_Departure_Airport) REFERENCES Airport(Id_Airport),
  FOREIGN KEY(Id_Arrival_Airport) REFERENCES Airport(Id_Airport)
)

-- Tabla de aeropuerto
CREATE TABLE Airport (
  Id_Airport SERIAL PRIMARY KEY,
  Airport_Name VARCHAR(50),
  Airport_City VARCHAR(50),
  Airport_Country VARCHAR (50)
  Airport_Timezone VARCHAR(50),
  Airport_Iso_Region VARCHAR(50),
  Airport_Is_Intl INT,
  Airport_Continent VARCHAR(50),
  Airport_Iso_Coutry VARCHAR(4),
  Airport_Code VARCHAR(5)
)

-- Tabla de pase_abordaje
CREATE TABLE Boarding_Pass (
  Seat VARCHAR(5) NOT NULL,     --Si tenemos un asiento asignado, entonces viajamos y necesitamos saber el valor
  Boarding_Time TIME NOT NULL,  --Cómo abordamos si no sabemos cuando 
  Precheck BOOLEAN NOT NULL,    --Los valores a tomar son solo TRUE o FALSE, debe tener una valor claro
  Boarding_Pass_Update_Ts TIMESTAMP,
  PRIMARY KEY(Id_Passenger,Id_Segment)
  FOREIGN KEY(Id_Passenger) REFERENCES Passenger(Id_Passenger),
  FOREIGN KEY(Id_Segment) REFERENCES Segment_Fly(Id_Segment)
)

-- Tabla de pasajero
CREATE TABLE Passenger (
  Id_Passenger SERIAL PRIMARY KEY,
  Name VARCHAR(50),
  Last_Name VARCHAR(50),
  Passport VARCHAR(50),
  Age INT
)
  
--Tabla de programa de fidelización
CREATE TABLE Loyalty_Program
(
 Id_Program SERIAL PRIMARY KEY
 Program_Name  CHAR(1) NULL CHECK (title = "M" or title IS NULL),
 Program_Level INT,
 Award_Points INT NULL 
)
-- Tabla de usuario de fidelizacion
CREATE TABLE Frequent_flyer 
(
  Id_User INT PRIMARY KEY, 
  Id_Program SERIAL PRIMARY KEY, 
  FOREIGN KEY (Id_User) REFERENCE User_account(Account_Id)
  FOREIGN KEY (Id_Program) REFERENCE Loyalty_program(Id_Program)
)
-- Tabla de reserva
create table Booking
(
 Booking_Ref INT PRIMARY KEY,
 Booking_Date DATE,
 Price NUMERIC NOT NULL,
 Booking_Name VARCHAR (50)
 Update_Ts TIMESTAMP,
 FOREIGN KEY (Account_Id) REFERENCES User_account(Account_Id)
)
  
--Tabla de cuenta usuario 
CREATE TABLE User_Account (
account_id SERIAL PRIMARY KEY 
user_name VARCHAR (50) 
user_lastname VARCHAR(50) 
)
  
--Tabla de Telefono
CREATE TABLE Phone ( 
    Id_Telephone SERIAL PRIMARY KEY,
    phone_Number INT,
    Id_Account INT,
    FOREIGN KEY(Id_Account) REFERENCES Account(Id_Account)
)

--Tabla de Aeronave
CREATE TABLE Aircraft (
  Id_Aircraft SERIAL PRIMARY KEY,
  Model VARCHAR(50),
  Range INT,
  Velocity INT,
  Aircraft_Class INT
)

--Tabla del segmento de vuelo
CREATE TABLE Flight_Segment (
  Id_Segment SERIAL PRIMARY KEY,
  Leg_Number INT,
  IS_Returning BOOLEAN,  --booleano
  Booking_Leg_Update_Ts TIMESTAMP
)
