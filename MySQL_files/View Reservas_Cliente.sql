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
    c.ID_Cliente, c.Nombre;