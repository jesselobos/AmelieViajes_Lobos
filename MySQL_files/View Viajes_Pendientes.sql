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
    r.Fecha_servicio > CURDATE();