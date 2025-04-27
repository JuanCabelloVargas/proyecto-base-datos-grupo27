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
  Id_Passenger SERIAL PRIMARY KEY,
  Id_Segment SERIAL PRIMARY KEY,
  Seat VARCHAR(50),
  Boarding_Time TIME,
  Precheck BOOLEAN,
  Boarding_Pass_Update_Ts TIME,
  FOREIGN KEY(Id_passenger) REFERENCES Passenger(Id_passenger),
  FOREIGN KEY(Id_Segment) REFERENCES Segment_Fly(Id_Segment)
)

-- Tabla de pasajero
CREATE TABLE Passenger (
  Id_Passenger SERIAL PRIMARY KEY,
  Name STRING,
  Last_Name STRING,
  Passport STRING,
  Age INT
)
  

