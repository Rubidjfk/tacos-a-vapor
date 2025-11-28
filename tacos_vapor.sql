



CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    tipo TEXT,        
    categoria TEXT,   
    precio REAL,
    descripcion TEXT
);

CREATE TABLE opciones_producto (
    id_opcion INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT       
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


INSERT INTO productos (nombre, tipo, categoria, precio, descripcion) VALUES
('Taco de vapor', 'taco', 'maiz', 7, 'Taco de maíz tradicional'),
('Taco de vapor', 'taco', 'harina', 13, 'Taco de harina tradicional'),
('Agua de Horchata', 'agua', 'vaso', 10, 'Vaso de agua de horchata'),
('Agua de Horchata', 'agua', 'litro', 20, 'Litro de agua de horchata');


INSERT INTO opciones_producto (nombre) VALUES
('Con salsa'),
('Sin salsa');


INSERT INTO clientes (nombre, telefono) VALUES ('Juan Pérez', '6641234567');


INSERT INTO ventas (fecha, id_cliente, total) VALUES ('2025-11-27', 1, 54);


INSERT INTO detalle_venta (id_venta, id_producto, cantidad, id_opcion, subtotal) VALUES
(1, 1, 3, 1, 21),   
(1, 2, 1, 2, 13),   
(1, 3, 1, NULL, 10); 

