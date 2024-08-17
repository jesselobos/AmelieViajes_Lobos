DELIMITER $$

CREATE PROCEDURE insertar_en_operaciones_historico (
    IN p_codigo_operacion INT
)
BEGIN
    DECLARE v_codigo_servicio INT;
    DECLARE v_fecha_servicio DATE;
    DECLARE v_id_cliente INT;
    DECLARE v_codigo_vendedor INT;
    DECLARE v_tipo VARCHAR(50);
    DECLARE v_subtipo VARCHAR(50);
    DECLARE v_destino VARCHAR(100);
    DECLARE v_descripcion VARCHAR(255);

-- Traer los detalles de la operación
   
    SELECT 
        codigo_servicio, 
        fecha_servicio,
        id_cliente,
        codigo_vendedor
    INTO 
        v_codigo_servicio, 
        v_fecha_servicio,
        v_id_cliente,
        v_codigo_vendedor
    FROM 
        operaciones
    WHERE 
        codigo_operacion = p_codigo_operacion;

-- Traer los detalles del servicio
    
	SELECT 
        tipo, 
        subtipo, 
        destino, 
        descripcion
    INTO 
        v_tipo, 
        v_subtipo, 
        v_destino, 
        v_descripcion
    FROM 
        servicios
    WHERE 
        codigo_servicio = v_codigo_servicio;

-- Insertar en la tabla operaciones_historico
   
    INSERT INTO operaciones_historico (
        fecha_servicio,
        id_cliente,
        codigo_vendedor,
        codigo_operacion, 
        codigo_servicio, 
        tipo, 
        subtipo, 
        destino, 
        descripcion
    ) VALUES (
        v_fecha_servicio,
        v_id_cliente,
        v_codigo_vendedor,
        p_codigo_operacion, 
        v_codigo_servicio, 
        v_tipo, 
        v_subtipo, 
        v_destino, 
        v_descripcion
    );

END $$

DELIMITER ;