INSERT INTO prestatario (nombre, correo) VALUES
('Ana López', 'ana.lopez@example.com'),
('Carlos Méndez', 'carlos.mendez@example.com'),
('María García', 'maria.garcia@example.com');

INSERT INTO equipo (codigo_equipo, nombre, categoria) VALUES
('CAM-001', 'Cámara Canon EOS', 'Cámara'),
('MIC-001', 'Micrófono inalámbrico', 'Audio'),
('PRO-001', 'Proyector Epson', 'Proyección'),
('TRI-001', 'Trípode profesional', 'Accesorio');

INSERT INTO prestamo
(id_prestatario, fecha_prestamo, fecha_devolucion_prevista, fecha_devolucion_real, estado)
VALUES
(1, DATE '2026-11-01', DATE '2026-11-12', NULL, 'ACTIVO'),
(2, DATE '2026-10-20', DATE '2026-10-25', DATE '2026-10-24', 'DEVUELTO'),
(1, DATE '2026-10-28', DATE '2026-11-05', DATE '2026-11-05', 'DEVUELTO');

INSERT INTO detalle_prestamo (id_prestamo, id_equipo, cantidad) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 1, 1),
(3, 4, 1);
