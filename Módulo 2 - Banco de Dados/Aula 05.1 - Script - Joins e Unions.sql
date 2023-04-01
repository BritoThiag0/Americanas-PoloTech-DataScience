/* Aula 05 - 11/01/2023 - Joins e Unions */

-- JOINS e UNIONS
CREATE TABLE correntista(
	cliente_id integer PRIMARY KEY,
	nome varchar(40),
	cidade varchar(40));

CREATE TABLE saldo(
	cliente_id integer REFERENCES "correntista" (cliente_id),
	saldo NUMERIC(16,2));

CREATE TABLE tipo_transacao(
	tipo_transacao_id integer PRIMARY KEY,
	nome_transacao varchar(40));

CREATE TABLE transacoes(
	transacao_id integer PRIMARY KEY,
	cliente_id integer REFERENCES "correntista" (cliente_id),
	tipo_transacao_id integer REFERENCES "tipo_transacao" (tipo_transacao_id),
	valor numeric (8,2));

INSERT INTO correntista (cliente_id, nome, cidade)
	VALUES  (1,'Francisco','São Paulo'),
			(2,'João','São Paulo'),
			(3,'Lúcia','Rio de Janeiro'),
			(4,'Rosana','São Paulo'),
			(5,'Laura','São Paulo'),
			(6,'Pedro','São Paulo'),
			(7,'Cristina','Rio de Janeiro'),
			(8,'Rosangela','São Paulo'),
			(9,'Augusto','Rio de Janeiro'),
			(10,'Cecilia','Rio de Janeiro');

INSERT INTO saldo (cliente_id, saldo)
	VALUES  (1,2700.00),
			(2,1550.00),
			(3,2278.50),
			(4,30008.00),
			(5,14000.00),
			(6,50000.00),
			(7,9000.00),
			(8,1500.50),
			(9,2000.00),
			(10,4500.00);

		
INSERT INTO tipo_transacao (tipo_transacao_id, nome_transacao)
	VALUES  (1, 'PixIn'),
			(2, 'PixOut'),
			(3, 'Boleto'),
			(4, 'Imposto'),
			(5, 'Tarifa');
		
INSERT INTO transacoes (transacao_id, cliente_id, tipo_transacao_id, valor)
	VALUES  (1,1,4,250.90),
			(2,1,5,79.80),
			(3,1,1,216.93),
			(4,8,2,71.74),
			(5,7,2,285.92),
			(6,7,1,220.27),
			(7,2,4,250.90),
			(8,5,1,116.37),
			(9,7,2,263.79),
			(10,10,3,48.73),
			(11,4,3,292.85),
			(12,7,1,177.23),
			(13,5,2,272.99),
			(14,4,2,176.17),
			(15,9,3,65.86),
			(16,5,2,150.51),
			(17,8,1,220.69),
			(18,2,5,79.80),
			(19,3,5,79.80),
			(20,4,5,79.80),
			(21,6,1,143.13),
			(22,6,3,128.54),
			(23,4,1,218.46),
			(24,3,2,229.54),
			(25,7,3,278.86),
			(26,7,2,221.88),
			(27,9,2,217.91),
			(28,3,4,250.90),
			(29,7,1,26.48),
			(30,7,3,109.80),
			(31,2,2,95.76),
			(32,9,1,172.12),
			(33,2,3,15.42),
			(34,6,3,58.18),
			(35,7,2,164.85),
			(36,1,1,64.71),
			(37,8,3,150.62),
			(38,1,1,10.68),
			(39,6,1,186.58),
			(40,8,2,76.40),
			(41,3,3,2.35),
			(42,10,3,138.83),
			(43,2,2,32.37),
			(44,1,2,278.95),
			(45,5,5,79.80),
			(46,6,5,79.80),
			(47,8,2,235.90),
			(48,6,3,56.19),
			(49,4,4,250.90),
			(50,7,3,124.25),
			(51,7,1,225.41),
			(52,5,4,250.90),
			(53,1,3,141.95),
			(54,8,3,141.36),
			(55,4,1,89.35),
			(56,1,2,111.23),
			(57,6,4,250.90),
			(58,9,3,21.21),
			(59,10,3,1.59),
			(60,10,3,153.68),
			(61,7,4,250.90),
			(62,6,3,271.81),
			(63,3,3,231.96),
			(64,4,2,81.15),
			(65,8,4,250.90),
			(66,9,4,250.90),
			(67,9,2,103.73),
			(68,2,2,274.50),
			(69,8,1,198.36),
			(70,10,4,250.90),
			(71,9,1,201.85),
			(72,7,5,79.80),
			(73,8,5,79.80),
			(74,6,2,92.88),
			(75,1,3,292.45),
			(76,10,3,246.89),
			(77,7,1,6.95),
			(78,1,1,106.69),
			(79,9,1,229.65),
			(80,5,2,289.34);

-- JOINS
-- Qual é a cidade que mais transacionou?

-- LEFT JOIN
SELECT *
FROM transacoes AS tran;


SELECT tran.*,
	   cor.cidade
FROM transacoes AS tran
LEFT JOIN correntista AS cor ON tran.cliente_id = cor.cliente_id;

SELECT cor.cidade,
	   COUNT(tran.cliente_id) AS qtd_transacoes
FROM transacoes AS tran
LEFT JOIN correntista AS cor ON tran.cliente_id = cor.cliente_id
GROUP BY 1;

-- RIGHT JOIN
-- total por tipo de transacao
SELECT tt.nome_transacao,
	   t.transacao_id,
	   t.valor
FROM tipo_transacao tt
RIGHT JOIN transacoes t ON tt.tipo_transacao_id = t.tipo_transacao_id 
;

SELECT tt.nome_transacao,
	   SUM(t.valor) AS total_transacao
FROM tipo_transacao tt
RIGHT JOIN transacoes t ON tt.tipo_transacao_id = t.tipo_transacao_id 
GROUP BY 1
ORDER BY 2 DESC;


-- INNER JOIN
CREATE TABLE tabela1 AS
	SELECT *
	FROM correntista
	WHERE cliente_id > 3;

SELECT * FROM tabela1;

CREATE TABLE tabela2 AS
	SELECT *
	FROM saldo
	WHERE cliente_id < 7;

SELECT * FROM tabela2;

SELECT tab1.cliente_id,
	   tab1.nome,
	   tab2.saldo
FROM tabela1 AS tab1
INNER JOIN tabela2 AS tab2 ON tab1.cliente_id = tab2.cliente_id;

-- FULL JOIN
SELECT tab1.cliente_id,
	   tab1.nome,
	   tab2.saldo
FROM tabela1 AS tab1
FULL JOIN tabela2 AS tab2 ON tab1.cliente_id = tab2.cliente_id;

-- Monte uma tabela com o saldo atual e as atualizacoes de saldo
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

-- UNIONS

/* É o empilhamento de tabelas.
 * 
 * UNION ALL: Não remove as duplicadas;
 * UNION: Remove as duplicadas;
 * 
 * */
		
CREATE TABLE transacoes2(
	transacao_id integer PRIMARY KEY,
	cliente_id integer REFERENCES "correntista" (cliente_id),
	tipo_transacao_id integer REFERENCES "tipo_transacao" (tipo_transacao_id),
	valor numeric (8,2));

INSERT INTO transacoes2 (transacao_id, cliente_id, tipo_transacao_id, valor)
	VALUES  (81,1,2,182.58),
			(82,10,3,131.67),
			(83,3,2,213.47),
			(84,8,3,105.19),
			(85,9,2,254.57),
			(86,9,2,182.12),
			(87,6,3,75.93),
			(88,5,1,219.25),
			(89,6,2,252.67),
			(90,9,1,174.20),
			(91,10,2,102.83),
			(92,4,2,143.71),
			(93,9,5,79.80),
			(94,10,5,79.80),
			(95,1,3,32.24),
			(96,4,2,75.50),
			(97,1,3,239.13),
			(98,4,1,67.34),
			(99,1,1,196.98),
			(100,9,3,24.84);

SELECT * FROM transacoes
UNION ALL
SELECT * FROM transacoes2;

