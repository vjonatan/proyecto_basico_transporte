CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTARDOCENTE`(IN DNI 		   VARCHAR(8), 
															  IN NOMBRE 	   VARCHAR(35),
                                                              IN APELLLPATERNO VARCHAR(35), 
                                                              IN APELLMATERNO  VARCHAR(35), 
                                                              IN CELULAR 	   VARCHAR(9), 
                                                              IN CORREO 	   VARCHAR(45), 
                                                              IN FOTO 		   VARBINARY(65535)
                                                              )
BEGIN
DECLARE RESPUESTA VARCHAR(100);
DECLARE IDCARGO INT;
    
    SET RESPUESTA = "";
    
    SELECT COUNT(*) 
	  INTO V_DNI 
	 FROM DOCENTE 
	WHERE DNI_DOC = DNI;


	IF(V_DNI > 0)THEN
		SET RESPUESTA= 'El Dni ya existe';
	END IF;

END;
