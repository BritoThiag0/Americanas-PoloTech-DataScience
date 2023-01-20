/* Aula 06 - 13/01/2023 - Exercícios */

-- EXERCICIOS
SELECT *
FROM sales;

-- 1) Usando a tabela sales, crie uma tabela onde teremos uma coluna categorica
--com as semanas e uma coluna numérica com o lucro total para cada semana.
SELECT EXTRACT(WEEK FROM data_pedido) AS semanas,
	   SUM((venda_garrafa - custo_garrafa)*garrafas_vendidas) AS lucro
FROM sales
GROUP BY 1
ORDER BY 1;

SELECT CASE WHEN data_pedido <= '2022-11-05' THEN '1 Semana'
			WHEN data_pedido <= '2022-11-12' THEN '2 Semana'
			WHEN data_pedido <= '2022-11-19' THEN '3 Semana'
			WHEN data_pedido <= '2022-11-26' THEN '4 Semana'
			ELSE '5 Semana' END AS semanas,
			SUM((venda_garrafa - custo_garrafa)*garrafas_vendidas) AS lucro
FROM sales
GROUP BY 1
ORDER BY 1;

-- 2) Usando a tabela sales, identifique todas as cidades que tem no nome
--as letras DE juntas, e calcule a quantidade de cidades
SELECT COUNT(DISTINCT cidade) AS qrde_cidades
FROM sales s 
WHERE cidade LIKE '%DE%'

SELECT DISTINCT cidade
FROM sales s 
WHERE cidade LIKE '%DE%'

-- 3) Utilizando o exercicio sobre o mercado, categorize os pedidos de acordo
--com o valor total gasto (sugira uma separação entre 6 categorias)
SELECT CASE WHEN total_pedido <= 100 THEN 'F1 - Até 100 reais'
			WHEN total_pedido <= 200 THEN 'F2 - 100 - 200 reais'
			WHEN total_pedido <= 300 THEN 'F3 - 200 - 300 reais'
			WHEN total_pedido <= 400 THEN 'F4 - 300 - 400 reais'
			WHEN total_pedido <= 500 THEN 'F5 - 400 - 500 reais' ELSE 'F6 - > 500 reais' END AS faixas,
			SUM(total_pedido) AS total	 
FROM (SELECT A.pedido_id,
			 SUM(A.quantidade*B.valor_unitario) AS total_pedido
	  FROM pedidos A
	  LEFT JOIN produtos B ON A.produto_id = B.produto_id
	  GROUP BY 1
	  ORDER BY 1) A
GROUP BY 1
ORDER BY 1;


-- 4) Usando o exercicio sobre correntistas, monte uma tabela com saldo e saldo_atual (parecido com o que foi feito em aula),
--mas agora utilizando as 100 transações, usando subqueries
DROP TABLE transacoes_total IF EXISTS;

CREATE TABLE transacoes_total AS		  
SELECT * FROM transacoes t 
UNION ALL
SELECT * FROM transacoes2 t2;


SELECT
	A.cliente_id,
	A.saldo,
	CASE WHEN B.entrada IS NULL THEN 0 ELSE B.entrada END AS entrada,
	CASE WHEN C.saida IS NULL THEN 0 ELSE C.saida END AS saida,
	A.saldo + (CASE WHEN B.entrada IS NULL THEN 0 
					ELSE B.entrada END) + (CASE WHEN C.saida IS NULL THEN 0 
												ELSE C.saida END) AS saldo_atual
FROM saldo A
LEFT JOIN (SELECT 
			   A.cliente_id,
			   SUM(A.valor) AS entrada
		   FROM transacoes_total A
		   LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
		   WHERE B.nome_transacao = 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) B ON A.cliente_id = B.cliente_id
LEFT JOIN (SELECT 
			   A.cliente_id,
			   -SUM(A.valor) AS saida
		   FROM transacoes_total A
		   LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
		   WHERE B.nome_transacao != 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) C ON A.cliente_id = C.cliente_id;

