USE TUTONETBEANS
GO
/****** Object:  StoredProcedure INSERTARDOCENTE   PROCEDIMIENTO PARA INSERTAR DOCENTES ******/
CREATE PROC INSERTARDOCENTE
@DNI_DOC VARCHAR(8),
@NOMBRE nvarchar(35),
@APELLLPATERNO nvarchar(35),
@APELLMATERNO nvarchar(35),
@CELULAR nvarchar(9),
@CORREO nvarchar(45),
@FOTO varbinary(max)
AS 
BEGIN
DECLARE @RESPUESTA NVARCHAR (50), @IDCARGO INT 
IF EXISTS (SELECT DNI_DOC FROM  DOCENTE where DNI_DOC=@DNI_DOC)
BEGIN 
SET @RESPUESTA= 'El Dni ya existe'
select @RESPUESTA as respuesta 
END
ELSE IF EXISTS (SELECT * FROM DOCENTE WHERE DOCENTE.NOMBRE=@NOMBRE AND DOCENTE.APELLLPATERNO=@APELLLPATERNO AND DOCENTE.APELLMATERNO=@APELLMATERNO)
BEGIN 
SET @RESPUESTA= 'El docente ya existe '
select @RESPUESTA as respuesta 
END 
ELSE IF EXISTS (SELECT * FROM DOCENTE WHERE DOCENTE.CORREO=@CORREO)
BEGIN 
SET @RESPUESTA= 'Ya existe el correo electronico'
select @RESPUESTA as respuesta 
END 
ELSE 
BEGIN 
BEGIN TRAN INSERTERDOCEN
INSERT INTO DOCENTE VALUES (@DNI_DOC,@NOMBRE ,@APELLLPATERNO ,@APELLMATERNO ,@CELULAR ,@CORREO,@FOTO)
SET @RESPUESTA= 'DOCENTE REGISTRADO EXITOSAMENTE'
select @RESPUESTA as respuesta 
COMMIT TRAN INSERTERDOCE
END
END


/****** Object:  StoredProcedure ACTUALIZARDOCENTE PROCEDIMIENTO PARA ACTUALIZAR EL DOCENTES ******/
CREATE PROC ACTUALIZARDOCENTE
@DNI_DOC  VARCHAR(8),
@NOMBRE nvarchar(50),
@APELLLPATERNO nvarchar(50),
@APELLMATERNO nvarchar(50),
@CELULAR nvarchar(9),
@CORREO nvarchar(45),
@CARGO NVARCHAR (35)
AS 
DECLARE @RESPUESTA NVARCHAR (80),@COR nvarchar(45)
SET @COR = (SELECT CORREO FROM DOCENTE WHERE CORREO=@CORREO)
BEGIN TRY
UPDATE DOCENTE
SET NOMBRE =@NOMBRE, APELLLPATERNO =@APELLLPATERNO, APELLMATERNO =@APELLMATERNO, CELULAR =@CELULAR, CORREO =@CORREO
FROM DOCENTE 
WHERE DNI_DOC =@DNI_DOC  
SET @RESPUESTA= 'DOCENTE ACTUALIZADO CON EXITO'	
select @RESPUESTA as respuesta
END TRY
BEGIN CATCH
SET @RESPUESTA= 'YA EXISTE UN DOCENTE O COORDINADOR CON EL MISMO CORREO'
select @RESPUESTA as respuesta
END CATCH



/****** Object:  StoredProcedure fotoexiste  PARA VERIFICAR SI LA FOTO EXISTE O NO EN LA BD ******/
CREATE proc fotoexiste 
@codigo nvarchar (10)
as
BEGIN
DECLARE @respuesta nvarchar (10)
if exists (SELECT DOCENTE.FOTO FROM 
DOCENTE   
where DOCENTE.DNI_DOC = @codigo)
begin 
set @respuesta ='1'
select @respuesta
end 
else begin 
set @respuesta ='0'
select @respuesta
end
END
/****** Object:  StoredProcedure [ELIMINARDOCENTE]  PROCEDIMIENTO PARA ELIMINAR DOCENTES ******/
CREATE PROC [dbo].[ELIMINARDOCENTE] 
@DNI_DOC  VARCHAR(8)
AS 
BEGIN
DECLARE @RESPUESTA NVARCHAR (40)
IF not EXISTS (SELECT DOCENTE.DNI_DOC  FROM DOCENTE WHERE DNI_DOC  =@DNI_DOC )
BEGIN 
  SET @RESPUESTA ='EL CODIGO DEL DOCENTE NO EXISTE,INGRESE UN CODIGO QUE EXISTA'	 
  Select @respuesta  as respuesta  
END 
BEGIN
	DELETE FROM DOCENTE 	
	WHERE DNI_DOC =@DNI_DOC 
	SET @RESPUESTA= 'DOCENTE ELIMINADO CON EXITO'
	select @RESPUESTA as respuesta  
END
END
/****** Object:  StoredProcedure [dbo].[ACTUALIZAFOTO]  ACTUALIZAR LA FOTO ******/
CREATE PROC ACTUALIZAFOTO
@DNI_DOC  VARCHAR(8),
@FOTO VARBINARY(MAX)
AS 
BEGIN
UPDATE DOCENTE SET FOTO=@FOTO
WHERE DOCENTE.DNI_DOC =@DNI_DOC 
END



/*PARA INSERTAR DATOS*/

INSERT INTO TABLA VALUES()

/*PARA ACTUALIZAR LOS DATOS*/

UPDATE TABLA 
SET CAMPO=@NUEVOCAMPO
WHERE CAMPO=@NUEVOCAMPO

/*PARA ELIMINAR*/

DELETE FROM TABLA
WHERE CAMPO=@NUEVOCAMPO

