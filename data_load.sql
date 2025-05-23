-- En este archivo vamos a cargar los datos a las tablas,
-- La idea es que quede separado por el orden y mantener 
-- Que cada archivo sea modular

-- Hay que cargar la tabla del csv, lo hacemos al final

CREATE TABLE bookings (
    booking_ref VARCHAR(50),
    booking_email VARCHAR(100),
    booking_phone VARCHAR(20),
    booking_leg_id BIGINT,
    booking_name VARCHAR(200),
    booking_price NUMERIC(10,2),
    flight_no VARCHAR(20),
    flight_status VARCHAR(50),
    is_returning BOOLEAN,
    leg_num INTEGER,
    departure_airport_code VARCHAR(10),
    departure_airport_name VARCHAR(100),
    departure_city VARCHAR(100),
    departure_airport_tz VARCHAR(50),
    departure_continent VARCHAR(50),
    departure_airport_intl BOOLEAN,
    departure_iso_country VARCHAR(10),
    departure_iso_region VARCHAR(20),
    arrival_airport_code VARCHAR(10),
    arrival_airport_name VARCHAR(100),
    arrival_city VARCHAR(100),
    arrival_airport_tz VARCHAR(50),
    arrival_continent VARCHAR(50),
    arrival_airport_intl BOOLEAN,
    arrival_iso_country VARCHAR(10),
    arrival_iso_region VARCHAR(20),
    aircraft_code VARCHAR(20),
    aircraft_model VARCHAR(100),
    aircraft_range INTEGER,
    aircraft_velocity INTEGER,
    aircraft_class VARCHAR(50),
    id_reserva VARCHAR(50),
    id_segmento VARCHAR(50),
    id_pasajero VARCHAR(50),
    id_asiento VARCHAR(50),
    id_usuario VARCHAR(50),
    id_telefono VARCHAR(50),
    id_cuenta VARCHAR(50),
    id_programa VARCHAR(50),
    nombre_usuario VARCHAR(100),
    apellido_usuario VARCHAR(100),
    email VARCHAR(100),
    nombre_pasajero VARCHAR(100),
    apellido_pasajero VARCHAR(100),
    pasaporte VARCHAR(50),
    edad INTEGER,
    nombre_programa VARCHAR(100),
    tipo_nivel VARCHAR(50),
    award_points INTEGER,
    numero_telefono VARCHAR(20),
    asiento VARCHAR(10),
    pre_check BOOLEAN,
    flight_update_ts TIMESTAMP,
    boarding_pass_update_ts TIMESTAMP,
    passenger_update_ts TIMESTAMP,
    account_update_ts TIMESTAMP,
    frequent_flyer_update_ts TIMESTAMP,
    phone_update_ts TIMESTAMP,
    scheduled_departure TIMESTAMP,
    actual_departure TIMESTAMP,
    scheduled_arrival TIMESTAMP,
    actual_arrival TIMESTAMP
);

COPY bookings
FROM '/ruta/bookings_small.csv'
DELIMITER ','
CSV HEADER;

INSERT INTO Flight (Id_Flight , Flight_Date, cheduled_Departure,  Scheduled_Arrival , Actual_Departure , Actual_Arrival,  Id_Departure_Airport, Id_Arrival_Airport, Flight_Status, Flight_Update_TS)
SELECT DISTINCT
    flight_no,
    NULL,
    scheduled_departure,
    scheduled_arrival,
    actual_departure,
    actual_arrival,
    aircraft_code,
    departure_airport_code,
    arrival_airport_code,
    flight_status,
    flight_update_ts
FROM bookings
WHERE flight_no IS NOT NULL;

INSERT INTO Airport ( Id_Airport,Airport_Name, Airport_City, Airport_Country , Airport_Timezone, Airport_Continent,Airport_Is_Intl,  Airport_Iso_Coutry, Airport_Continent)
SELECT DISTINCT 
    arrival_airport_code,
    arrival_airport_name,
    arrival_city,
    Departure_iso_country,                      
    arrival_airport_tz,                      
    arrival_continent,
    arrival_airport_intl,
    arrival_iso_country,
    arrival_iso_region
FROM bookings
WHERE arrival_airport_code IS NOT NULL;

INSERT INTO Boarding_Pass (Id_passenger, Id_Segment, Seat, Boarding_Time, Precheck, Boarding_Pass_Update_Ts)
SELECT DISTINCT
    passenger_no,
    booking_leg_id,
    booking_pass_seat,
    boarding_time,
    precheck,
    boarding_pass_update_ts
FROM bookings
WHERE passenger_no IS NOT NULL
  AND booking_leg_id IS NOT NULL;

INSERT INTO Passenger (Id_passenger, Name, Last_Name, Passport, Age)
SELECT DISTINCT
    passenger_no,
    NULL,
    NULL,
    NULL,
    passenger_age
FROM bookings
WHERE passenger_no IS NOT NULL;

--Tabla Telefono
INSERT INTO Phone( Id_Telephone, phone_Number, Id_Account)
SELECT DISTINCT
    account_phone,
    booking_phone,
    account_login
FROM bookings
WHERE account_phone IS NOT NULL;


--Tabla Aeropuerto
INSERT INTO Aircraft (Id_Aircraft, Model, Range, Velocity, Aircraft_Class)
SELECT DISTINCT
    aircraft_code,
    aircraft_model,
    aircraft_range,
    aircraft_velocity,
    aircraft_class
FROM bookings
WHERE aircraft_code IS NOT NULL;

--Tabla Segmento Vuelo
INSERT INTO Flight_Segment (Id_Segment, Leg_Number, IS_Returning, Booking_Leg_Update_TS)
SELECT DISTINCT
    booking_leg_id,
    leg_num,
    is_returning,
    booking_leg_update_ts
FROM bookings
WHERE booking_leg_id IS NOT NULL;

INSERT INTO Loyalty_program (Id_Program,Program_Name,Program_Level,Award_Points)
SELECT DISTINCT
  frequent_flyer_card_num ,
  program_name,
  frequen_flyer_title,
  frequent_flyer_level,
  frequent_flyer_award_points
 FROM bookings 
 where frequent_flyer_card_num IS NOT NULL;

 INSERT INTO Frequent_flyer (Id_Account,Id_Program)
 SELECT DISTINCT 
  account_login,
  frequent_flyer_card_num
 FROM bookings 
 WHERE account_loging IS NOT NULL
  AND frequent_flyer_card_num IS NOT NULL;

 INSERT INTO Booking (Booking_Ref,Booking_Date,Price,Booking_Name,Update_Ts,Account_Id)
 SELECT DISTINCT
  booking_ref,
  NULL,
  booking_price,
  booking_name, 
  booking_update_ts
  account_login
 From bookings
 WHERE booking_ref IS NOT NULL;

INSERT INTO User_Account (Account_Id,User_Name,User_Lastname)
SELECT DISTINCT 
account_login,
account_first_name, 
account_last_name
FROM bookings
WHERE account_login IS NOT NULL;

    
