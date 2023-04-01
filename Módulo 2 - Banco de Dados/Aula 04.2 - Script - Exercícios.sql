/* Aula 04 - 09/01/2023 - Exercícios */
SELECT * FROM sales;

/* 1) Quais são as 10 marcas que lucraram acima de 1000 dólares no dia 30/11/2022? */
SELECT data_pedido,
	   marca_id,
	   SUM((venda_garrafa - custo_garrafa) * garrafas_vendidas) AS lucro_total
FROM sales
WHERE data_pedido = '2022-11-30'
GROUP BY data_pedido, marca_id
HAVING SUM((venda_garrafa - custo_garrafa) * garrafas_vendidas) > 1000
ORDER BY 2 DESC
LIMIT 10;

/* 2) Qual a cidade que mais vendeu litros para aqueles que venderam mais do que 2000 litros de bebidas? */
SELECT cidade,
	   SUM(volume_litros_vendidos) AS total_litros_vendido
FROM sales
GROUP BY cidade
HAVING SUM(volume_litros_vendidos) > 2000
ORDER BY 2 DESC
LIMIT 1;

/* 3) Qual o município que mais vendeu em dólares para totais menores que 15 mil dólares? */
SELECT municipio,
	   SUM(total_venda) AS total_vendido_dolar
FROM sales
GROUP BY municipio
HAVING SUM(total_venda) < 15000
ORDER BY 2 DESC;

/* 4) Quais as 5 marcas que tiveram os menores custos nas cidades de WATERLOO e DES MOINES? */
SELECT cidade,
	   marca_id,
	   SUM(custo_garrafa) AS custo_total
FROM sales
WHERE cidade IN ('WATERLOO', 'DES MOINES')
GROUP BY cidade, marca_id
ORDER BY 3 ASC
LIMIT 10;
