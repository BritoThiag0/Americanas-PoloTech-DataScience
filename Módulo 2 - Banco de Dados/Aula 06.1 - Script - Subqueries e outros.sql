/* Aula 06 - 13/01/2023 - Aula */

-- SUBQUERIES



-- Monte uma tabela com o saldo atual e as atualizacoes de saldo (entrada e saida)
-- 1º - Tabela de entradas
CREATE TABLE tb_entrada AS (
	SELECT t.cliente_id,
		   SUM(t.valor) AS entrada
	FROM transacoes t
	LEFT JOIN tipo_transacao tt ON t.tipo_transacao_id = tt.tipo_transacao_id
	WHERE tt.nome_transacao = 'PixIn'
	GROUP BY 1
	ORDER BY 1);

-- 2º - Tabela de saídas
CREATE TABLE tb_saida AS (
	SELECT t.cliente_id,
		   -SUM(t.valor) AS saida
	FROM transacoes t
	LEFT JOIN tipo_transacao tt ON t.tipo_transacao_id = tt.tipo_transacao_id
	WHERE tt.nome_transacao != 'PixIn'
	GROUP BY 1
	ORDER BY 1);

-- 3º - Visaulização do saldo, entrada e saída
SELECT s.cliente_id,
	   s.saldo,
	   te.entrada,
	   ts.saida
FROM saldo s
LEFT JOIN tb_entrada te ON s.cliente_id = te.cliente_id
LEFT JOIN tb_saida ts ON s.cliente_id = ts.cliente_id;

-- Usando SUBqueries
SELECT s.cliente_id,
	   s.saldo,
	   ent.entrada,
	   sai.saida
FROM saldo s
LEFT JOIN (SELECT t.cliente_id,
		   		  SUM(t.valor) AS entrada
		   FROM transacoes t
		   LEFT JOIN tipo_transacao tt ON t.tipo_transacao_id = tt.tipo_transacao_id
		   WHERE tt.nome_transacao = 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) AS ent ON s.cliente_id = ent.cliente_id
LEFT JOIN (SELECT t.cliente_id,
		   		  -SUM(t.valor) AS saida
		   FROM transacoes t
		   LEFT JOIN tipo_transacao tt ON t.tipo_transacao_id = tt.tipo_transacao_id
		   WHERE tt.nome_transacao != 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) AS sai ON s.cliente_id = sai.cliente_id;

-- CASE WHEN
SELECT s.cliente_id,
	   s.saldo,
	   CASE WHEN te.entrada IS NULL THEN 0
	   		ELSE te.entrada END AS entrada,
	   CASE WHEN ts.saida IS NULL THEN 0
	   		ELSE ts.saida END AS saida,
	   s.saldo + (CASE WHEN te.entrada IS NULL THEN 0 ELSE te.entrada END)
	   		   + (CASE WHEN ts.saida IS NULL THEN 0 ELSE ts.saida END)
FROM saldo s
LEFT JOIN tb_entrada te ON s.cliente_id = te.cliente_id
LEFT JOIN tb_saida ts ON s.cliente_id = ts.cliente_id;



SELECT cliente_id,
	   idade,
	   CASE WHEN idade <= 30 THEN 'Faixa 1 - Até 30 anos'
	   		WHEN idade <= 40 THEN 'Faixa 2 - Entre 30 e 40 anos'
	   		WHEN idade <= 50 THEN 'Faixa 3 - Entre 40 e 50 anos'
	   		WHEN idade <= 60 THEN 'Faixa 4 - Entre 50 e 60 anos'
	   		ELSE 'Faixa 5 - Acima de 60 anos' END AS fx_idade
FROM clientes;

SELECT fx_idade,
	   COUNT(*) AS qtd_clientes
FROM (SELECT cliente_id,
	   		 idade,
		     CASE WHEN idade <= 30 THEN 'Faixa 1 - Até 30 anos'
		   		  WHEN idade <= 40 THEN 'Faixa 2 - Entre 30 e 40 anos'
		   		  WHEN idade <= 50 THEN 'Faixa 3 - Entre 40 e 50 anos'
		   		  WHEN idade <= 60 THEN 'Faixa 4 - Entre 50 e 60 anos'
		   		  ELSE 'Faixa 5 - Acima de 60 anos' END AS fx_idade
FROM clientes) AS A
GROUP BY 1
ORDER BY 1;


-- MANIPULANDO DATAS E TEXTOS

-- TEXTOS
-- MINUSCULAS
SELECT ('BOA NOITE, TURMA. COMO ESTAO'),
	   LOWER('BOA NOITE, TURMA. COMO ESTAO');

-- MAIUSCULAS
SELECT ('boa noite, turma. como estao'),
	   UPPER('boa noite, turma. como estao');

-- Função LIKE
-- Exemplo que dá false
SELECT 'SANDRO SAORIN' LIKE 'SANDRO';

-- Exemplo que dá true
SELECT 'SANDRO SAORIN' LIKE 'SANDRO SAORIN';

-- %: valida trecho de palavras
-- % a direita = pode ter mais coisa a direita da palavra
SELECT 'SANDRO SAORIN ADADAAD' LIKE 'SANDRO%';

-- % a esquerda = pode ter mais coisa a esquerda da palavra
SELECT 'SANDRO SAORIN' LIKE '%SANDRO';		

-- % em ambos os lados: valida se existe aquele trecho dentro da string
SELECT 'SANDRO SAORIN' LIKE '%SANDRO%';

-- CONCAT
SELECT CONCAT('SANDRO', ' ', 'SAORIN', ' ', 'DA', ' ', 'SILVA');

--SUBSTRING (SUBSTR)
-- COMO FUNCIONA SUBSTR(PALAVRA, POSIÃ‡ÃƒO DE INICIO NA PALAVRA, E O COMPRIMENTO QUE VAI PERCORRER)
SELECT SUBSTRING('SANDRO SAORIN DA SILVA', 1, 8); 

-- DATAS
-- Customizando datas
SELECT data_pedido
from sales
LIMIT 10;

SELECT data_pedido,
	   TO_CHAR(data_pedido, 'dd/mm/yyyy') AS nova_data_pedido
from sales
LIMIT 10;

SELECT data_pedido,
	   TO_CHAR(data_pedido, 'dd mon YY') AS nova_data_pedido,
	   TO_CHAR(data_pedido, 'dd/month/YYYY') AS nova_data_pedido
from sales
LIMIT 10;

--EXTRAINDO INFORMAÇÕES DAS DATAS
SELECT data_pedido,
	   EXTRACT(DAY FROM data_pedido) AS dia,
	   EXTRACT(MONTH FROM data_pedido) AS mes,
	   EXTRACT(YEAR FROM data_pedido) AS ano,
	   EXTRACT(WEEK FROM data_pedido) AS semana,
	   TO_CHAR(data_pedido, 'MONTH') AS nome_mes,
	   TO_CHAR(data_pedido, 'Month') AS nome_mes,
	   TO_CHAR(data_pedido, 'month') AS nome_mes,
	   TO_CHAR(data_pedido, 'MON') AS nome_mes,
	   TO_CHAR(data_pedido, 'Mon') AS nome_mes,
	   TO_CHAR(data_pedido, 'mon') AS nome_mes
from sales;


-- Data de hoje
SELECT CURRENT_DATE AS hoje;

SELECT CURRENT_TIME AS hora;

SELECT CURRENT_TIMESTAMP AS timestamp; --Data completa

SELECT EXTRACT(MONTH FROM CURRENT_DATE) AS mes_atual;

