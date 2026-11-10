-- 1. Base de datos y usuario activos
SELECT current_database() AS base_activa, current_user AS usuario_activo;

-- 2. Consultar préstamos y prestatarios
SELECT p.id_prestamo, pr.nombre, pr.correo, p.fecha_prestamo,
       p.fecha_devolucion_prevista, p.fecha_devolucion_real, p.estado
FROM prestamo p
JOIN prestatario pr ON pr.id_prestatario = p.id_prestatario
ORDER BY p.id_prestamo;

-- 3. Consultar equipos incluidos en cada préstamo
SELECT p.id_prestamo, e.codigo_equipo, e.nombre AS equipo, d.cantidad
FROM detalle_prestamo d
JOIN prestamo p ON p.id_prestamo = d.id_prestamo
JOIN equipo e ON e.id_equipo = d.id_equipo
ORDER BY p.id_prestamo, e.codigo_equipo;

-- 4. Ver préstamos activos sin fecha real de devolución
SELECT id_prestamo, estado, fecha_devolucion_real
FROM prestamo WHERE estado = 'ACTIVO';

-- PRUEBAS INVÁLIDAS: descomentar y ejecutar UNA POR UNA.
-- A) UNIQUE: correo duplicado (debe fallar)
-- INSERT INTO prestatario (nombre, correo)
-- VALUES ('Persona duplicada', 'ana.lopez@example.com');

-- B) CHECK: cantidad cero (debe fallar)
-- INSERT INTO detalle_prestamo (id_prestamo, id_equipo, cantidad)
-- VALUES (1, 3, 0);

-- C) FOREIGN KEY: prestatario inexistente (debe fallar)
-- INSERT INTO prestamo
-- (id_prestatario, fecha_prestamo, fecha_devolucion_prevista, estado)
-- VALUES (9999, DATE '2026-11-10', DATE '2026-11-15', 'ACTIVO');
