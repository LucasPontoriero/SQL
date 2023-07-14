CREATE DATABASE Empresa;
use basededato;
 
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
Venta int,
Compra int
);
SELECT * FROM Precios;

/* Resto la cantidad de hectareas sembras por la cantidad de hectareas cosechadas */
/* El resultado nos mostrara la cantidad de hectareas sin cosechar*/
DELIMITER //
CREATE FUNCTION hectareas_sin_cosechar (siembra INT) RETURNS INT 
deterministic
BEGIN 
    DECLARE Resultado INT;
    SET Resultado=siembra-800;
    RETURN Resultado;
END
//

select hectareas_sin_cosechar (1000);
/*Calculamos la cantidad de litros de agua por la cantidad de hectareas que quisieramos cultivar*/
DELIMITER //
CREATE FUNCTION litros_de_agua (hectareas INT) RETURNS INT 
deterministic
BEGIN
    DECLARE Total INT;
    DECLARE Litros INT;
    SET Litros = 30000;
    SET Total = (Litros * hectareas);
    RETURN Total;
    
END
//

SELECT litros_de_agua (10)

/*En este caso calculamos la cantidad de litros de agua para 10 hectareas*/


