CREATE OR REPLACE PROCEDURE sp_insertAndListProducts(
    PI_IDPRODUCTO IN VARCHAR2,
    PI_NOMBRE IN VARCHAR2,
    PI_FECHA_REGISTRO IN DATE,
    CURSOR_OUT OUT SYS_REFCURSOR,
    PO_CODRPTA OUT NUMBER,
    PO_MSJRPTA OUT VARCHAR2
)
AS
BEGIN
    INSERT INTO productos(id_producto, nombre, fec_registro)
    VALUES (PI_IDPRODUCTO, PI_NOMBRE, PI_FECHA_REGISTRO);
    
    OPEN CURSOR_OUT FOR
        SELECT * FROM productos WHERE fec_registro = PI_FECHA_REGISTRO;
        
    codigoRespuesta := 0;
    mensajeRespuesta := 'Ejecución con éxito';
EXCEPTION
    WHEN OTHERS THEN
        codigoRespuesta := 1;
        mensajeRespuesta := SQLERRM;
END;