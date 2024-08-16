-- Cambiar el delimitador
DELIMITER //

-- Crear el TRIGGER
CREATE TRIGGER validar_fechas
BEFORE INSERT ON Operaciones
FOR EACH ROW
BEGIN
    -- Validar que la fecha de operación no sea posterior a la fecha de servicio
    IF NEW.Fecha_operacion > NEW.Fecha_servicio THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de operación no puede ser posterior a la fecha de servicio';
    END IF;
END;

// Restaurar el delimitador
DELIMITER ;