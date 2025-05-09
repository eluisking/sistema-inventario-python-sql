-- CREAMOS BASE DE DATOS
CREATE DATABASE inventario_db;
-- USAMOS LA BASE DE DATOS CREADA
USE inventario_db;

-- CREAMOS TABLAS DE LA BASE DE DATOS
-- TABLA CATEGORIAS
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- TABLA PRODUCTOS 
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_categoria INT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_id_categoria) REFERENCES categorias(id_categoria) ON DELETE SET NULL
);

-- TABLA MOVIMIENTOS 
CREATE TABLE movimientos (
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_producto INT NOT NULL,
    tipo ENUM('entrada','salida','ajuste') NOT NULL,
    cantidad INT NOT NULL,
    comentario TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_id_producto) REFERENCES productos(id_producto) ON DELETE NO ACTION
);

-- TABLA VENDEDOR
CREATE TABLE vendedores (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(12) NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- TABLA VENTAS
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_vendedor INT NOT NULL,
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    FOREIGN KEY (fk_id_vendedor) REFERENCES vendedores(id_vendedor) ON DELETE NO ACTION
);

-- TABLA DETALLE_VENTAS
CREATE TABLE detalle_ventas (
    id_detalle_venta INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_venta INT NOT NULL,
    fk_id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_total_detalle DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (fk_id_venta) REFERENCES ventas(id_venta) ON DELETE NO ACTION,
    FOREIGN KEY (fk_id_producto) REFERENCES productos(id_producto) ON DELETE NO ACTION
);

