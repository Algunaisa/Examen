
CREATE TABLE [tblExamen] (
    --idExamen int IDENTITY(1,1) PRIMARY KEY,
	idExamen int NOT NULL PRIMARY KEY,
    Nombre varchar(255) NULL,
    Descripcion varchar(255) NULL
);

/*
insert into [tblExamen] values(1,'Español','Primer dato ingresado')
insert into [tblExamen] values(5,'Matematicas','Segundo dato ingresado')
insert into [tblExamen] values(6,'Ciencias Naturales', NULL)
insert into [tblExamen] values(0,NULL, 'Cuarto dato Ingresado')
Insert into [tblExamen] values(0,'Examen Repetido', 'Quinto dato Ingresado')

Select * from [tblExamen]
--truncate table [tblExamen]
--drop table [tblExamen]
--*/

CREATE PROCEDURE [dbo].[spAgregar]
@_id	 int
,@_nombre	 VARCHAR(255) = NULL
,@_descripcion	 VARCHAR(255) = NULL
AS
BEGIN TRY
	INSERT INTO [tblExamen] VALUES(@_id, @_nombre, @_descripcion)
	SELECT	0 AS Code
			,'Registro insertado satisfactoriamente' AS [Message];
END TRY
BEGIN CATCH  
     SELECT ERROR_NUMBER() AS Code
			,ERROR_MESSAGE() AS [Message];
END CATCH
/*
--SP AGREGAR:
	EXEC [spAgregar] 4, 'Examen A', NULL
--*/


CREATE PROCEDURE [dbo].[spActualizar]
@_id	 INT
,@_nombre	 VARCHAR(255) = NULL
,@_descripcion	 VARCHAR(255) = NULL
as
BEGIN TRY

	UPDATE	[tblExamen] 
	SET		Nombre=@_nombre
			,Descripcion=@_descripcion
	WHERE	idExamen=@_id
	
	SELECT	0 AS Code
			,'Registro insertado satisfactoriamente' AS [Message];
END TRY
BEGIN CATCH  
     SELECT ERROR_NUMBER() AS Code
			,ERROR_MESSAGE() AS [Message];
END CATCH

/*
--SP Actualizar
	EXEC [spActualizar] 4, 'eXAMEN A.2', 'tEST'
--*/

CREATE PROCEDURE [dbo].[spEliminar]
@_id	 INT
AS
BEGIN TRY

	DELETE	[tblExamen] 
	WHERE	idExamen=@_id
	
	SELECT	0 AS Code
			,'Registro insertado satisfactoriamente' AS [Message];
END TRY
BEGIN CATCH  
     SELECT ERROR_NUMBER() AS Code
			,ERROR_MESSAGE() AS [Message];
END CATCH


/*
--SP Eliminar
	EXEC [spEliminar] 4
--*/

CREATE PROCEDURE [dbo].[spConsultar]
@_nombre	 VARCHAR(255) = NULL
,@_descripcion	 VARCHAR(255) = NULL
AS
BEGIN TRY

	SELECT * FROM	[tblExamen] 
	WHERE	
			([Nombre]=@_nombre OR '' = @_nombre)
			AND
			([Descripcion]=@_descripcion OR '' = @_descripcion)
END TRY
BEGIN CATCH  
     SELECT ERROR_NUMBER() AS Code
			,ERROR_MESSAGE() AS [Message];
END CATCH

/*
--SP Consultar
	EXEC [spConsultar] '','Segundo dato ingresado'
--*/


