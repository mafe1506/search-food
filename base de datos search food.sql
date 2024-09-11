DELIMITER $$

CREATE PROCEDURE search_food()
BEGIN
    SELECT * FROM usuarios;
END$$

DELIMITER ;

CALL search_foof();
DROP PROCEDURE Detalleusuario;
-- Lectura de datos


DELIMITER $$

CREATE PROCEDURE Insertarproducto(
    IN p_ID INT(10)
    IN p_nombre VARCHAR(50),
    IN p_descripción VARCHAR(50),
    IN p_fecha_de_produccion DATE,
    IN p_fecha_de_vencimiento DATE,
    IN p_lote VARCHAR(50)
)
BEGIN
    INSERT INTO insertarproductos (ID,nombre, descripcion, fecha_de_produccion,  lote)
    VALUES (p_nombre, p_descripcion, p_fecha_de_produccion, p_fecha_de_vencimiento, p_lote);
END$$

DELIMITER ;

-- Ingreso de datos
CALL InsertarDatos('1', 'leche de vaca', 'leche de vaca conservada en botella', '2024-08-02', '2024-09-05', '2024089');


DELIMITER $$
CREATE PROCEDURE ingresarlote(
    IN p_ID VARCHAR(50),
    IN p_fecha_de_produccion date,
    IN p_fecha_de_vencimiento date,search_food
    IN p_cantidad INT(10),
    IN p_estado VARCHAR(50),

)
BEGIN
    UPDATE ingresarlote
    SET 
        
        fecha_de_produccion = p_fecha_de_produccion,
        fecha_de_vencimiento = p_fecha_de_vencimiento,
        cantidad= p_cantidad,
        estado = p_estado-
    WHERE ID = p_ID;
END$$

DELIMITER ;
-- Actualizar datos
CALL Actualizarproveedor(1, 'Distribuciones Gourmet S.L', '+34 987 654 321', 'contacto@distribucionesgourmet.com', 'mayorista', );


DELIMITER $$

CREATE PROCEDURE Deleteproducto(
    IN p_ID INTEGER
)
BEGIN
    DELETE FROM producto
    WHERE ID = p_ID;
END$$

DELIMITER ;

-- Borrar datos
CALL producto(12);

SELECT * FROM producto



DELIMITER $$

CREATE PROCEDURE GetproductoID(
    IN p_productoID INTEGER
)
BEGIN
    SELECT 
        ID, 
        nombre, 
        descripcion, 
        fecha_de_produccion,
        fecha_de_vencimiento


    FROM producto
    WHERE ID = p_ID;
END$$

DELIMITER ;

-- Buscar producto por ID
CALL GetproductoByID(1);

