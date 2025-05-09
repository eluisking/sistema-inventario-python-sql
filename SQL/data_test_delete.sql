-- Desactivar restricciones temporales para poder borrar sin errores por relaciones
SET FOREIGN_KEY_CHECKS = 0;

-- Borrar datos de las tablas en orden que respete las dependencias
DELETE FROM detalle_ventas;
DELETE FROM ventas;
DELETE FROM movimientos;
DELETE FROM productos;
DELETE FROM categorias;
DELETE FROM vendedores;

-- Reactivar restricciones
SET FOREIGN_KEY_CHECKS = 1;

-- Setea el AUTO_INCREMENT
ALTER TABLE productos AUTO_INCREMENT = 1;
ALTER TABLE categorias AUTO_INCREMENT = 1;
ALTER TABLE movimientos AUTO_INCREMENT = 1;
ALTER TABLE vendedores AUTO_INCREMENT = 1;
ALTER TABLE ventas AUTO_INCREMENT = 1;
ALTER TABLE detalle_ventas AUTO_INCREMENT = 1;