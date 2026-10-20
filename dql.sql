--1
SELECT * FROM produto;
SELECT * FROM pedido;

--2
SELECT p.*, pr.*
FROM pedido p
JOIN produto pr ON p.id_produto = pr.id;

--3
SELECT cliente.*, pedido.*
FROM cliente
JOIN pedido
    ON cliente.id = pedido.id_cliente
WHERE cliente.id = 1;

--4
SELECT p.*, pr.* FROM pedido p JOIN produto pr
ON p.id_produto = pr.id
ORDER BY p.id DESC
LIMIT 2;

--1
SELECT id, nome FROM produto
ORDER BY nome ASC;

--2
SELECT * FROM produto
ORDER BY id DESC
LIMIT 5;

--3
SELECT id, quantidade, valor_unitario FROM pedido
ORDER BY valor_unitario DESC;

--4 
SELECT * FROM pedido
ORDER BY id DESC
LIMIT 10;

--5 
SELECT pedido.id, cliente.nome, pedido.quantidade, pedido.valor_unitario FROM pedido
JOIN cliente ON pedido.id_cliente = cliente.id;

--6

-- 1
SELECT id, nome
FROM produto
ORDER BY nome ASC;


-- 2
SELECT *
FROM produto
ORDER BY id DESC
LIMIT 5;


-- 3
SELECT id, quantidade, valor_unitario
FROM pedido
ORDER BY valor_unitario DESC;


-- 4
SELECT *
FROM pedido
ORDER BY id DESC
LIMIT 10;


-- 5
SELECT pedido.id, cliente.nome, pedido.quantidade, pedido.valor_unitario
FROM pedido
JOIN cliente ON pedido.id_cliente = cliente.id;


-- 6
SELECT pedido.id, produto.nome, pedido.quantidade, pedido.valor_unitario FROM pedido
JOIN produto ON pedido.id_produto = produto.id;

--7
SELECT pedido.id, cliente.nome AS nome_cliente, produto.nome AS nome_produto,
       pedido.quantidade, pedido.valor_unitario, pedido.subtotal
FROM pedido JOIN cliente ON pedido.id_cliente = cliente.id 
JOIN produto ON pedido.id_produto = produto.id;

--8
SELECT cliente.nome AS nome_cliente, produto.nome AS nome_produto, pedido.subtotal FROM pedido
JOIN cliente ON pedido.id_cliente = cliente.id
JOIN produto ON pedido.id_produto = produto.id
ORDER BY pedido.subtotal DESC
LIMIT 5;

--9 
SELECT COUNT(*) AS quantidade_clientes FROM cliente;

--10 
SELECT COUNT(*) AS quantidade_produtos FROM produto;

--11
SELECT cliente.nome, COUNT(pedido.id) AS quantidade_pedidos FROM cliente
LEFT JOIN pedido ON cliente.id = pedido.id_cliente
GROUP BY cliente.id, cliente.nome;

--12
SELECT produto.nome, COUNT(pedido.id) AS quantidade_pedidos FROM produto
LEFT JOIN pedido ON produto.id = pedido.id_produto
GROUP BY produto.id, produto.nome
ORDER BY produto.nome ASC;

--13
SELECT SUM(subtotal) AS valor_total_pedidos FROM pedido;

--14
SELECT AVG(quantidade) AS media_quantidade_por_pedido FROM pedido;

--15
SELECT produto.nome, SUM(pedido.subtotal) AS total_vendido FROM produto
JOIN pedido ON produto.id = pedido.id_produto
GROUP BY produto.id, produto.nome
ORDER BY total_vendido DESC;