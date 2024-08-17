CREATE VIEW vista_facturacion_clientes AS
SELECT 
    Nro_factura,
    Medio_pago,
    Codigo_operacion,
	Codigo_servicio,
	Importe_bruto,
	Importe_neto
FROM 
    facturacion_clientes;