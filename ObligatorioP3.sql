create database ObligatorioP3;

use ObligatorioP3;

---------------CREACION DE TABLAS----------------------
BEGIN

create table Usuario(
IdUsuario int identity(1,1) primary key,
Nombre varchar(25) not null,
Ci int unique not null,
Mail varchar(30) unique not null,
Password varchar(30) unique not null,
Telefono varchar(12)
);  

create table Admin(
IdAdmin int identity(1,1) primary key,
Nombre varchar(25) not null,
Ci int unique not null,
Mail varchar(30) unique not null,
Password varchar(30) unique not null,
ClaveAdmin int unique not null
);

create table Proveedor(
IdProveedor int primary key,
Nombre varchar(25),
Telefono varchar(12)
);

create table Repuesto(
IdRepuesto int primary key, 
Descripcion	varchar(50) not null, 
Costo int not null, 
Tipo char not null check(Tipo in ('M','C','L','V')),
-- M = Motor, C = Carrocería, L = Lubricación y V= Varios.
Proveedor int references Proveedor(IdProveedor),
);

create table Vehiculo(
IdVehiculo int identity(1,1) primary key, 
Matricula varchar(7) unique not null check(Matricula like '[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]') , 
Marca varchar(20) not null , 
Modelo varchar(20) not null	, 
Anio numeric(4) not null check( Anio <= YEAR(getDate())), 
Color varchar(12) not null,
DuenoVehiculo int references Usuario(idUsuario)
);

create table Mecanico(
IdMecanico int identity(1,1) primary key, 
Nombre varchar(25) not null, 
Ci int unique not null, 
Telefono varchar(12) not null, 
ValorHora int not null, 
);

create table Agenda(
Id int identity(1,1) primary key,
IdVehiculo int references Vehiculo(IdVehiculo),
DscEntrada varchar(50) not null,
Usuario int references Usuario(IdUsuario)
);

create table Reparacion(
IdReparacion int identity(1,1) primary key, 
IdVehiculo int references Vehiculo(IdVehiculo) , 
FchEntrada date not null check(FchEntrada <= getdate()) default(getdate()), 
FchSalida date , 
IdMecanico int references Mecanico(IdMecanico) , 
DscEntrada varchar(50) not null, 
DscSalida varchar(50), 
KmsEntrada int not null,
check(FchSalida >= FchEntrada)
);

create table Reparacion_Repuesto(
IdReparacion int references Reparacion(IdReparacion),
IdRepuesto int references Repuesto(IdRepuesto),
cantidad int,
primary key(IdReparacion,IdRepuesto)
);

END

-------------------PROCEDIMIENTOS USUARIOS----------------
BEGIN
--LISTAR
CREATE Or alter PROCEDURE ListarUsuario
AS
BEGIN
	SELECT IdUsuario,Nombre,Ci,Mail,Password,Telefono FROM Usuario
END

--ALTA
CREATE or alter PROCEDURE AltaUsuario
	@Nombre varchar(25),
	@Ci int,
	@Mail varchar(30),
	@Password varchar(30),
	@Telefono varchar(12)
AS
BEGIN
    INSERT INTO Usuario(Nombre,Ci,Mail,Password,Telefono) VALUES (@Nombre,@Ci,@Mail,@Password,@Telefono)
END

--BAJA
CREATE or ALTER PROCEDURE BajaUsuario
	@Ci int
AS
BEGIN
		DELETE FROM Usuario WHERE Ci = @Ci;
END
--TRIGGER QUE ELIMINA LAS RELACIONES DEL USUARIO ELIMINADO
CREATE or alter TRIGGER TREliminarUsuario
on Usuario
instead of delete
AS
	DECLARE @IdUsuario int, @idVehiculo int, @idReparacion int, @idAgenda int
BEGIN	

		SELECT  @IdUsuario = IdUsuario from deleted;
		SELECT  @idVehiculo = IdVehiculo from Vehiculo where DuenoVehiculo = @IdUsuario;
		SELECT  @idReparacion = IdReparacion from Reparacion where IdVehiculo = @idVehiculo;
		SELECT  @idAgenda = Id from Agenda where IdVehiculo = @idVehiculo;

		DELETE FROM Reparacion_Repuesto where IdReparacion = @idReparacion;
		DELETE FROM Agenda where Id =@idAgenda;
		DELETE FROM Reparacion where IdReparacion =@idReparacion;
		DELETE FROM Vehiculo where IdVehiculo =@idVehiculo;
		DELETE FROM Usuario WHERE IdUsuario = @IdUsuario;
END

--MODIFICAR
CREATE or alter PROCEDURE ModificarUsuario
	@Nombre varchar(25),
	@Ci int,
	@Mail varchar(30),
	@Password varchar(30),
	@Telefono varchar(12)
AS
BEGIN
    UPDATE Usuario SET Nombre = @Nombre , Mail = @Mail, Password = @Password, Telefono = @Telefono where Ci = @Ci;
END



END
-------------------PROCEDIMIENTOS ADMINS-------------------
BEGIN
CREATE Or alter PROCEDURE ListarAdmin
AS
BEGIN
	SELECT IdAdmin,Nombre,Ci,Mail,Password,ClaveAdmin FROM Admin
END

CREATE or alter PROCEDURE AltaAdmin
	@Nombre varchar(25),
	@Ci int,
	@Mail varchar(30),
	@Password varchar(30),
	@ClaveAdmin int
AS
BEGIN
    INSERT INTO Admin(Nombre,Ci,Mail,Password,ClaveAdmin) VALUES (@Nombre,@Ci,@Mail,@Password,@ClaveAdmin)
END

--BAJA
CREATE or ALTER PROCEDURE BajaAdmin
	@Ci int,
	@CodAdmin int
AS
BEGIN
		IF(@codAdmin = 113)
			IF(@Ci != 52397633)
				DELETE FROM Admin WHERE Ci = @Ci
			ELSE 
				PRINT 'Este administrador no puede ser eliminado'	
		ELSE 
		 PRINT 'Este administrador no tiene ese permiso'
END

--MODIFICAR
CREATE or alter PROCEDURE ModificarAdmin
	@Nombre varchar(25),
	@Ci int,
	@Mail varchar(30),
	@Password varchar(30),
	@ClaveAdmin int
AS
BEGIN
		UPDATE Admin SET Nombre = @Nombre , Mail = @Mail, Password = @Password, ClaveAdmin = @ClaveAdmin where Ci = @Ci;

END


END
-------------------PROCEDIMIENTOS PROVEEDORES-------------------
BEGIN
--LISTAR
CREATE Or alter PROCEDURE ListarProveedor
AS
BEGIN
	SELECT IdProveedor,Nombre,Telefono FROM Proveedor
END
--ALTA
CREATE or alter PROCEDURE AltaProveedor
	@IdProveedor int,
	@Nombre varchar(25),
	@Telefono varchar(12)
AS
BEGIN
    INSERT INTO Proveedor(IdProveedor,Nombre,Telefono) VALUES (@IdProveedor,@Nombre,@Telefono)
END
--BAJA
CREATE or ALTER PROCEDURE BajaProveedor
	@IdProveedor int
AS
BEGIN
		DELETE FROM Proveedor WHERE IdProveedor = @IdProveedor
END
--TRIGGER QUE ELIMINA LAS RELACIONES DEL PROVEEDOR ELIMINADO
CREATE or alter TRIGGER TREliminarProveedor
on Proveedor
instead of delete
AS
	DECLARE @IdProveedor int, @IdRepuesto int, @IdReparacion int
BEGIN	

		SELECT  @IdProveedor = IdProveedor from deleted;
		SELECT  @IdRepuesto = IdRepuesto from Repuesto where Proveedor = @IdProveedor;
		SELECT  @idReparacion = IdReparacion from Reparacion_Repuesto where IdRepuesto = @IdRepuesto;

		DELETE FROM Reparacion_Repuesto where IdReparacion = @idReparacion;
		DELETE FROM Reparacion where IdReparacion =@idReparacion;
		DELETE FROM Repuesto where IdRepuesto =@IdRepuesto;
		DELETE FROM Proveedor WHERE IdProveedor = @IdProveedor;
END
--MODIFICAR
CREATE or alter PROCEDURE ModificarProveedor
	@IdProveedor int,
	@Nombre varchar(25),
	@Telefono varchar(12)
AS
BEGIN
    UPDATE Proveedor SET Nombre = @Nombre , Telefono = @Telefono where IdProveedor = @IdProveedor;
END

END
-------------------PROCEDIMIENTOS REPUESTOS-------------------
BEGIN 
--LISTAR
CREATE Or alter PROCEDURE ListarRepuesto
AS
BEGIN
	SELECT IdRepuesto, Descripcion, Costo, Tipo, Proveedor FROM Repuesto
END
--ALTA
CREATE or alter PROCEDURE AltaRepuesto
	@IdRepuesto int,
	@Descripcion varchar(50),
	@Costo int,
	@Tipo char(1),
	@Proveedor int
AS
BEGIN
    INSERT INTO Repuesto(IdRepuesto,Descripcion,Costo,Tipo,Proveedor) VALUES (@IdRepuesto,@Descripcion,@Costo,@Tipo,@Proveedor)
END
--BAJA
CREATE or ALTER PROCEDURE BajaRespuesto
	@Id int
AS
BEGIN
		DELETE FROM Repuesto WHERE IdRepuesto = @Id
END
--TRIGGER QUE ELIMINA LAS RELACIONES DEL REPUESTO ELIMINADO
CREATE or alter TRIGGER TREliminarRepuesto
on Repuesto
instead of delete
AS
	DECLARE @IdRepuesto int
BEGIN	

		SELECT  @IdRepuesto = IdRepuesto from deleted;

		DELETE FROM Reparacion_Repuesto where IdRepuesto = @IdRepuesto;
		DELETE FROM Repuesto where IdRepuesto =@IdRepuesto;
END
--MODIFICAR
CREATE or alter PROCEDURE ModificarRepuesto
	@Id int,
	@Descripcion varchar(50),
	@Costo money,
	@Tipo char(1),
	@Proveedor int
AS
BEGIN
    UPDATE Repuesto SET  Descripcion = @Descripcion, Costo = @Costo,
	Tipo = @Tipo, Proveedor = @Proveedor where IdRepuesto = @Id;
END
--LISTAR REPUESTO MAS USADO
CREATE or ALTER PROCEDURE RepuestoMasUsado
AS
BEGIN
	Select * FROM Repuesto
	Where IdRepuesto in (Select rr.IdRepuesto 
						From Reparacion_Repuesto rr 
						Group by rr.IdRepuesto
						Having SUM(rr.cantidad) >= all ( Select SUM(rr.cantidad)
													From Reparacion_Repuesto rr
													Group by rr.IdRepuesto))
END

END
-------------------PROCEDIMIENTOS VEHICULOS-------------------
BEGIN
--LISTAR
CREATE Or alter PROCEDURE ListarVehiculo
AS
BEGIN
	SELECT * FROM Vehiculo
END
--ALTA
BEGIN
CREATE or alter PROCEDURE AltaVehiculo
	@Matricula varchar(7),
	@Marca varchar(20),
	@Modelo varchar(20),
	@Anio numeric(4),
	@Color varchar(12),
	@DuenoVehiculo int
AS
BEGIN
    INSERT INTO Vehiculo(Matricula,Marca,Modelo,Anio,Color,DuenoVehiculo) VALUES (@Matricula,@Marca,@Modelo,@Anio,@Color,@DuenoVehiculo)
END
--BAJA
CREATE or ALTER PROCEDURE BajaVehiculo
	@Matricula varchar(7)
AS
BEGIN
		DELETE FROM Vehiculo WHERE Matricula = @Matricula
END
--TRIGGER QUE ELIMINA LAS RELACIONES DEL VEHICULO ELIMINADO
CREATE or alter TRIGGER TREliminarVehiculo
on Vehiculo
instead of delete
AS
	DECLARE @IdVehiculo int, @IdReparacion int
BEGIN	

		SELECT  @IdVehiculo = IdVehiculo from deleted;
		SELECT @IdReparacion = IdReparacion from Reparacion where IdVehiculo = @IdVehiculo;

		DELETE FROM Agenda where IdVehiculo = @IdVehiculo;
		DELETE FROM Reparacion where IdReparacion = @IdReparacion
		DELETE FROM Reparacion_Repuesto where IdReparacion = @IdReparacion
		DELETE FROM Vehiculo where IdVehiculo =@IdVehiculo;
END
--MODIFICAR
CREATE or alter PROCEDURE ModificarVehiculo
	@Matricula varchar(7),
	@Marca varchar(20),
	@Modelo varchar(20),
	@Anio numeric(4),
	@Color varchar(12),
	@DuenoVehiculo int
AS
BEGIN
    UPDATE Vehiculo SET Marca = @Marca, Modelo = @Modelo, Anio = @Anio, Color = @Color, DuenoVehiculo = @DuenoVehiculo where Matricula = @Matricula;
END

----LISTAR POR DUEÑO
CREATE Or alter PROCEDURE ListarVehiculoxDueno
	@DuenoVehiculo int
AS
BEGIN
	SELECT * FROM Vehiculo where DuenoVehiculo = @DuenoVehiculo
END
END

END
-------------------PROCEDIMIENTOS MECANICOS-------------------
BEGIN
--LISTAR
CREATE Or alter PROCEDURE ListarMecanico
AS
BEGIN
	SELECT IdMecanico, Nombre, Ci, Telefono, ValorHora FROM Mecanico
END

--ALTA
CREATE or alter PROCEDURE AltaMecanico
	@Nombre varchar(20),
	@Ci int,
	@Telefono varchar(12),
	@ValorHora int
AS
BEGIN
    INSERT INTO Mecanico(Nombre,Ci,Telefono,ValorHora) VALUES (@Nombre,@Ci,@Telefono,@ValorHora)
END
--BAJA
CREATE or ALTER PROCEDURE BajaMecanico
	@ci int
AS
BEGIN
		DELETE FROM Mecanico WHERE Ci = @ci
END

--TRIGGER QUE ELIMINA LAS RELACIONES DEL MECANICO ELIMINADO
CREATE or alter TRIGGER TREliminarMecanico
on Mecanico
instead of delete
AS
	DECLARE @IdMecanico int, @IdReparacion int
BEGIN	

		SELECT  @IdMecanico = IdMecanico from deleted;
		SELECT @IdReparacion = IdReparacion from Reparacion where IdMecanico = @IdMecanico;

		DELETE FROM Reparacion where IdReparacion = @IdReparacion
		DELETE FROM Reparacion_Repuesto where IdReparacion = @IdReparacion
		DELETE FROM Mecanico where IdMecanico =@IdMecanico;
END
--MODIFICAR
CREATE or alter PROCEDURE ModificarMecanico
	@Nombre varchar(20),
	@Ci int,
	@Telefono varchar(12),
	@ValorHora int
AS
BEGIN
    UPDATE Mecanico SET Nombre = @Nombre,Telefono = @Telefono, ValorHora = @ValorHora where Ci = @Ci;
END

END
-------------------PROCEDIMIENTOS REPARACION-------------------
BEGIN
--LISTAR
CREATE Or alter PROCEDURE ListarReparacion
AS
BEGIN
	SELECT IdReparacion, IdVehiculo, FchEntrada,FchSalida,IdMecanico, DscEntrada, DscSalida,kmsEntrada FROM Reparacion
END

--ALTA
CREATE or alter PROCEDURE AltaReparacion
	@IdVehiculo int,
	@FechaEntrada date,
	@FechaSalida date,
	@IdMecanico int,
	@DesEntrada varchar(50),
	@DesSalida varchar(50),
	@KmsEntrada int
AS
BEGIN
    INSERT INTO Reparacion(IdVehiculo,FchEntrada,FchSalida,IdMecanico,DscEntrada,DscSalida,kmsEntrada) VALUES (@IdVehiculo,@FechaEntrada,@FechaSalida,@IdMecanico,@DesEntrada,@DesSalida,@KmsEntrada)
END
--BAJA
CREATE or ALTER PROCEDURE BajaReparacion
	@Id int
AS
BEGIN
		DELETE FROM Reparacion WHERE IdReparacion = @Id
END

--TRIGGER QUE ELIMINA LAS RELACIONES DEL REPARACION ELIMINADA
CREATE or alter TRIGGER TREliminarReparacion
on Reparacion
instead of delete
AS
	DECLARE @IdReparacion int
BEGIN	

		SELECT  @IdReparacion = IdReparacion from deleted;

		DELETE FROM Reparacion_Repuesto where IdReparacion = @IdReparacion;
		DELETE FROM Reparacion where IdReparacion = @IdReparacion;
END
--MODIFICAR
CREATE or alter PROCEDURE ModificarReparacion
	@IdReparacion int,
	@IdVehiculo int,
	@FechaEntrada date,
	@FechaSalida date,
	@IdMecanico int,
	@DesEntrada varchar(50),
	@DesSalida varchar(50),
	@KmsEntrada int
AS
BEGIN
    UPDATE Reparacion SET IdVehiculo = @IdVehiculo, FchEntrada = @FechaEntrada, FchSalida = @FechaSalida, IdMecanico = @IdMecanico, DscEntrada = @DesEntrada, DscSalida = @DesSalida, kmsEntrada = @KmsEntrada  where IdReparacion = @IdReparacion;
END

--MOSTRAR REPARACION POR VEHICULO
CREATE Or alter PROCEDURE ListarReparacionXVehiculo
	@IdVehiculo int
AS
	SELECT IdReparacion, IdVehiculo, FchEntrada,FchSalida,IdMecanico, DscEntrada, DscSalida,kmsEntrada 
	FROM Reparacion Where IdVehiculo = @IdVehiculo

--LISTAR POR FECHA
CREATE OR ALTER PROCEDURE ListarReparacionXFecha
	@FechaInicio date,
	@FechaFin date
AS
BEGIN
		Select * From Reparacion Where FchEntrada >= @FechaInicio and FchSalida <= @FechaFin;
END

--LISTAR POR FECHA y VEHICULO
CREATE OR ALTER PROCEDURE ListarReparacionXFechaVehiculo
	@FechaInicio date,
	@FechaFin date,
	@IdVehiculo int
AS
BEGIN
		Select * From Reparacion Where FchEntrada >= @FechaInicio and FchSalida <= @FechaFin and IdVehiculo = @IdVehiculo;
END
END
-------------------PROCEDIMIENTOS AGENDA-------------------
BEGIN
--LISTAR
CREATE Or alter PROCEDURE ListarAgenda
AS
BEGIN
	SELECT Id ,IdVehiculo,DscEntrada,Usuario FROM Agenda
END
--ALTA
CREATE or alter PROCEDURE AltaAgenda
	@IdVehiculo int,
	@DscEntrada varchar(50),
	@Usuario int
AS
BEGIN
    INSERT INTO Agenda(IdVehiculo,DscEntrada,Usuario) VALUES (@IdVehiculo,@DscEntrada,@Usuario)
END
--BAJA
CREATE or ALTER PROCEDURE BajaAgenda
	@Id int
AS
BEGIN
		DELETE FROM Agenda WHERE Id = @Id
END

----LISTAR POR USUARIO
CREATE or ALTER PROCEDURE ListarAgendaxUsuario
	@Usuario int
AS
BEGIN
	SELECT * FROM Agenda WHERE Usuario = @Usuario;

END
END
-------------------PROCEDIMIENTOS REPARACION_REPUESTO-------------------
BEGIN
--LISTAR
CREATE Or alter PROCEDURE ListarReparacion_Repuesto
AS
BEGIN
	SELECT IdReparacion, IdRepuesto, Cantidad from Reparacion_Repuesto;
END

--ALTA
CREATE or alter PROCEDURE AltaReparacion_Repuesto
	@IdReparacion int,
	@IdRepuesto int,
	@Cantidad int
AS
BEGIN
    INSERT INTO Reparacion_Repuesto(IdReparacion,IdRepuesto,Cantidad) VALUES (@IdReparacion,@IdRepuesto,@Cantidad)
END

--LISTAR POR ID REPARACION
CREATE or ALTER PROCEDURE ListarReparacionRepuestoxReparacion
	@idReparacion int
AS
BEGIN
	SELECT * FROM repuesto r inner join Reparacion_Repuesto rr on r.IdRepuesto = rr.IdRepuesto
	WHERE IdReparacion = @idReparacion;

END
END

--INSERTS
BEGIN
	insert into Usuario values ('User', 54649364,'user@gmail.com','user','091799633');
	insert into Usuario values ('Agustin', 52846893,'anoy@gmail.com','agus123','097589678');
	insert into Usuario values ('Maicol', 58263520,'mBargas@gmail.com','maicol321','099284688');
	insert into Usuario values ('Juan', 47832128,'juani@gmail.com','juani72','098223648');
	insert into Usuario values ('Pablo', 39841098,'pablo15@gmail.com','pablo15','097481674');
	insert into Usuario values ('Maria', 51889364,'maria2000@gmail.com','maria2000','091799633');
	
	insert into Admin values ('Admin', 47383780,'admin@gmail.com','admin',110);
	insert into Admin values ('Victoria', 57229971,'vicky@gmail.com','vicky83',263);
	insert into Admin values ('Martin', 43883792,'martin01@gmail.com','martin01',112);
	insert into Admin values ('Tomas', 52856722,'tomi@gmail.com','tomas03',331);
	insert into Admin values ('Lucas', 58897026,'lucas22@gmail.com','lucas22',138);

	insert into Proveedor values (1,'Taller Markt','099682477');
	insert into Proveedor values (2,'Car Check','098772264');
	insert into Proveedor values (3,'Mecanica Colonia','091578346');
	insert into Proveedor values (4,'Servi Autos','099648722');
	insert into Proveedor values (5,'Mecanica Valdense','099348751');

	insert into Repuesto values (1,'aros de piston',1500,'M',1);
	insert into Repuesto values (2,'espejo izquierdo',1100,'C',2);
	insert into Repuesto values (3,'lubricante sintetico',570,'L',3);
	insert into Repuesto values (4,'cilindro de freno',1000,'V',2);
	insert into Repuesto values (5,'tapon combustible',1300,'C',4);

	insert into Vehiculo values ('LAC4250','Nissan','March',2015,'negro',1);
	insert into Vehiculo values ('LEA7725','Fiat','Palio',2014,'blanco',2);
	insert into Vehiculo values ('SDJ4833','Suzuki','Celerio',2020,'rojo',3);
	insert into Vehiculo values ('SRD6158','Renault','Duster',2019,'negro',4);
	insert into Vehiculo values ('LAC2052','Chevrolet','Onix',2011,'blanco',5);

	insert into Mecanico values ('Rodrigo',48352794,'099855247',200);
	insert into Mecanico values ('Juan',34758387,'095879654',230);
	insert into Mecanico values ('Marcos',50248672,'097548931',250);
	insert into Mecanico values ('Diego',49663347,'099785102',220);
	insert into Mecanico values ('Valentin',40123278,'099287469',200);

	insert into Agenda values (1,'falla de motor',1);
	insert into Agenda values (2,'espejo dañado',2);
	insert into Agenda values (3,'cambiar caja de cambios',3);
	insert into Agenda values (3,'cambiarle las alfombras',3);
	insert into Agenda values (5,'tapon de combustible roto',5);

	insert into Reparacion values (1,'2022/02/15','2022/02/28',1,'falla del motor','arreglo del motor',78024);
	insert into Reparacion values (2,'2022/01/04','2022/01/20',2,'espejo dañado','cambio de espejo',102874);
	insert into Reparacion values (3,'2022/02/11','2022/02/26',3,'cambiar caja de cambios y alfombras','cambio caja de cambios y afombras',69785);
	insert into Reparacion values (4,'2021/10/14','2021/11/02',4,'cambiar cubiertas','cambio de cubiertas',115024);
	insert into Reparacion values (5,'2021/11/20','2021/12/09',5,'arreglar tapon de combustible','arreglo del tapon de combustible',93658);

	insert into Reparacion_Repuesto values (1,1,2);
	insert into Reparacion_Repuesto values (2,2,1);
	insert into Reparacion_Repuesto values (3,3,2);
	insert into Reparacion_Repuesto values (4,4,1);
	insert into Reparacion_Repuesto values (5,5,2);
END
