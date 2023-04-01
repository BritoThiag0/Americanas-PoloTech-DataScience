/* Aula 02 - 21/12/2022 - Exercícios */
SELECT * FROM vendas v 

--PERGUNTAS A RESOLVER

/* 1) Qual é o valor total de cada uma das compras? */
SELECT pedido_id,
	   SUM(quantidade * valor_unidade) as valor_total_compra
FROM vendas
GROUP BY pedido_id
ORDER BY pedido_id

/* 2) Qual o produto mais vendido em quantidade? */
SELECT produto_id,
	   nome_produto,
	   SUM(quantidade) as quantidade_vendida
FROM vendas
GROUP BY produto_id, nome_produto
ORDER BY quantidade_vendida DESC

/* 3) Qual o produto que mais vendeu em valor? */
SELECT produto_id,
	   nome_produto,
	   valor_unidade,
	   SUM(quantidade) as quantidade_vendida,
	   CAST(SUM(quantidade * valor_unidade) AS NUMERIC(8, 2)) as quantidade_vendida_valor
FROM vendas
GROUP BY produto_id, nome_produto, valor_unidade
ORDER BY quantidade_vendida_valor DESC