/* Aula 08 - 19/01/2023 - Funcionalidades no Group By */

-- GROUPING SETS
 -- BANCO DE DADOS: CORRENTISTAS
-- CONSTRUIR UMA TABELA QUE TENHA CIDADE, NOME_TRANSACAO E VALOR DA TRANSACAO
SELECT *
FROM correntista

SELECT *
FROM transacoes_total

SELECT *
FROM tipo_transacao

SELECT
	C.cidade,
	B.nome_transacao,
	SUM(A.valor) AS total
FROM transacoes_total A
LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id
LEFT JOIN correntista C ON A.cliente_id = C.cliente_id
GROUP BY 1, 2
ORDER BY 1, 2



SELECT
	C.cidade,
	B.nome_transacao,
	SUM(A.valor) AS total
FROM transacoes_total A
LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id
LEFT JOIN correntista C ON A.cliente_id = C.cliente_id
GROUP BY GROUPING SETS (C.cidade, B.nome_transacao)
ORDER BY 1, 2


SELECT
	C.cidade,
	B.nome_transacao,
	SUM(A.valor) AS total
FROM transacoes_total A
LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id
LEFT JOIN correntista C ON A.cliente_id = C.cliente_id
GROUP BY GROUPING SETS (C.cidade, B.nome_transacao, (C.cidade, B.nome_transacao))
ORDER BY 1, 2


-- ROLLUP 
SELECT
	C.cidade,
	B.nome_transacao,
	SUM(A.valor) AS total
FROM transacoes_total A
LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id
LEFT JOIN correntista C ON A.cliente_id = C.cliente_id
GROUP BY ROLLUP (C.cidade, B.nome_transacao)
ORDER BY 1, 2

SELECT
	C.cidade,
	B.nome_transacao,
	SUM(A.valor) AS total
FROM transacoes_total A
LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id
LEFT JOIN correntista C ON A.cliente_id = C.cliente_id
GROUP BY ROLLUP (B.nome_transacao, C.cidade)
ORDER BY 1, 2


-- CUBE 
SELECT
	C.cidade,
	B.nome_transacao,
	SUM(A.valor) AS total
FROM transacoes_total A
LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id
LEFT JOIN correntista C ON A.cliente_id = C.cliente_id
GROUP BY CUBE (C.cidade, B.nome_transacao)
ORDER BY 1, 2


-- OVER PARTITION BY e FUNÃ‡Ã•ES DE JANELA
DROP TABLE IF EXISTS tab_wf;

CREATE TABLE tab_wf AS
SELECT
	C.cidade,
	B.nome_transacao,
	SUM(A.valor) AS total
FROM transacoes_total A
LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id
LEFT JOIN correntista C ON A.cliente_id = C.cliente_id
GROUP BY 1, 2
ORDER BY 1, 2

SELECT *
FROM tab_wf

SELECT
	cidade,
	nome_transacao,
	total,
	SUM(total) OVER (PARTITION BY cidade ORDER BY nome_transacao) AS sumcum,
	COUNT(total) OVER (PARTITION BY cidade ORDER BY nome_transacao) AS num_rows,
	AVG(total) OVER (PARTITION BY cidade ORDER BY nome_transacao) AS media,
	FIRST_VALUE(total) OVER (PARTITION BY cidade ORDER BY nome_transacao) AS prim_valor,
	LAG(total) OVER (PARTITION BY cidade ORDER BY nome_transacao) AS total_dmenos1,
	LAG(total, 2) OVER (PARTITION BY cidade ORDER BY nome_transacao) AS total_dmenos2
FROM tab_wf

SELECT
	cidade,
	nome_transacao,
	total,
	LEAD(total) OVER (PARTITION BY cidade ORDER BY nome_transacao) AS LEAD,
	LEAD(total, 2) OVER (PARTITION BY cidade ORDER BY nome_transacao) AS lead2
FROM tab_wf


-- EXERCICIOS
-- 1) Usando o banco de dados da hamburgueria, monte uma tabela com as
-- seguintes informaÃ§Ãµes: nome_secao, nome_item e total gasto



-- 2) Monte o ROLLUP para a tabela acima com o agrupamento nome_secao, nome_item


-- 3) Calcule a soma acumulada e a diferenÃ§a para a tabela do item 1


-- 4) Monte uma tabela agregada com as seguintes informaÃ§Ãµes: forma_pgto, descricao_status e total de pedidos


-- 5) FaÃ§a a contagem e a soma acumulada para a tabela acima


-- 6) Monte com as tabelas de correntistas uma tabela agregada com cidade, nome_cliente, tipo_transacao e total das transaÃ§Ãµes


-- 7) Com a tabela acima, calcule o LAG, a diferenÃ§a e a soma acumulada 
