-- Archivo donde se crean las tablas para luego insertar los datos tratar de mantener el mismo orden para su posterior edicion

-- Tabla de vuelo
CREATE TABLE Flight (
  Id_Flight SERIAL PRIMARY KEY,
  Date DATE,
  Scheduled_departure TIME,
  Scheduled_arrival TIME,
  Actual_departure TIME,
  Actual_arrival TIME,
  Flight_Status INT, --Revisar si realmente es un entero en la tabla
  Flight_update_ts TIME,
  Id_aircraft INT,
  Id_departure_airport INT,
  Id_arrival_airport INT,
  FOREIGN KEY(Id_aircraft) REFERENCES Aircraft(Id_aircraft),
  FOREIGN KEY(Id_departure_airport) REFERENCES Airport(Id_airport),
  FOREIGN KEY(Id_arrival_airport) REFERENCES Airport(Id_airport)
)

-- Tabla de aeropuerto
CREATE TABLE Airport (
  Id_airport SERIAL PRIMARY KEY,
  Airport_name VARCHAR(50),
  Airport_city VARCHAR(50),
  Airport_timezone VARCHAR(50),
  Airport_iso_region VARCHAR(50),
  Airport_is_Intl INT,
  Airport_continent VARCHAR(50),
  Airport_iso_coutry VARCHAR(4),
  Airport_code VARCHAR(5)
)

-- Tabla de pase_abordaje
CREATE TABLE Boarding_Pass (
  Seat VARCHAR(5) NOT NULL,     --Si tenemos un asiento asignado, entonces viajamos y necesitamos saber el valor
  Boarding_Time TIME NOT NULL,  --Cómo abordamos si no sabemos cuando 
  Precheck BOOLEAN NOT NULL,    --Los valores a tomar son solo TRUE o FALSE, debe tener una valor claro
  Boarding_Pass_Update_Ts TIMESTAMP,
  PRIMARY KEY(Id_Passenger,Id_Segment)
  FOREIGN KEY(Id_passenger) REFERENCES Passenger(Id_passenger),
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
CREATE TABLE loyalty_program
(
 id_program SERIAL PRIMARY KEY
 program_name  CHAR(1) NULL CHECK (title = "M" or title IS NULL),
 program_level INT,
 award_points INT NULL 
)
-- Tabla de usuario de fidelizacion
CREATE TABLE frequent_flyer 
(
  id_user INT PRIMARY KEY, 
  id_program SERIAL PRIMARY KEY, 
  FOREIGN KEY (id_user) REFERENCE user_account(account_id)
  FOREIGN KEY (id_program) REFERENCE loyalty_program(id_program)
)
-- Tabla de reserva
create table booking
(
 booking_ref INT PRIMARY KEY,
 date DATE,
 price NUMERIC NOT NULL,
 booking_name varchar (50)
 update_ts TIMESTAMP,
 FOREIGN KEY (account_id) REFERENCES user_account(account_id)
)
