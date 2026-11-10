-- Esquema relacional para préstamos de equipo audiovisual
CREATE TABLE prestatario (
    id_prestatario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(160) NOT NULL UNIQUE
);

CREATE TABLE equipo (
    id_equipo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_equipo VARCHAR(40) NOT NULL UNIQUE,
    nombre VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL
);

CREATE TABLE prestamo (
    id_prestamo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_prestatario INTEGER NOT NULL REFERENCES prestatario(id_prestatario),
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion_prevista DATE NOT NULL,
    fecha_devolucion_real DATE,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chk_fechas CHECK (fecha_devolucion_prevista >= fecha_prestamo),
    CONSTRAINT chk_estado CHECK (estado IN ('ACTIVO', 'DEVUELTO', 'ATRASADO', 'CANCELADO')),
    CONSTRAINT chk_devolucion CHECK (
        (estado = 'DEVUELTO' AND fecha_devolucion_real IS NOT NULL)
        OR
        (estado IN ('ACTIVO', 'ATRASADO', 'CANCELADO') AND fecha_devolucion_real IS NULL)
    )
);

CREATE TABLE detalle_prestamo (
    id_detalle INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_prestamo INTEGER NOT NULL REFERENCES prestamo(id_prestamo) ON DELETE CASCADE,
    id_equipo INTEGER NOT NULL REFERENCES equipo(id_equipo),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    CONSTRAINT uq_prestamo_equipo UNIQUE (id_prestamo, id_equipo)
);
