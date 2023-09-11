-- Crear la base de datos dbGamarraMarket si no existe
CREATE DATABASE IF NOT EXISTS dbGamarraMarket DEFAULT CHARACTER SET utf8;

-- Poner en uso la base de datos dbGamarraMarket
USE dbGamarraMarket;

-- Crear la tabla Cliente
CREATE TABLE IF NOT EXISTS Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
    FechaRegistro DATE,
    OtrosCampos VARCHAR(255)
);

-- Crear la tabla Vendedor
CREATE TABLE IF NOT EXISTS Vendedor (
    ID_Vendedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
    FechaContratacion DATE,
    Comisiones DECIMAL(5, 2),
    OtrosDetalles VARCHAR(255)
);

-- Crear la tabla Prenda
CREATE TABLE IF NOT EXISTS Prenda (
    ID_Prenda INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(255),
    Precio DECIMAL(10, 2),
    Stock INT,
    OtrosCampos VARCHAR(255)
);

-- Crear la tabla Venta
CREATE TABLE IF NOT EXISTS Venta (
    ID_Venta INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    ID_Vendedor INT,
    FechaVenta DATE,
    MontoTotal DECIMAL(10, 2),
    FormaPago VARCHAR(50),
    EstadoVenta VARCHAR(20),
    OtrosDetalles VARCHAR(255),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Vendedor) REFERENCES Vendedor(ID_Vendedor)
);

-- Crear la tabla VentaDetallada
CREATE TABLE IF NOT EXISTS VentaDetallada (
    ID_VentaDetallada INT AUTO_INCREMENT PRIMARY KEY,
    ID_Venta INT,
    Cantidad INT,
    ID_Prenda INT,
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta),
    FOREIGN KEY (ID_Prenda) REFERENCES Prenda(ID_Prenda)
);
