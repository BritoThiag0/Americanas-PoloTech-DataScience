/* Aula 05 - 11/01/2023 - Exercícios */

-- EXERCICIOS

-- 1) Monte as seguinte tabelas:
-- produtos: produto_id, nome_produto, segmento_produto e valor_unitario
-- clientes: cliente_id, nome, idade, sexo (F ou M) e cidade
-- pedidos: pedido_id, cliente_id, produto_id e quantidade

CREATE TABLE produtos(
	produto_id integer PRIMARY KEY,
	nome_produto varchar(40),
	segmento_produto varchar(40),
	valor_unitario numeric(8,2));

CREATE TABLE clientes(
	cliente_id integer PRIMARY KEY,
	nome varchar(40),
	idade integer,
	sexo varchar(2),
	cidade varchar(40));

CREATE TABLE pedidos(
	pedido_id integer,
	cliente_id integer REFERENCES "clientes" (cliente_id),
	produto_id integer REFERENCES "produtos" (produto_id),
	quantidade integer NOT NULL);
drop table produtos;
	
-- 2) Preencha as tabelas com os seguintes INSERTS
INSERT INTO produtos (produto_id, nome_produto, segmento_produto, valor_unitario)
	VALUES  (1,'Pasta de Dente','Higiene',5.20),
			(2,'Sabonete','Higiene',2.30),
			(3,'Shampoo','Higiene',12.20),
			(4,'Condicionador','Higiene',14.70),
			(5,'Cotonete','Higiene',8.80),
			(6,'Desinfetante','Limpeza',6.70),
			(7,'Detergente','Limpeza',1.80),
			(8,'Sabão Líquido','Limpeza',23.50),
			(9,'Amaciante','Limpeza',18.60),
			(10,'Água Sanitária','Limpeza',9.60),
			(11,'Arroz','Mantimentos',22.70),
			(12,'Feijão','Mantimentos',9.80),
			(13,'Óleo','Mantimentos',11.20),
			(14,'Macarrão','Mantimentos',4.70),
			(15,'Molho de Tomate','Mantimentos',2.50),
			(16,'Farofa','Mantimentos',5.10),
			(17,'Tapioca','Mantimentos',10.90),
			(18,'Carne Moída','Açougue',29.90),
			(19,'Peito de Frango','Açougue',15.50),
			(20,'Salsicha','Açougue',10.20),
			(21,'Nuggets','Açougue',9.50),
			(22,'Carne de Soja','Açougue',31.70),
			(23,'Patinho','Açougue',42.90),
			(24,'Picanha','Açougue',68.90),
			(25,'Alcatra','Açougue',57.90),
			(26,'Leite','Laticínios',7.60),
			(27,'Leite em Pó','Laticínios',15.40),
			(28,'Queijo','Laticínios',12.20),
			(29,'Queijo Ralado','Laticínios',11.80),
			(30,'Toddynho','Laticínios',3.20),
			(31,'Leite Condensado','Laticínios',7.50),
			(32,'Batata Frita','Congelados',23.00),
			(33,'Blueberry','Congelados',25.50),
			(34,'Lasanha','Congelados',27.90),
			(35,'Sorvete','Congelados',32.50),
			(36,'Açai','Congelados',41.90),
			(37,'Cebola Empanada','Congelados',25.70),
			(38,'Pão de Queijo','Congelados',29.90),
			(39,'Torta Holandesa','Congelados',39.90),
			(40,'Chocolate','Doces',10.50),
			(41,'Paçoca','Doces',24.90),
			(42,'Chicletes','Doces',10.30),
			(43,'Bala de Café','Doces',8.70),
			(44,'Pirulitos','Doces',12.10),
			(45,'Chocolate Branco','Doces',11.20),
			(46,'Bolacha Recheada','Doces',4.30),
			(47,'Pão de Mel','Doces',6.90),
			(48,'Suco','Bebidas',8.90),
			(49,'Refrigerante','Bebidas',9.90),
			(50,'Cerveja','Bebidas',2.20);

INSERT INTO clientes (cliente_id, nome, idade, sexo, cidade)
	VALUES  (1,'Fabiane',32,'F','São Paulo'),
			(2,'Paulo',28,'M','Campinas'),
			(3,'Gisele',30,'F','Campinas'),
			(4,'Karina',27,'F','Guarulhos'),
			(5,'Sandro',30,'M','São Paulo'),
			(6,'Amanda',29,'F','São Paulo'),
			(7,'Rafael',45,'M','Guarulhos'),
			(8,'Luiza',60,'F','Campinas'),
			(9,'João',70,'M','Guarulhos'),
			(10,'Wesley',30,'M','Campinas'),
			(11,'Vinicius',45,'M','São Paulo'),
			(12,'José',85,'M','São Paulo'),
			(13,'Leticia',20,'F','São Paulo'),
			(14,'Sara',18,'F','Campinas'),
			(15,'Jessica',45,'F','Guarulhos'),
			(16,'Guilherme',42,'M','Guarulhos'),
			(17,'Fabio',40,'M','São Paulo'),
			(18,'Lucas',33,'M','São Paulo'),
			(19,'Luana',38,'F','São Paulo'),
			(20,'Pedro',52,'M','Guarulhos'),
			(21,'Thomaz',65,'M','Campinas');

INSERT INTO pedidos(pedido_id, cliente_id, produto_id, quantidade)
	VALUES  (1,17,19,3),
			(1,17,46,2),
			(1,17,24,5),
			(1,17,38,3),
			(1,17,26,5),
			(2,2,26,3),
			(2,2,25,4),
			(2,2,1,2),
			(2,2,35,3),
			(3,7,41,3),
			(3,7,22,1),
			(3,7,15,3),
			(3,7,49,5),
			(3,7,20,3),
			(3,7,2,3),
			(3,7,4,3),
			(3,7,32,2),
			(4,10,31,5),
			(4,10,32,1),
			(4,10,39,1),
			(4,10,26,2),
			(4,10,38,5),
			(4,10,9,4),
			(4,10,28,5),
			(5,19,11,3),
			(5,19,27,5),
			(6,4,42,2),
			(6,4,32,4),
			(6,4,23,4),
			(6,4,14,2),
			(6,4,50,5),
			(7,3,44,4),
			(7,3,17,3),
			(7,3,31,2),
			(7,3,33,2),
			(7,3,15,2),
			(8,5,49,1),
			(8,5,48,1),
			(8,5,16,3),
			(9,12,43,3),
			(9,12,19,3),
			(9,12,2,2),
			(9,12,1,3),
			(9,12,9,1),
			(10,11,33,2),
			(11,12,16,2),
			(11,12,25,3),
			(11,12,22,1),
			(11,12,47,3),
			(11,12,3,2),
			(12,17,11,3),
			(12,17,34,1),
			(12,17,37,3),
			(12,17,3,4),
			(13,16,44,2),
			(13,16,49,2),
			(13,16,34,2),
			(13,16,10,3),
			(13,16,25,5),
			(13,16,19,4),
			(13,16,20,1),
			(14,20,32,5),
			(14,20,46,3),
			(14,20,13,4),
			(15,2,41,1),
			(15,2,26,4),
			(15,2,33,3),
			(15,2,34,3),
			(16,1,34,4),
			(16,1,6,4),
			(16,1,49,1),
			(16,1,15,3),
			(17,8,36,3),
			(17,8,48,4),
			(17,8,42,1),
			(18,9,45,2),
			(18,9,50,3),
			(19,19,1,1),
			(20,21,8,1),
			(21,20,37,4),
			(21,20,42,2),
			(21,20,45,2),
			(21,20,3,3),
			(21,20,33,5),
			(21,20,9,1),
			(22,13,35,4),
			(22,13,49,3),
			(22,13,30,4),
			(23,12,14,1),
			(23,12,29,2),
			(23,12,40,5),
			(23,12,43,5),
			(24,10,45,5),
			(24,10,31,5),
			(25,9,42,4),
			(25,9,46,1),
			(25,9,14,2),
			(25,9,38,3),
			(25,9,47,3);
		
-- 3) Monte a tabela com o total gasto em cada um dos pedidos
SELECT pe.pedido_id,
	   SUM(pe.quantidade * pr.valor_unitario) AS valor_pedido
FROM pedidos pe
LEFT JOIN produtos pr ON pe.produto_id = pr.produto_id
GROUP BY 1
ORDER BY 1;

-- 4) Qual segmento que teve mais itens pedidos (em quantidade)
SELECT pr.segmento_produto,
	   SUM(pe.quantidade) AS qtd_pedido
FROM produtos pr
LEFT JOIN pedidos pe ON pe.produto_id = pr.produto_id
GROUP BY 1
ORDER BY 1;
		
-- 5) Faça um ranking das cidades onde teve mais pedidos de clientes em valor
SELECT c.cidade,
	   SUM(pe.quantidade * pr.valor_unitario) AS valor_pedido
FROM clientes c
LEFT JOIN pedidos pe ON C.cliente_id = pe.cliente_id
LEFT JOIN produtos pr ON pe.produto_id = pr.produto_id
GROUP BY 1
ORDER BY 2 DESC;

-- 6) Quantos pedidos teve por sexo
SELECT c.sexo,
	   COUNT(pe.pedido_id) AS qtd_pedidos
FROM clientes c
LEFT JOIN pedidos pe ON C.cliente_id = pe.cliente_id
GROUP BY 1
ORDER BY 1;
	
-- 7) Quais os itens mais pedidos para cleintes acima de 40 anos
SELECT c.idade,
	   pr.nome_produto,
	   SUM(pe.quantidade) AS qtd_produto
FROM clientes c
LEFT JOIN pedidos pe ON C.cliente_id = pe.cliente_id
LEFT JOIN produtos pr ON pe.produto_id = pr.produto_id
WHERE c.idade > 40
	  AND pr.nome_produto IS NOT NULL
GROUP BY c.idade, pr.nome_produto
ORDER BY 3 DESC;

-- 8) Quanto cada segmento vendeu? (valor total por segmento)
SELECT pr.segmento_produto,
	   SUM(pe.quantidade * pr.valor_unitario) AS valor_segmento
FROM produtos pr
LEFT JOIN pedidos pe ON pe.produto_id = pr.produto_id
GROUP BY 1
ORDER BY 1;

-- 9) Faça um ranking dos clientes que mais pediram no mercado
SELECT c.cliente_id,
	   c.nome,
	   COUNT(pe.pedido_id) AS qtd_pedidos
FROM clientes c
LEFT JOIN pedidos pe ON C.cliente_id = pe.cliente_id
GROUP BY c.cliente_id, c.nome
ORDER BY 3 DESC;

-- 10) Monte um ranking com o nome do produto, a quantidade de itens vendidos e o total vendido
-- ordenar pelo valor!
SELECT pr.nome_produto,
	   pr.valor_unitario,
	   SUM(pe.quantidade) AS qtd_vendida,
	   SUM(pe.quantidade * pr.valor_unitario) AS valor_total_vendido
FROM pedidos pe
LEFT JOIN produtos pr ON pe.produto_id = pr.produto_id
GROUP BY pr.nome_produto, pr.valor_unitario
ORDER BY valor_total_vendido DESC;