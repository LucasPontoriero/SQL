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

drop table Precios;
CREATE TABLE Precios (
id_lote int,
Venta int,
Compra int,
PRIMARY KEY (id_lote),
FOREIGN KEY (id_lote) REFERENCES Rendimiento(id_lote));
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
DROP TRIGGER actualizar_rendimiento
DELIMITER //
CREATE TRIGGER actualizar_rendimiento
AFTER INSERT ON Rendimiento
FOR EACH ROW
BEGIN 
  INSERT INTO Precios(id_lote, Venta, Compra) VALUES (NEW.id_lote, NEW.kgxha, 0);
END//
DELIMITER;


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

CALL clientes_con_letra('o');

START TRANSACTION;

IF (SELECT COUNT(*) FROM cliente) > 0 THEN
    DELETE FROM cliente WHERE <condición_para_eliminar>;
ELSE
    INSERT INTO cliente (nombre, email, pais_cliente, codigo_postal, telefono)
    VALUES ('NombreCliente', 'email@ejemplo.com', 'Pais', 'CodigoPostal', 'Telefono');
END IF;
COMMIT;


START TRANSACTION;
UPDATE producto SET cantidad_producto = cantidad_producto + 50 WHERE id_producto = 1;
UPDATE producto SET nombre_proveedor = 'NuevoProveedor' WHERE id_producto = 2;
COMMIT;

/* Ejemplo de eliminación de registros importantes de la tabla "clientes" */
DELETE FROM clientes WHERE cliente_id = 1;
DELETE FROM clientes WHERE cliente_id = 2;
DELETE FROM clientes WHERE cliente_id = 3;

BEGIN TRANSACTION;

/* Ejemplo de inserción de nuevos registros en la tabla "pedido" */
INSERT INTO pedido (id_pedido, id_producto, fecha_pedido)
VALUES (101, 1, '2023-08-01');

INSERT INTO pedido (id_pedido, id_producto, fecha_pedido)
VALUES (102, 2, '2023-08-01');

SAVEPOINT sp1;
/* ROLLBACK TO SAVEPOINT sp1;*/

INSERT INTO pedido (id_pedido, id_producto, fecha_pedido)
VALUES (105, 3, '2023-08-01');

INSERT INTO pedido (id_pedido, id_producto, fecha_pedido)
VALUES (106, 4, '2023-08-01');

INSERT INTO pedido (id_pedido, id_producto, fecha_pedido)
VALUES (107, 5, '2023-09-01');

INSERT INTO pedido (id_pedido, id_producto, fecha_pedido)
VALUES (108, 6, '2023-09-11');

SAVEPOINT sp2;

COMMIT;

-- Backup de Datos de Tablas: rendimiento, producto, cliente, precio, pedido
-- Generado el 5-08-2023
-- Por: Lucas Pontoriero







