# Proyecto Base de Datos UAndes 2025-01

Consiste en la creacion de un modelo relacional para la gestion de vuelos nacionales e internacionales de una compa;ia aerea.

## Estructura del Proyecto

- "schema.sql" -> Archivo donde se crean todas las tablas necesarias para el sistema.
- "data_load.sql" -> Archivo donde se insertan los datos a las tablas desde la tabla entregada en Canvas.

## Instrucciones de uso:

### 1. Crear la base de datos (para la primera ejecucion en local)
Desde la terminal de PostgresSQL:

```bash
createdb data_base_project(o el nombre que se establezca)
```
### 2. Ejecutar script de creacion de tablas
```bash
psql -d data_base_project -f /schema.sql
```

### 3. Cargar los datos iniciales
```bash
psql -d data_base_project -f /data_load.sql
```

### 4. (opcional) Verificar las tablas creadas

Dentro de psql:

```bash
\dt
```
y consultar datos, por ejemplo para aeropuerto:

```sql
SELECT * FROM Airport;
```
## Requisitos:

- Instalar PostgresSQL
- Acceso al cliente psql para ejecutar los scripts

## Notas adicionales:

Se pueden ver mas detalles sobre el codigo y sus cambios en el [Github](https://github.com/JuanCabelloVargas/proyecto-base-datos-grupo27) del proyecto

## Integrantes:

- Juan Cabello
- Daniela Loayza
- Sebastian Letelier
- Arantxa Toledo
