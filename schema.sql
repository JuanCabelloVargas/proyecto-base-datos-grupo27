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
  Boarding_pass_Id SERIAL PRIMARY KEY,
  Boarding_seat VARCHAR(50),
  Boarding_time TIME,
  Precheck BOOLEAN,
  Boarding_pass_update_ts TIME,
  FOREIGN KEY(Id_passenger) REFERENCES Passenger(Id_passenger)
  FOREIGN KEY(Id_itinerary) REFERENCES 
)

-- Tabla de pasajero
CREATE TABLE Passenger (
  Id_passenger SERIAL PRIMARY KEY,
  Passenger_age INT,
  FOREIGN KEY(Id_reserva) REFERENCES Itinerary_reserve(Id_reserve)
)
  
--Tabla de programa de fidelización
create table frequent_flyer_program (
  card_num     SERIAL PRIMARY KEY, --frequent flyer
  title        CHAR(1) NULL CHECK (title = "M" or title IS NULL),
  frequent_flyer_level        INT     NULL,
  award_points INT     NULL,
  email        VARCHAR(50),
  phone_number INT     NULL,
  update TIME,
  FOREING      KEY(name) REFERENCES tabla_de_usario(clave primaria ),      -- dejar asi hasta que definamos otras tablas
  FOREING KEY (last_name) REFERENCE tabla_usuario(clave primaria )      -- ver que es frequent flyer update ts
)

-- Tabla de reserva
create table booking
(
  booking_ref SERIAL PRIMARY KEY,
  price NUMERIC NOT NULL,
  phone INT NOT NULL,
  user_name VARCHAR(50),
  update_ts TIME,
  FOREING KEY (usuario ) REFERENCES tabla_de_usuario(clave primaria)



)

