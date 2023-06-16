CREATE DATABASE Empresa;

drop table Cliente; 
CREATE TABLE Cliente(
id int,
nombre varchar(30),
email varchar(50),
pais_cliente varchar(30),
ciudad_cliente varchar(40),
codigo_postal varchar(10),
telefono int,
PRIMARY KEY (id));

select * from Cliente;
insert Cliente values(1, 'Michael', 'michael10@hotmail.com', 'Inglaterra', 'Manchester', '1635', 37896456);
insert Cliente values(2, 'George', 'george_90@hotmail.com', 'Irlanda', 'Cork', '5454', 38291753);

drop table producto;
CREATE TABLE Producto(
id_producto int,
nombre_producto varchar (30),
caracteristicas varchar (50), 
cantidad_producto int,
nombre_proveedor varchar (30),
primary key (id_producto)
);

select * from Producto;
insert Producto values (1, 'Semilla', 'Semilla de trigo', 10000, 'Lucas');
insert Producto values (2, 'Fertilizante', 'Herbicida', 10, 'Hector');

drop table Pedido;
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
foreign key(id_producto) references producto(id_producto));

select * from Pedido;
insert Pedido values (1, 2, 'Martin', 'Evergreen', 'Brigthon', 7589, 'Wessex', '2022-05-05', '2022-05-10');

create table Rendimiento(
siembra int,
cosecha int,
kgxha int,
id_lote int,
tm int,
primary key (id_lote));

select * from rendimiento;

insert rendimiento values (1000, 900, 20, 5, 10000);

create table Precios(
Venta int primary key auto_increment,
Compra int);

select * from Precios;

insert precios values (1000, 2000)







