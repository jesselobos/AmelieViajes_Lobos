CREATE VIEW vista_facturacion_proveedores AS
SELECT 
    Nro_factura,
    Codigo_operacion,
	Codigo_servicio,
	Codigo_destino,
	Importe_bruto,
	Importe_neto
FROM 
    facturacion_proveedores;