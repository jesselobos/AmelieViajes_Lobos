DELIMITER //

CREATE TRIGGER before_insert_vendedor
BEFORE INSERT ON Vendedores
FOR EACH ROW
BEGIN
    DECLARE total_vendedores INT;
    SELECT COUNT(*) INTO total_vendedores FROM Vendedores;
    IF total_vendedores >= 4 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden insertar más de 4 vendedores';
    END IF;
END;

//

DELIMITER ;