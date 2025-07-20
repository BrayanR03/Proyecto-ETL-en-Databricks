-- CREAMOS LA BD bdcosmetsac
GO
CREATE DATABASE BDCosmetSAC
GO
USE BDCosmetSAC
-- TABLA CLIENTES
GO
CREATE TABLE Clientes
(
	ClientesID INT IDENTITY(1,1) NOT NULL,
	ClientesApellidos NVARCHAR(70) NOT NULL,
	ClientesNombres NVARCHAR(70) NOT NULL,
	ClientesDni CHAR(8) NOT NULL,
	ClientesCorreoElectronico NVARCHAR(50) NOT NULL,
	ClientesTelefono CHAR(9) NOT NULL,
	CONSTRAINT ClientesPK PRIMARY KEY(ClientesID),
	CONSTRAINT ClienteDniUQ UNIQUE(ClientesDni)
)
-- TABLA FORMAS DE PAGO
GO
CREATE TABLE FormasPagos
(
	FormasPagosID INT IDENTITY(1,1) NOT NULL,
	FormasPagosDescripcion NVARCHAR(30) NOT NULL,
	CONSTRAINT FormasPagosPK PRIMARY KEY(FormasPagosID),
	CONSTRAINT FormaPagoDescripcionUQ UNIQUE(FormasPagosDescripcion)
)
-- TABLA MARCAS
GO
CREATE TABLE Marcas
(
	MarcasID INT IDENTITY(1,1) NOT NULL,
	MarcasDescripcion NVARCHAR(30) NOT NULL,
	CONSTRAINT MarcasPK PRIMARY KEY(MarcasID)
)
-- TABLA CATEGORIAS
GO
CREATE TABLE Categorias
(
	CategoriasID INT IDENTITY(1,1) NOT NULL,
	CategoriasDescripcion NVARCHAR(30) NOT NULL,
	CONSTRAINT CategoriasPK PRIMARY KEY (CategoriasID),
	CONSTRAINT CategoriaDescripcionUQ UNIQUE(CategoriasDescripcion)
)
-- TABLA PRODUCTOS
GO
CREATE TABLE Productos
(
	ProductosID INT IDENTITY(1,1) NOT NULL,
	ProductosDescripcion NVARCHAR(50) NOT NULL,
	ProductosPrecioCompra DECIMAL(9,2) NOT NULL,
	ProductosStock INT NOT NULL,
	ProductosMarcasID INT NOT NULL,
	ProductosCategoriasID INT NOT NULL,
	CONSTRAINT ProductosPK PRIMARY KEY (ProductosID),
	CONSTRAINT ProductoDescripcionUQ UNIQUE(ProductosDescripcion),
	CONSTRAINT ProductoPrecioCompraCK CHECK(ProductosPrecioCompra>0),
	CONSTRAINT ProductoStockCK CHECK(ProductosStock>0),
	CONSTRAINT ProductosMarcasFK FOREIGN KEY (ProductosMarcasID)
	REFERENCES Marcas (MarcasID),
	CONSTRAINT ProductosCategoriasFK FOREIGN KEY (ProductosCategoriasID)
	REFERENCES Categorias (CategoriasID)
)
-- TABLA PROMOCIONES
GO
CREATE TABLE Promociones
(
	PromocionesID INT IDENTITY(1,1) NOT NULL,
	PromocionesDescripcion NVARCHAR(70) NOT NULL,
	PromocionesDescuento DECIMAL(9,2) NOT NULL,
	PromocionesFechaInicio DATE NOT NULL,
	PromocionesFechaFin DATE NOT NULL,
	PromocionesEstado BIT NOT NULL,
	CONSTRAINT PromocionesPK PRIMARY KEY(PromocionesID),
	CONSTRAINT PromocionDescripcionUQ UNIQUE(PromocionesDescripcion),
	CONSTRAINT PromocionescuentoCK CHECK(PromocionesDescuento>0),
	CONSTRAINT PromocionEstadoCK CHECK(PromocionesEstado = 0 OR PromocionesEstado = 1)
)
-- TABLA Pedidos
GO
CREATE TABLE Pedidos
(
	PedidosID INT IDENTITY(1,1) NOT NULL,
	PedidosFechaRegistro DATE NOT NULL,
	PedidosClientesID INT NOT NULL,
	PedidosFormasPagosID INT NOT NULL,
	CONSTRAINT PedidosPK PRIMARY KEY (PedidosID),
	CONSTRAINT PedidosClientesFK FOREIGN KEY(PedidosClientesID)
	REFERENCES Clientes (ClientesID),
	CONSTRAINT PedidosFormasPagosPK FOREIGN KEY (PedidosFormasPagosID)
	REFERENCES FormasPagos (FormasPagosID)
)
-- TABLA DETALLE PEDIDOS
GO
CREATE TABLE DetallePedidos
(
	DetallePedidosPedidoID INT NOT NULL,
	DetallePedidosProductoID INT NOT NULL,
	DetallePedidosPrecioVenta DECIMAL(9,2) NOT NULL,
	DetallePedidosCantidad INT NOT NULL,
	DetallePedidosPromocionID INT NOT NULL,
	CONSTRAINT DetallePedidosPK PRIMARY KEY 
	(DetallePedidosPedidoID,DetallePedidosProductoID),
	CONSTRAINT DetallePedidosPedidosFK FOREIGN KEY
	(DetallePedidosPedidoID) REFERENCES Pedidos (PedidosID),
	CONSTRAINT DetallePedidosProductosFK FOREIGN KEY
	(DetallePedidosProductoID) REFERENCES Productos (ProductosID),
	CONSTRAINT DetallePedidosPromocionesFK FOREIGN KEY 
	(DetallePedidosPromocionID) REFERENCES Promociones (PromocionesID)
)