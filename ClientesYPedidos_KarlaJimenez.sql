-- Inserta al menos cinco nuevos clientes en la tabla «clientes».
INSERT INTO clientes (nombre, direccion,telefono)
VALUES 
('Karla', 'Avenida los carrera #41, Concepción', 67678754),
('Catalina', 'Avenida las Margaritas 1941, San Pedro de la Paz #6672',87789325),
('Sebastian', 'Caupolican #783, Los Ángeles', 89742746),
('Zafiro', 'Caupolican #1112, Quillón', 12345678),
('Felipe', 'Pedro Aguirre Cerda #443, San Pedro de la Paz', 67678754);

-- Inserta al menos diez nuevos pedidos en la tabla «pedidos».
-- Asegúrate de asignar correctamente el cliente correspondiente a cada pedido utilizando la columna «cliente_id».
INSERT INTO pedidos (clientes_id_cliente, fecha, total)
VALUES 
(1, '24-06-12', 10000),
(2, '24-08-01', 20000),
(3, '24-07-02', 30000),
(4, '24-06-12', 23000),
(5, '24-06-13', 32000),
(1, '24-06-14', 12000),
(2, '24-06-15', 21000),
(3, '24-06-16', 17000),
(4, '24-06-17', 16000),
(5, '24-06-18', 18000);

SELECT * FROM clientes;
SELECT * FROM pedidos;
DELETE FROM pedidos WHERE id_pedido > 0;
DELETE FROM clientes WHERE id_cliente > 0;
ALTER TABLE pedidos AUTO_INCREMENT=1;
ALTER TABLE clientes AUTO_INCREMENT=1;

-- Proyecta todos los clientes de la tabla «clientes» y sus respectivos pedidos.
SELECT C.nombre AS nombreDeCliente, P.total AS Pedidos
FROM clientes C, pedidos P
WHERE C.id_cliente = P.clientes_id_cliente;

-- Proyecta todos los pedidos realizados por un cliente específico, utilizando su ID.
SELECT P.clientes_id_cliente AS id_cliente, P.total AS Pedidos
FROM pedidos P
WHERE P.clientes_id_cliente = 1;

-- Calcula el total de todos los pedidos para cada cliente.
SELECT P.clientes_id_cliente AS id_cliente, C.nombre, SUM(total) AS TotaldePedidos 
FROM pedidos P, clientes C
WHERE C.id_cliente = P.clientes_id_cliente
GROUP BY P.clientes_id_cliente;

-- Ejemplo de GROUP BY
-- SELECT OrderID, SUM(Quantity) AS [Total Quantity]
-- FROM OrderDetails
-- GROUP BY OrderID;

-- Elimina un cliente específico de la tabla «clientes» y todos sus pedidos asociados de la tabla «pedidos».
DELETE FROM pedidos P WHERE P.clientes_id_cliente = 1;
DELETE FROM clientes C WHERE C.id_cliente = 1;
SELECT * FROM clientes;
SELECT * FROM pedidos;

-- Proyecta los tres clientes que han realizado más pedidos, ordenados de forma descendente por el número de pedidos.
SELECT P.clientes_id_cliente AS id_cliente, C.nombre, SUM(total) AS TotaldePedidos 
FROM pedidos P, clientes C
WHERE C.id_cliente = P.clientes_id_cliente
GROUP BY P.clientes_id_cliente
ORDER BY SUM(total) DESC
LIMIT 3;
