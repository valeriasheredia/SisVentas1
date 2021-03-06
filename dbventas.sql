USE [master]
GO
/****** Object:  Database [dbventas]    Script Date: 12/01/2022 12:23:13 ******/
CREATE DATABASE [dbventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dbventas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dbventas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbventas] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbventas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbventas] SET  MULTI_USER 
GO
ALTER DATABASE [dbventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbventas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbventas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbventas] SET QUERY_STORE = OFF
GO
USE [dbventas]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [dbventas]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](1024) NULL,
	[imagen] [image] NULL,
	[idcategoria] [int] NOT NULL,
	[idpresentacion] [int] NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](250) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](40) NULL,
	[sexo] [varchar](1) NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[tipo_documento] [varchar](20) NOT NULL,
	[num_documento] [varchar](11) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Ingreso]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Ingreso](
	[iddetalle_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[idingreso] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[precio_compra] [money] NOT NULL,
	[precio_venta] [money] NOT NULL,
	[stock_inicial] [int] NOT NULL,
	[stock_actual] [int] NOT NULL,
	[fecha_produccion] [date] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
 CONSTRAINT [PK_Detalle_Ingreso] PRIMARY KEY CLUSTERED 
(
	[iddetalle_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[iddetalle_ingreso] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_venta] [money] NOT NULL,
	[descuento] [money] NOT NULL,
 CONSTRAINT [PK_detalle_venta] PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idtrabajador] [int] NOT NULL,
	[idproveedor] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie] [varchar](4) NOT NULL,
	[correlativo] [varchar](7) NOT NULL,
	[igv] [decimal](4, 2) NOT NULL,
	[estado] [varchar](7) NOT NULL,
 CONSTRAINT [PK_Ingreso] PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentacion](
	[idpresentacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](250) NULL,
 CONSTRAINT [PK_Presentacion] PRIMARY KEY CLUSTERED 
(
	[idpresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[idproveedor] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](150) NOT NULL,
	[sector_comercial] [varchar](50) NOT NULL,
	[tipo_documento] [varchar](20) NOT NULL,
	[num_documento] [varchar](11) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[url] [varchar](100) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajador](
	[idtrabajador] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[num_documento] [varchar](8) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[acceso] [varchar](20) NOT NULL,
	[usuario] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Trabajador] PRIMARY KEY CLUSTERED 
(
	[idtrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idtrabajador] [int] NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie] [varchar](4) NOT NULL,
	[correlativo] [varchar](7) NULL,
	[igv] [decimal](4, 2) NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Categoria] FOREIGN KEY([idcategoria])
REFERENCES [dbo].[Categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Categoria]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Presentacion] FOREIGN KEY([idpresentacion])
REFERENCES [dbo].[Presentacion] ([idpresentacion])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Presentacion]
GO
ALTER TABLE [dbo].[Detalle_Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Ingreso_Articulo] FOREIGN KEY([idarticulo])
REFERENCES [dbo].[Articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[Detalle_Ingreso] CHECK CONSTRAINT [FK_Detalle_Ingreso_Articulo]
GO
ALTER TABLE [dbo].[Detalle_Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Ingreso_Ingreso1] FOREIGN KEY([idingreso])
REFERENCES [dbo].[Ingreso] ([idingreso])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalle_Ingreso] CHECK CONSTRAINT [FK_Detalle_Ingreso_Ingreso1]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Venta_Detalle_Ingreso] FOREIGN KEY([iddetalle_ingreso])
REFERENCES [dbo].[Detalle_Ingreso] ([iddetalle_ingreso])
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [FK_Detalle_Venta_Detalle_Ingreso]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Venta_Venta1] FOREIGN KEY([idventa])
REFERENCES [dbo].[Venta] ([idventa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [FK_Detalle_Venta_Venta1]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Proveedor] FOREIGN KEY([idproveedor])
REFERENCES [dbo].[Proveedor] ([idproveedor])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Proveedor]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Trabajador] FOREIGN KEY([idtrabajador])
REFERENCES [dbo].[Trabajador] ([idtrabajador])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Trabajador]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[Cliente] ([idcliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Trabajador] FOREIGN KEY([idtrabajador])
REFERENCES [dbo].[Trabajador] ([idtrabajador])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Trabajador]
GO
/****** Object:  StoredProcedure [dbo].[spanular_ingreso]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spanular_ingreso]
@idingreso int
as
update ingreso set estado='Anulado'
where idingreso=@idingreso
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_articulo_nombre]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_articulo_nombre]
@textobuscar varchar(50)
as
SELECT dbo.Articulo.idarticulo, 
dbo.Articulo.codigo, 
dbo.Articulo.nombre, 
dbo.Articulo.descripcion, 
dbo.Articulo.imagen, 
dbo.Articulo.idcategoria, 
dbo.Categoria.nombre AS Categoría, 
dbo.Articulo.idpresentacion,
dbo.Presentacion.nombre AS Presentación
FROM dbo.Categoria 
INNER JOIN dbo.Articulo 
ON dbo.Categoria.idcategoria = dbo.Articulo.idcategoria 
INNER JOIN dbo.Presentacion 
ON dbo.Articulo.idpresentacion = dbo.Presentacion.idpresentacion
where dbo.Articulo.nombre like @textobuscar + '%'
order by dbo.Articulo.idarticulo desc
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_categoria]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_categoria]
@textobuscar varchar(50)
as
select * from categoria
where nombre like @textobuscar + '%'--Alt+39
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_apellidos]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_cliente_apellidos]
@textobuscar varchar(50)
as
select * from cliente
where apellido like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_num_documento]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_cliente_num_documento]
@textobuscar varchar(50)
as
select * from cliente
where num_documento like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_ingreso_fecha]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_ingreso_fecha]
@textobuscar varchar(20),
@textobuscar2 varchar(20)
as
select i.idingreso,(t.apellido + '' + t.nombre) as Trabajador,
p.razon_social as Proveedor, i.fecha, i.tipo_comprobante, 
i.serie, i.correlativo, i.estado, sum(d.precio_compra*d.stock_inicial
)as Total
from Detalle_Ingreso d 
inner join ingreso i
on d.idingreso=i.idingreso
inner join Proveedor p
on i.idproveedor=p.idproveedor
inner join Trabajador t
on i.idtrabajador=t.idtrabajador
group by i.idingreso,(t.apellido + '' + t.nombre) ,
p.razon_social, i.fecha, i.tipo_comprobante, 
i.serie, i.correlativo, i.estado
having i.fecha>=@textobuscar and i.fecha<=@textobuscar2
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_presentacion_nombre]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_presentacion_nombre]
@textobuscar varchar(50)
as
select * from Presentacion
where nombre like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_proveedor_num_documento]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_proveedor_num_documento]
@textobuscar varchar(11)
as
select * from Proveedor
where num_documento like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_proveedor_razon_social]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_proveedor_razon_social]
@textobuscar varchar(50)
as
select * from Proveedor
where razon_social like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_trabajador_apellido]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_trabajador_apellido]
@textobuscar varchar(50)
as
select * from Trabajador
where apellido like @textobuscar + '%'
order by apellido asc
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_trabajador_num_documento]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_trabajador_num_documento]
@textobuscar varchar(50)
as
select * from Trabajador
where num_documento like @textobuscar + '%'
order by apellido asc
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_venta_fecha]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_venta_fecha]
@textobuscar varchar(50),
@textobuscar2 varchar(50)
as select v.idventa,
(t.apellido + ' ' + t.nombre) as Trabajador,
(c.apellido + ' ' + c.nombre) as Cliente,
v.fecha, v.tipo_comprobante, v.serie, v.correlativo,
sum((d.cantidad*d.precio_venta)- d.descuento) as Total
from Detalle_Venta d inner join venta v
on d.idventa=v.idventa
inner join cliente c 
on v.idcliente=c.idcliente
inner join Trabajador t
on v.idtrabajador=t.idtrabajador
group by v.idventa,
(t.apellido + ' ' + t.nombre),
(c.apellido + ' ' + c.nombre),
v.fecha, v.tipo_comprobante, v.serie, v.correlativo
having v.fecha>=@textobuscar and v.fecha<=@textobuscar2
GO
/****** Object:  StoredProcedure [dbo].[spbuscararticulo_venta_codigo]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscararticulo_venta_codigo]
@textobuscar varchar(50)
as
select d.iddetalle_ingreso, a.codigo, a.nombre,
c.nombre as Categoría, p.nombre as Presentación,
d.stock_actual,d.precio_compra,d.precio_venta,
d.fecha_vencimiento
from Articulo a
inner join Categoria c
on a.idcategoria=c.idcategoria
inner join Presentacion p
on a.idpresentacion=p.idpresentacion
inner join Detalle_Ingreso d
on a.idarticulo=d.idingreso
inner join Ingreso i
on d.idingreso=i.idingreso
where a.codigo = @textobuscar + '%'
and d.stock_actual>0
and i.estado<>'ANULADO'
GO
/****** Object:  StoredProcedure [dbo].[spbuscararticulo_venta_nombre]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscararticulo_venta_nombre]
@textobuscar varchar(50)
as
select d.iddetalle_ingreso, a.codigo, a.nombre,
c.nombre as Categoría, p.nombre as Presentación,
d.stock_actual,d.precio_compra,d.precio_venta,
d.fecha_vencimiento
from Articulo a
inner join Categoria c
on a.idcategoria=c.idcategoria
inner join Presentacion p
on a.idpresentacion=p.idpresentacion
inner join Detalle_Ingreso d
on a.idarticulo=d.idingreso
inner join Ingreso i
on d.idingreso=i.idingreso
where a.nombre like @textobuscar + '%'
and d.stock_actual>0
and i.estado<>'ANULADO'
GO
/****** Object:  StoredProcedure [dbo].[spdisminuir_stock]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spdisminuir_stock]
@iddetalle_ingreso int,
@cantidad int
as
update Detalle_Ingreso
set stock_actual=stock_actual-@cantidad
where iddetalle_ingreso=@iddetalle_ingreso
GO
/****** Object:  StoredProcedure [dbo].[speditar_articulo]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_articulo]
@idarticulo int,
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar (1024),
@imagen image,
@idcategoria int,
@idpresentacion int
as
update Articulo
set 
codigo=@codigo,
nombre=@nombre, 
descripcion=@descripcion,
imagen=@imagen,
idcategoria=@idcategoria,
idpresentacion=@idpresentacion
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[speditar_categoria]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_categoria]
@idcategoria int,
@nombre varchar(50),
@descripcion varchar(250)
as
update categoria set nombre=@nombre,
descripcion=@descripcion
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[speditar_cliente]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_cliente]
@idcliente int,
@nombre varchar(50),
@apellido varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50)
as
update cliente set nombre=@nombre,
apellido=@apellido,
sexo=@sexo,
fecha_nacimiento=@fecha_nacimiento,
tipo_documento=@num_documento, 
num_documento=@num_documento,
direccion=@direccion, 
telefono=@telefono, 
email=@email
where idcliente=@idcliente
GO
/****** Object:  StoredProcedure [dbo].[speditar_presentacion]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_presentacion]
@idpresentacion int,
@nombre varchar(50),
@descripcion varchar(250)
as
update Presentacion set nombre=@nombre, descripcion=@descripcion
where idpresentacion=@idpresentacion
GO
/****** Object:  StoredProcedure [dbo].[speditar_proveedor]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_proveedor]
@idproveedor int,
@razon_social varchar(150),
@sector_comercial varchar(50),
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@url varchar(100)
as
update proveedor 
set razon_social=@razon_social, 
sector_comercial=@sector_comercial, 
tipo_documento=@tipo_documento, 
num_documento=@num_documento, 
direccion=@direccion, 
telefono=@telefono,
email=@email,
url=@url
where idproveedor=@idproveedor
GO
/****** Object:  StoredProcedure [dbo].[speditar_trabajador]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_trabajador]
@idtrabajador int,
@nombre varchar(20),
@apellido varchar(50),
@sexo varchar(1),
@fecha_nacimiento date,
@num_documento varchar(8),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@acceso varchar(20),
@usuario varchar (20),
@password varchar(20)
as
update Trabajador set 
nombre=@nombre,
apellido=@apellido,
sexo=@sexo,
fecha_nacimiento=@fecha_nacimiento,
num_documento=@num_documento,
direccion=@direccion,
telefono=@telefono,
email=@email,
acceso=@acceso,
usuario=@usuario,
password=@password
where idtrabajador=@idtrabajador
GO
/****** Object:  StoredProcedure [dbo].[speliminar_articulo]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_articulo]
@idarticulo int
as
delete from Articulo
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[speliminar_categoria]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_categoria]
@idcategoria int
as
delete from Categoria
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[speliminar_cliente]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_cliente]
@idcliente int
as
delete from cliente
where idcliente=@idcliente
GO
/****** Object:  StoredProcedure [dbo].[speliminar_presentacion]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_presentacion]
@idpresentacion int
as
delete from Presentacion
where idpresentacion=@idpresentacion
GO
/****** Object:  StoredProcedure [dbo].[speliminar_proveedor]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_proveedor]
@idproveedor int
as
delete from proveedor 
where idproveedor=@idproveedor
GO
/****** Object:  StoredProcedure [dbo].[speliminar_trabajador]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_trabajador]
@idtrabajador int
as
delete from Trabajador
where idtrabajador=@idtrabajador
GO
/****** Object:  StoredProcedure [dbo].[speliminar_venta]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_venta]
@idventa int
as
delete from venta
where idventa=@idventa
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_articulo]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_articulo]
@idarticulo int output,
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar (1024),
@imagen image,
@idcategoria int,
@idpresentacion int
as
insert into Articulo(codigo,nombre, descripcion, imagen, idcategoria, idpresentacion)
values (@codigo,@nombre,@descripcion,@imagen,@idarticulo,@idpresentacion)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_categoria]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_categoria]
@idcategoria int output,
@nombre varchar(50),
@descripcion varchar (250)
as
insert into categoria (nombre, descripcion)
values (@nombre, @descripcion)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_cliente]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_cliente]
@idcliente int output,
@nombre varchar(50),
@apellido varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50)
as
insert into cliente (nombre, apellido, sexo, fecha_nacimiento, tipo_documento, num_documento,direccion,telefono,email)
values (@nombre, @apellido, @sexo, @fecha_nacimiento, @tipo_documento, @num_documento, @direccion, @telefono, @email)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_detalle_ingreso]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_detalle_ingreso]
@iddetalle_ingreso int output,
@idingreso int,
@idarticulo int,
@precio_compra money,
@precio_venta money,
@stock_inicial int,
@stock_actual int,
@fecha_produccion date,
@fecha_vencimiento date
as
insert into Detalle_Ingreso(
idingreso,
idarticulo,
precio_compra,
precio_venta,
stock_inicial,
stock_actual,
fecha_produccion,
fecha_vencimiento)
values(
@idingreso,
@idarticulo,
@precio_compra,
@precio_venta,
@stock_inicial,
@stock_actual,
@fecha_produccion,
@fecha_vencimiento)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_detalle_venta]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_detalle_venta]
@iddetalle_venta int output,
@idventa int,
@iddetalle_ingreso int,
@cantidad int,
@precio_venta money,
@descuento money
as
insert into Detalle_Venta(idventa, iddetalle_ingreso,cantidad,
precio_venta, descuento)
values (@idventa, @iddetalle_ingreso,@cantidad,
@precio_venta, @descuento)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_ingreso]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_ingreso]
@idingreso int=null output,
@idtrabajador int,
@idproveedor int,
@fecha date,
@tipo_comprobante varchar(20),
@serie varchar(4),
@correlativo varchar(7),
@igv decimal(4,2),
@estado varchar(7)
as
insert into Ingreso (
idtrabajador,idproveedor,fecha,tipo_comprobante,
serie,correlativo,igv,estado)
values(@idtrabajador,@idproveedor,@fecha,@tipo_comprobante,
@serie,@correlativo,@igv,@estado)
--Obtener el codigo autogenerado
set @idingreso=@@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_presentacion]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_presentacion]
@idpresentacion int output,
@nombre varchar(50),
@descripcion varchar(250)
as
insert into Presentacion(nombre, descripcion)
values (@nombre,@descripcion)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_proveedor]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_proveedor]
@idproveedor int output,
@razon_social varchar(150),
@sector_comercial varchar(50),
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@url varchar(100)
as
insert into proveedor(razon_social, sector_comercial, tipo_documento, num_documento, direccion, telefono, email,url)
values (@razon_social, @sector_comercial, @tipo_documento, @num_documento, @direccion, @telefono, @email,@url)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_trabajador]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_trabajador]
@idtrabajador int output,
@nombre varchar(20),
@apellido varchar(50),
@sexo varchar(1),
@fecha_nacimiento date,
@num_documento varchar(8),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@acceso varchar(20),
@usuario varchar (20),
@password varchar(20)
as
insert into trabajador (nombre,
apellido, sexo, fecha_nacimiento, 
num_documento, direccion, telefono,
email,acceso,usuario,password)
values(@nombre,
@apellido, @sexo, @fecha_nacimiento, 
@num_documento, @direccion, @telefono,
@email,@acceso,@usuario,@password)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_venta]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Insertar Venta
create proc [dbo].[spinsertar_venta]
@idventa int= null output,
@idcliente int,
@idtrabajador int,
@fecha date,
@tipo_comprobante varchar(20),
@serie varchar (4),
@correlativo varchar (7),
@igv decimal(4,2)
as
insert into venta(idcliente,idtrabajador,fecha,tipo_comprobante,
serie,correlativo,igv)
values (@idcliente,@idtrabajador,@fecha,@tipo_comprobante,
@serie,@correlativo,@igv)
--Obtenemos el codigo autogenerado
set @idventa=@@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[splogin]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[splogin]
@usuario varchar(20),
@password varchar(20)
as
select idtrabajador, apellido, nombre,acceso
from Trabajador
where usuario=@usuario and password=@password
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_articulo]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_articulo]
as
SELECT top 100 dbo.Articulo.idarticulo, 
dbo.Articulo.codigo, 
dbo.Articulo.nombre, 
dbo.Articulo.descripcion, 
dbo.Articulo.imagen, 
dbo.Articulo.idcategoria, 
dbo.Categoria.nombre AS Categoría, 
dbo.Articulo.idpresentacion,
dbo.Presentacion.nombre AS Presentación
FROM dbo.Categoria 
INNER JOIN dbo.Articulo 
ON dbo.Categoria.idcategoria = dbo.Articulo.idcategoria 
INNER JOIN dbo.Presentacion 
ON dbo.Articulo.idpresentacion = dbo.Presentacion.idpresentacion
order by dbo.Articulo.idarticulo desc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_categoria]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_categoria]
as
select top 200 * from categoria
order by idcategoria desc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_cliente]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_cliente]
as
select top 100 * from cliente
order by apellido asc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_detalle_ingreso]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_detalle_ingreso]
@textobuscar int
as
select d.idarticulo, a.nombre as Articulo,
d.precio_compra, d.precio_venta, d.stock_inicial,
d.fecha_produccion,d.fecha_vencimiento,
(d.stock_inicial*d.precio_compra) as Subtotal
from Detalle_Ingreso d
inner join articulo a
on d.idarticulo=a.idarticulo
where d.idingreso=@textobuscar
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_detalle_venta]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_detalle_venta]
@textobuscar int
as
select d.iddetalle_ingreso, a.nombre as Artículo,
d.cantidad, d.precio_venta,d.descuento,
((d.precio_venta*d.cantidad)-d.descuento) as Subtotal
from Detalle_Venta d
inner join Detalle_Ingreso di
on d.iddetalle_ingreso=di.iddetalle_ingreso
inner join Articulo a
on di.idarticulo=a.idarticulo
where d.idventa=@textobuscar
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_ingreso]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spmostrar_ingreso]
as
select top 100 i.idingreso,(t.apellido + '' + t.nombre) as Trabajador,
p.razon_social as Proveedor, i.fecha, i.tipo_comprobante, 
i.serie, i.correlativo, i.estado, sum(d.precio_compra*d.stock_inicial
)as Total
from Detalle_Ingreso d 
inner join ingreso i
on d.idingreso=i.idingreso
inner join Proveedor p
on i.idproveedor=p.idproveedor
inner join Trabajador t
on i.idtrabajador=t.idtrabajador
group by i.idingreso,(t.apellido + '' + t.nombre) ,
p.razon_social, i.fecha, i.tipo_comprobante, 
i.serie, i.correlativo, i.estado
order by i.idingreso desc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_presentacion]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_presentacion]
as
select top 100 * from Presentacion
order by idpresentacion desc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_proveedor]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_proveedor]
as
select top 100 * from Proveedor
order by razon_social asc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_trabajador]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_trabajador]
as
select top 100 * from Trabajador
order by apellido asc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_venta]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_venta]
as
select top 100 v.idventa,
(t.apellido + ' ' + t.nombre) as Trabajador,
(c.apellido + ' ' + c.nombre) as Cliente,
v.fecha, v.tipo_comprobante, v.serie, v.correlativo,
sum((d.cantidad*d.precio_venta)- d.descuento) as Total
from Detalle_Venta d inner join venta v
on d.idventa=v.idventa
inner join cliente c 
on v.idcliente=c.idcliente
inner join Trabajador t
on v.idtrabajador=t.idtrabajador
group by v.idventa,
(t.apellido + ' ' + t.nombre),
(c.apellido + ' ' + c.nombre),
v.fecha, v.tipo_comprobante, v.serie, v.correlativo
order by v.idventa desc
GO
/****** Object:  StoredProcedure [dbo].[spreporte_factura]    Script Date: 12/01/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spreporte_factura]
@idventa int
as
select 
v.idventa, (t.apellido+' '+t.nombre)as Trabajador,
(c.apellido+' '+c.nombre)as Cliente,
c.direccion, c.telefono, c.num_documento,
v.fecha,v.tipo_comprobante,v.serie,v.correlativo,
v.igv, a.nombre,dv.precio_venta,dv.cantidad,
dv.descuento,(dv.cantidad*dv.precio_venta-dv.descuento) as Total_Parcial
from detalle_venta dv
inner join detalle_ingreso di
on dv.iddetalle_ingreso=di.iddetalle_ingreso
inner join articulo a
on a.idarticulo=di.idarticulo
inner join venta v
on v.idventa=dv.idventa
inner join cliente c
on v.idcliente=c.idcliente
inner join trabajador t
on t.idtrabajador=v.idtrabajador
where v.idventa=@idventa
GO
USE [master]
GO
ALTER DATABASE [dbventas] SET  READ_WRITE 
GO
