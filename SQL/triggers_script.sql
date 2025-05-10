-- TRIGGER MOVIMIENTOS - PRODUCTOS
DELIMITER $$

CREATE TRIGGER actualizar_stock_productos
AFTER INSERT ON movimientos
FOR EACH ROW
BEGIN
    -- Si el tipo es 'entrada', sumamos la cantidad
    IF NEW.tipo = 'entrada' THEN
        UPDATE productos
        SET stock = stock + NEW.cantidad,
            updated_at = CURRENT_TIMESTAMP
        WHERE id_producto = NEW.fk_id_producto;

    -- Si el tipo es 'salida', restamos la cantidad
    ELSEIF NEW.tipo = 'salida' THEN
        UPDATE productos
        SET stock = stock - NEW.cantidad,
            updated_at = CURRENT_TIMESTAMP
        WHERE id_producto = NEW.fk_id_producto;

    -- Si el tipo es 'ajuste', el stock se iguala a la cantidad
    ELSEIF NEW.tipo = 'ajuste' THEN
        UPDATE productos
        SET stock = NEW.cantidad,
            updated_at = CURRENT_TIMESTAMP
        WHERE id_producto = NEW.fk_id_producto;
    END IF;
END$$

DELIMITER ;

-- UPDATE STOCK EN VENTAS AFTER DETALLE_VENTAS
-- *** ASEGURARNOS DE ANADIR 0 POR DEFAULT A LA TABLA DE VENTAS EN EL CAMPO TOTAL ***
ALTER TABLE ventas
MODIFY COLUMN total DECIMAL(10,2) DEFAULT 0.00

DELIMITER //

CREATE TRIGGER actualizar_stock_producto
AFTER INSERT ON detalle_ventas
FOR EACH ROW
BEGIN
  UPDATE productos
  SET stock = stock - NEW.cantidad
  WHERE id_producto = NEW.fk_id_producto;
END;
//

DELIMITER ;

-- UPDATE TOTAL EN VENTAS AFTER DETALLE VENTAS.
DELIMITER //

CREATE TRIGGER actualizar_total_venta
AFTER INSERT ON detalle_ventas
FOR EACH ROW
BEGIN
  UPDATE ventas
  SET total = total + NEW.precio_total_detalle
  WHERE id_venta = NEW.fk_id_venta;
END;
//

DELIMITER ;
