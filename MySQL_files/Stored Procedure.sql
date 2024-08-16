DELIMITER //

CREATE PROCEDURE actualizar_precio_servicio (
    IN p_Codigo_servicio INT,
    IN p_precio DECIMAL(10, 2)
)
BEGIN
    UPDATE Servicios
    SET precio = p_precio
    WHERE Codigo_servicio = p_Codigo_servicio;
END;

//

DELIMITER ;

CALL actualizar_precio_servicio(99-7078223, 1420.99);

