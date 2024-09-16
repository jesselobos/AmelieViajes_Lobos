CREATE FUNCTION dbo.Costo_Historico ()
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @Total DECIMAL(18, 2);

    SELECT @Total = SUM(Costo)
    FROM Historico_Operaciones;

    RETURN ISNULL(@Total, 0);
END;