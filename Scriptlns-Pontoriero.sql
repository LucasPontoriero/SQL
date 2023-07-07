CREATE DATABASE Empresa;
 
DROP TABLE Cliente;
CREATE TABLE Cliente(
id int,
nombre varchar(30),
email varchar(50),
pais_cliente varchar(30),
ciudad_cliente varchar(40),
codigo_postal varchar(10),
telefono int,
PRIMARY KEY (id));
SELECT * FROM Cliente;

drop table producto;
CREATE TABLE Producto(
id_producto int,
nombre_producto varchar (30),
caracteristicas varchar (50), 
cantidad_producto int,
nombre_proveedor varchar (30),
primary key (id_producto)
);
SELECT * FROM producto;

DROP TABLE Pedido;
CREATE TABLE Pedido(
id_pedido int,
id_producto INT NOT NULL,
nombre_cliente varchar (40),
A_calle varchar (40),
A_ciudad varchar (20),
A_cp int,
a_condado varchar (20),
fecha_pedido date,
fecha_envio date,
PRIMARY KEY (id_pedido),
foreign key(id_producto) references producto(id_producto));
SELECT * FROM Pedido;

DROP TABLE Rendimiento;
CREATE TABLE Rendimiento(
siembra int,
cosecha int,
kgxha int,
id_lote int,
tm int,
primary key (id_lote));
SELECT * FROM Rendimiento;

DROP TABLE Precios;
CREATE TABLE Precios(
Venta int primary key auto_increment,
Compra int
);
SELECT * FROM Precios;



