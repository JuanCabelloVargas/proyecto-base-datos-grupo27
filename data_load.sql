-- En este archivo vamos a cargar los datos a las tablas,
-- La idea es que quede separado por el orden y mantener 
-- Que cada archivo sea modular

-- Hay que cargar la tabla del csv, lo hacemos al final

INSERT INTO Flight (Id_Vuelo, Fecha, Hora_Salida_Programada, Hora_Llegada_Programada, Hora_Salida_Real, Hora_Llegada_Real, Id_Aeronave, Id_Aeropuerto_Origen, Id_Aeropuerto_Destino, Flight_Status, Flight_Update_TS)
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

INSERT INTO Aeropuerto (Id_Aeropuerto, Nombre, Ciudad, Pais, Zona_Horaria, Tipo, Continente_Aeropuerto, Aeropuerto_Internacional, ISO_Pais, ISO_Region)
SELECT DISTINCT
    arrival_airport_code,
    arrival_airport_name,
    arrival_city,
    NULL,
    arrival_airport_tz,
    NULL,
    arrival_continent,
    arrival_airport_intl,
    arrival_iso_country,
    arrival_iso_region
FROM bookings
WHERE arrival_airport_code IS NOT NULL;
