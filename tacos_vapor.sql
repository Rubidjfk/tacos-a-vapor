-- 1️⃣ Limpiar todas las tablas si existen
DROP TABLE IF EXISTS detalle_venta;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS opciones_producto;
DROP TABLE IF EXISTS productos;

-- 2️⃣ Crear tablas

CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    tipo TEXT,        -- taco, agua
    categoria TEXT,   -- maiz, harina, vaso, litro
    precio REAL,
    descripcion TEXT
);

CREATE TABLE opciones_producto (
    id_opcion INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT       -- con salsa / sin salsa
);

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    telefono TEXT
);

CREATE TABLE ventas (
    id_venta INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha TEXT,
    id_cliente INTEGER,
    total REAL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detalle_venta (
    id_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venta INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    id_opcion INTEGER,
    subtotal REAL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_opcion) REFERENCES opciones_producto(id_opcion)
);

-- 3️⃣ Insertar productos iniciales (tacos y aguas)
INSERT INTO productos (nombre, tipo, categoria, precio, descripcion) VALUES
('Taco de vapor', 'taco', 'maiz', 7, 'Taco de maíz tradicional'),
('Taco de vapor', 'taco', 'harina', 13, 'Taco de harina tradicional'),
('Agua de Horchata', 'agua', 'vaso', 10, 'Vaso de agua de horchata'),
('Agua de Horchata', 'agua', 'litro', 20, 'Litro de agua de horchata');

-- 4️⃣ Insertar opciones de salsa
INSERT INTO opciones_producto (nombre) VALUES
('Con salsa'),
('Sin salsa');

-- 5️⃣ Insertar ejemplo de cliente y venta
INSERT INTO clientes (nombre, telefono) VALUES ('Juan Pérez', '6641234567');

-- Ejemplo de venta
INSERT INTO ventas (fecha, id_cliente, total) VALUES ('2025-11-27', 1, 54);

-- Detalle de venta ejemplo
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, id_opcion, subtotal) VALUES
(1, 1, 3, 1, 21),   -- 3 tacos maíz con salsa
(1, 2, 1, 2, 13),   -- 1 taco harina sin salsa
(1, 3, 1, NULL, 10); -- 1 vaso horchata
