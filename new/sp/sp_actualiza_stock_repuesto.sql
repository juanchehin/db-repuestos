DROP procedure IF EXISTS `sp_actualiza_stock_repuesto`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualiza_stock_repuesto`(
	IN `pidrepuesto` VARCHAR(8),
	IN `pcantidadrepuesto` DECIMAL(10,1),
    IN `ptipope` CHAR(1),
	IN `ptagroll` INT,
	IN `pnomusu` VARCHAR(50)
)
SALIR:BEGIN
	/*
    Actualiza Stock del Repuesto.
    */
    DECLARE ftexsql INT;
    DECLARE fnewexi DECIMAL;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS;
		SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;
    
    
   /* OBTIENE STOCK ACTUAL DEL REPUESTO */   
   SET ftexsql= (SELECT Stock FROM repuestos WHERE idRepuesto=pidrepuesto);
   
	/* CALCULA NUEVA EXISTENCIA */
	SET fnewexi=0;
	CASE ptipope 
		WHEN '+' THEN
			SET fnewexi=pcantidadrepuesto;
		WHEN '-' THEN
			SET fnewexi=pcantidadrepuesto;
		WHEN 'R' THEN
			SET fnewexi=pcantidadrepuesto;
	END CASE;
	/* ACTUALIZA STOCK */
   UPDATE repuestos SET Stock=fnewexi WHERE idRepuesto=pidrepuesto;    

	SELECT 'cantidad exist del repuest',ftexsql AS Mensaje;
	SELECT 'se actualizó el stock' Mensaje1;
	SELECT 'cantidad actualizada del repuesto',@fnewexi,'' Mensaje2;
    
    COMMIT;
END$$
DELIMITER ;