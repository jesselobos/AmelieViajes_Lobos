# Amelie Viajes

En el mundo dinámico y competitivo de la industria de viajes, la gestión eficiente de la información es crucial para ofrecer un servicio de alta calidad y mejorar la experiencia del cliente. Este proyecto tiene como objetivo diseñar e implementar una base de datos integral para una agencia de viajes minorista, que permita la gestión efectiva de la información relacionada con clientes, reservas, destinos, proveedores y operaciones.

<img width="375" alt="Copia de Logotipo Amelie" src="https://github.com/user-attachments/assets/3c414992-cd93-4fa9-a4a6-f85b39d54fe6">

# Presentación 

Alumna: Jesica Mariana Lobos 

Comisión: 57190

Docente: Anderson Ocaña Torres

Tutor: Ariel Annone

# Objetivos del Proyecto

Centralización de Datos: Almacenar toda la información relevante en una base de datos centralizada para facilitar el acceso y la gestión de los datos. 

Personalización del Servicio al Cliente: Utilizar los datos para ofrecer un servicio más personalizado a los clientes, entendiendo mejor sus preferencias y necesidades. 

Análisis y Reportes: Facilitar la generación de informes y análisis de datos para apoyar la toma de decisiones estratégicas y operativas. 

# Desarrollo del Proyecto

Continúa en el archivo Amelie Viajes - Entrega Final.pdf 

# Reentrega Proyecto

Para trabajar en nuevas Views y en una función trabajé con Alters dentro de la Query base. Además en el final de esta se encuentra la sentencia para el backup. 

-- Modifico la tabla Operaciones. Le incorporo la columna ID_reserva

ALTER TABLE Operaciones
ADD ID_reserva INT NOT NULL,
ADD CONSTRAINT fk_ID_Reserva FOREIGN KEY (ID_Reserva) REFERENCES Reservas(ID_Reserva)

El ID_Reserva lo agregué como dato también en la Tabla Facturacion_Clientes y en Historico_Operaciones

-- Incorporo la columna Costo  

ALTER TABLE Historico_Operaciones
ADD Costo DECIMAL(18, 2);

;

-- Agrego los datos a la columna 

UPDATE ho
    SET ho.Costo = fc.Importe_Bruto
    FROM Historico_Operaciones ho
    JOIN Operaciones fc ON ho.ID_Reserva = fc.ID_Reserva;

;

CREATE VIEW Viajes_Pendientes AS
SELECT 
    r.ID_Reserva,
    c.Nombre_completo AS Nombre_Cliente,
    d.Destino AS Destino,
    r.Fecha_servicio,
    
FROM 
    Operaciones r
JOIN 
    Clientes c ON r.ID_Cliente = c.ID_Cliente
JOIN 
    Destinos d ON r.Destino = d.Destino
WHERE 
    r.Fecha_servicio > CURDATE()
    
;

CREATE VIEW Reservas_Cliente AS
SELECT 
    c.ID_Cliente,
    c.Nombre_completo,
    COUNT(r.ID_Reserva) AS NumeroDeReservas,
    SUM(r.Monto) AS MontoTotalGastado
FROM 
    Clientes c
JOIN 
    Reservas r ON c.ID_Cliente = r.ID_Cliente
GROUP BY 
    c.ID_Cliente, c.Nombre
    
;

CREATE FUNCTION dbo.Costo_Historico ()
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @Total DECIMAL(18, 2);

    SELECT @Total = SUM(Costo)
    FROM Historico_Operaciones;

    RETURN ISNULL(@Total, 0);
END
;
