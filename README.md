# Semana 5: Del dato desordenado a una base de datos relacional en PostgreSQL

## Configuración
1. Copia `.env.example` y renombra la copia a `.env`.
2. Cambia `POSTGRES_PASSWORD` por una contraseña propia.
3. Abre una terminal en esta carpeta y ejecuta `docker compose up -d`.

## Conexión en DataGrip
- Host: `localhost`
- Puerto: `5436`
- Base de datos: `prestamos_av`
- Usuario: `postgres`
- Contraseña: la indicada en `.env`

## Ejecutar SQL en este orden
1. `schema.sql` — crea las tablas y restricciones.
2. `seed.sql` — inserta datos de ejemplo.
3. `validation.sql` — comprueba los datos y contiene tres pruebas inválidas comentadas.

Comprueba la conexión con `SELECT current_database(), current_user;`.

## Modelo
<img width="1025" height="1389" alt="image" src="https://github.com/user-attachments/assets/ba73668c-71e6-4187-bee9-293b2d119b59" />


## Decisiones de diseño
- Un prestatario puede registrar varios préstamos; cada préstamo pertenece a un prestatario.
- Cada préstamo se desglosa en DETALLE_PRESTAMO, que relaciona el préstamo con los equipos.
- Correo del prestatario y código del equipo son únicos.
- La cantidad debe ser mayor que cero.
- Estados permitidos: ACTIVO, DEVUELTO, ATRASADO y CANCELADO.
- La fecha real de devolución admite NULL mientras el préstamo no esté DEVUELTO.
- La fecha prevista no puede ser anterior a la fecha del préstamo.
- Un equipo no se repite en dos líneas del mismo préstamo; la cantidad representa las unidades.
- El flujo de registro debe asegurar que cada préstamo tenga al menos un detalle; las claves foráneas garantizan que cada detalle apunte a registros existentes.

## Entrega
- Repositorio GitHub público: PEGAR_URL
- Video público de máximo 3 minutos: PEGAR_URL
- Diagrama: `modelo.mmd`

Antes de entregar, reemplaza los enlaces y comprueba que se abran en una ventana de incógnito.
