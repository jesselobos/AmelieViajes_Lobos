CREATE DATABASE Amelie_Viajes

USE Amelie_Viajes

CREATE TABLE Vendedores (
    codigo_vendedor INT AUTO_INCREMENT -- PRIMARY KEY,
    nombre_completo VARCHAR(255) NOT NULL
);

-- Subo datos de los vendedores

INSERT INTO Vendedores (nombre_completo) VALUES ('Jesica Lobos'), ('Veronica Pereyra'), ('Giselle Machain') , ('Victoria Linares') ;

CREATE TABLE Clientes (
    ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_completo VARCHAR(255),
    Fecha_nacimiento DATE,
    Genero VARCHAR(20),
    DNI VARCHAR(20),
    Pasaporte VARCHAR(30),
    Ciudad VARCHAR(100),
    Provincia VARCHAR(100),
    Email VARCHAR(100),
    Telefono VARCHAR(30)
);

CREATE TABLE Operaciones (
    Fecha_operacion DATE,
    ID_cliente INT PRIMARY KEY,
    Codigo_vendedor INT,
    Codigo_operacion INT,
    Descripcion VARCHAR(255),
    Fecha_servicio DATE,
    Canal_venta VARCHAR(100)
    
    -- FOREIGN KEY (Codigo_vendedor) REFERENCES Vendedores(Codigo_vendedor)
);

CREATE TABLE Servicios (
    Destino VARCHAR(100),
    Codigo_operación INT,
    Codigo_servicio INT,
    Tipo VARCHAR(50),
    Subtipo VARCHAR(50),
    Descripcion VARCHAR(255)
    
    -- PRIMARY KEY (Codigo_operación, Codigo_servicio),
    
);

-- Actualizo el precio de dos servicios

 ALTER TABLE Servicios
    ADD COLUMN Precio DECIMAL(10, 2)	;

UPDATE Servicios
    SET Precio = 899.99
    WHERE Codigo_servicio = 92-1909339;

    UPDATE Servicios
    SET Precio = 550.75
    WHERE Codigo_servicio = 18-6145572;

CREATE TABLE Proveedores (
    ID_proveedor INT PRIMARY KEY,
    Nombre VARCHAR(255),
    CUIT VARCHAR(20),
    Razon_social VARCHAR(255),
    Tipo_proveedor VARCHAR(50),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Banco VARCHAR(100),
    Cuenta_corriente VARCHAR(40)
);

CREATE TABLE Destinos (
    Codigo_destino INT PRIMARY KEY,
    Destino VARCHAR(100),
    Operador VARCHAR(100),
    ID_proveedor INT,
    Descripcion VARCHAR(255)
    
    -- FOREIGN KEY (ID_proveedor) REFERENCES Proveedores(ID_proveedor)
);

CREATE TABLE Facturacion_Clientes (
    ID_cliente INT,
    Nro_factura INT,
    Medio_pago VARCHAR(50),
    Nro_tarjeta VARCHAR(20),
    Nombre_tarjeta VARCHAR(50),
    Codigo_operación INT,
    Codigo_servicio INT,
    Importe_Bruto DECIMAL(20, 2),
    Importe_Neto DECIMAL(20, 2)
    
   -- PRIMARY KEY (ID_cliente, Nro_factura),
   -- FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),

);

CREATE TABLE Facturacion_Proveedores (
    ID_proveedor INT,
    Nro_factura INT,
    Fecha_factura DATE,
    Medio_pago VARCHAR(50),
    Cuenta_bancaria VARCHAR(30),
    Codigo_operación INT,
    Codigo_servicio INT,
    Importe_Bruto DECIMAL(20, 2),
    Importe_Neto DECIMAL(20, 2)
    
    -- PRIMARY KEY (ID_proveedor, Nro_factura),
    -- FOREIGN KEY (ID_proveedor) REFERENCES Proveedores(ID_proveedor),

);

CREATE TABLE Historico_Operaciones (
    Fecha_servicio DATE,
    ID_cliente INT,
    Codigo_vendedor INT,
    Codigo_operación INT,
    Codigo_servicio INT,
    ID_proveedor INT,
    Tipo VARCHAR(50),
    Subtipo VARCHAR(50),
    Destino VARCHAR(100),
    Descripcion VARCHAR(255)

);

-- No genera valor el dato ID_proveedor, elimino la columna 

ALTER TABLE Historico_Operaciones
DROP COLUMN ID_proveedor;

