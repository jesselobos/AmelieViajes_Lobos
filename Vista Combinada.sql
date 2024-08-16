CREATE VIEW vista_operaciones_vendedores AS
SELECT 
    o.Fecha_operacion,
    o.ID_cliente,
    o.Codigo_operacion,
    o.Descripcion,
    o.Fecha_servicio,
    o.Canal_venta,
    v.nombre_completo AS nombre_vendedor
FROM 
    Operaciones o
JOIN 
    Vendedores v ON o.Codigo_vendedor = v.codigo_vendedor;