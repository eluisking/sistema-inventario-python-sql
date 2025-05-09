-- Insertar categorías
INSERT INTO categorias (nombre, descripcion)
VALUES 
('Clásicas', 'Camisas de corte tradicional para uso diario.'),
('Oversize', 'Camisas anchas con estilo urbano y moderno.');

-- Insertar productos
INSERT INTO productos (fk_id_categoria, nombre, descripcion, precio, stock)
VALUES 
(1, 'Camisa Blanca Clásica', 'Camisa blanca 100% algodón, ideal para ocasiones formales.', 19.99, 50),
(1, 'Camisa Azul Clásica', 'Camisa azul con botones y cuello clásico.', 21.50, 40),
(1, 'Camisa Rayas Clásica', 'Diseño a rayas, estilo ejecutivo.', 23.00, 30),
(2, 'Camisa Negra Oversize', 'Estilo urbano, tela suave y holgada.', 25.99, 35),
(2, 'Camisa Estampada Oversize', 'Diseño artístico en tela oversize.', 27.50, 20);

-- Insertar vendedores
INSERT INTO vendedores (nombre, apellido, telefono)
VALUES 
('Ana', 'Lopez', '5551234567'),
('Carlos', 'Ramirez', '5559876543');

-- Insertar ventas
INSERT INTO ventas (fk_id_vendedor, total)
VALUES 
(1, 45.49),
(2, 53.49);

-- Insertar detalles de ventas
INSERT INTO detalle_ventas (fk_id_venta, fk_id_producto, cantidad, precio_total_detalle)
VALUES 
(1, 1, 1, 19.99),
(1, 2, 1, 21.50),
(2, 4, 1, 25.99),
(2, 5, 1, 27.50);

INSERT INTO movimientos (fk_id_producto, tipo, cantidad, comentario)
VALUES 
(1, 'entrada', 50, 'Carga inicial de producto'),
(2, 'entrada', 40, 'Carga inicial de producto'),
(3, 'entrada', 30, 'Carga inicial de producto'),
(4, 'entrada', 35, 'Carga inicial de producto'),
(5, 'entrada', 20, 'Carga inicial de producto'),
(1, 'salida', 1, 'Venta registrada en factura 1'),
(2, 'salida', 1, 'Venta registrada en factura 1'),
(4, 'salida', 1, 'Venta registrada en factura 2'),
(5, 'salida', 1, 'Venta registrada en factura 2');