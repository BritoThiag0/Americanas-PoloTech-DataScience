-- Base de dados - sales
SELECT *
FROM sales;

-- Exercicio 1: Quantos itens distintos foram vendidos (item_id)?
SELECT COUNT(DISTINCT item_id) AS qtd_itens
FROM sales;

-- Exercicio 2: Quantas lojas existem na base (loja_id)?
SELECT COUNT(DISTINCT loja_id) AS qtd_lojas
FROM sales;

-- Exercicio 3: Qual é a cidade que mais tem lojas (cidade)?
SELECT cidade,
	   COUNT(DISTINCT loja_id) AS qtd_lojas
FROM sales
GROUP BY cidade
ORDER BY qtd_lojas DESC
LIMIT 1;

-- Exercicio 4: Em qual municipio foi vendido mais itens?
SELECT municipio,
	   SUM(garrafas_vendidas) AS qtd_itens
FROM sales
GROUP BY municipio
ORDER BY qtd_itens DESC
LIMIT 1;

-- Exercicio 5: Qual a cidade mais vendeu em dolares?
SELECT cidade,
	   SUM(total_venda) AS total_vendido_dolar
FROM sales
GROUP BY cidade
ORDER BY 2 DESC
LIMIT 1;

-- Exercicio 6: Qual foi o dia que mais vendeu itens distintos?
SELECT data_pedido,
	   COUNT(DISTINCT item_id) AS qtd_itens
FROM sales
GROUP BY data_pedido
ORDER BY 2 DESC
LIMIT 1;

-- Exercicio 7: Monte o top 5 bebidas (item_id) mais vendidas por valor?
SELECT item_id,
	   SUM(total_venda) AS total_vendido
FROM sales
GROUP BY item_id
ORDER BY 2 DESC
LIMIT 5;

-- Exercicio 8: Monte o top 5 bebidas (item_id) mais vendidas por volume em litros
SELECT item_id,
	   SUM(volume_litros_vendidos) AS total_litros_vendido
FROM sales
GROUP BY item_id
ORDER BY 2 DESC
LIMIT 5;

-- Exercicio 9: Quais são as 10 empresas (marca_id) que mais lucram com a venda de bebidas?
SELECT marca_id,
	   SUM((venda_garrafa - custo_garrafa) * garrafas_vendidas) AS lucro_total
FROM sales
GROUP BY marca_id
ORDER BY 2 DESC
LIMIT 10;

-- Exercicio 10: Monte uma tabela com a quantidade de vendas distintas por dia.
SELECT DISTINCT data_pedido,
	   COUNT(item_id) AS qtd_vendas
FROM sales s
GROUP BY data_pedido
ORDER BY 2 DESC;
