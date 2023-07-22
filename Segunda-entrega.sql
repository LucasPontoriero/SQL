use basededato;
 
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

CREATE TABLE Producto(
id_producto int,
nombre_producto varchar (30),
caracteristicas varchar (50), 
cantidad_producto int,
nombre_proveedor varchar (30),
primary key (id_producto)
);
SELECT * FROM producto;

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

CREATE TABLE Rendimiento(
siembra int,
cosecha int,
kgxha int,
id_lote int,
tm int,
primary key (id_lote));
SELECT * FROM Rendimiento;

CREATE TABLE Precios(
Venta int,
Compra int
);
SELECT * FROM Precios;

DELIMITER //
/* Resto la cantidad de hectareas sembras por la cantidad de hectareas cosechadas */
/* El resultado nos mostrara la cantidad de hectareas sin cosechar*/
CREATE FUNCTION hectareas_sin_cosechar (siembra INT) RETURNS INT 
deterministic
BEGIN 
    DECLARE Resultado INT;
    SET Resultado=siembra-800;
    RETURN Resultado;
END
//

select hectareas_sin_cosechar (1000);

DELIMITER //
/*Calculamos la cantidad de litros de agua por la cantidad de hectareas que quisieramos cultivar*/

CREATE FUNCTION litros_de_agua (hectareas INT) RETURNS INT 
deterministic
BEGIN
    DECLARE Total INT;
    DECLARE Litros INT;
    SET Litros = 30000;
    SET Total = (Litros * hectareas);
    RETURN Total;
    
END
/*En este caso calculamos la cantidad de litros de agua para 10 hectareas*/
//

SELECT litros_de_agua (10);

DELIMITER //
CREATE TRIGGER actualizar_rendimiento
AFTER INSERT ON Rendimiento
FOR EACH ROW
BEGIN 
  INSERT INTO Precios(Venta) value ('Se actualizo el precio de venta');
END//

CREATE VIEW vista_clientes AS
SELECT * FROM Cliente
WHERE id = 4;

SELECT * FROM vista_clientes
/* Aqui creamos una vista para visualizar solamente el cliente con el numero ID 4*/

CREATE VIEW vista_paises_de_clientes AS
SELECT * FROM Cliente
WHERE pais_cliente = "Inglaterra";

SELECT * FROM vista_paises_de_clientes

/*En esta vista creada podemos visualizar los clientes de inglaterra*/

DROP PROCEDURE clientes_con_letra;
delimiter //
CREATE PROCEDURE clientes_con_letra(in letra char)
BEGIN
SELECT * FROM Cliente
WHERE nombre like concat ('%',letra,'%');
/*En este procedimiento mostramos los clientes que contengan la letra o en su nombre*/
END//

CALL clientes_con_letra('o')





