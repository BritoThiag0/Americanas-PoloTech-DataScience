/* Exercícios - 21/12 */

--Criar uma tabela nomeado como funcionarios
--e nessa tabela deve conter:
--	funcionario_id (integer)
--	nome
--	departamento
--	cargo
--	senioridade
--	salario numeric
	

--Criar uma tabela nomeada como vendas e nessa tabela deve conter:
--	pedido_id integer
--	produto_id integer
--	nome_produto
--	quantidade integer
--	valor_unidade numeric

/* Questão 1 - Funcionários */
CREATE TABLE funcionarios(
	funcionario_id INTEGER NOT NULL,
	nome VARCHAR(40),
	departamento VARCHAR(40),
	cargo VARCHAR(40),
	senioridade VARCHAR(40),
	salario NUMERIC(16, 2)
);

/* Questão 2 - Vendas */
CREATE TABLE vendas(
	pedido_id INTEGER NOT NULL,
	produto_id INTEGER NOT NULL,
	nome_produto VARCHAR(40),
	quantidade INTEGER,
	valor_unidade NUMERIC(16, 2)
);

/* Inserindo dados na tabela Funcionários */
INSERT INTO funcionarios VALUES
	(1,'JoÃ£o Paulo','RH','Analista','Junior',2000),
(2,'LÃºcia','RH','Analista','Pleno',3000),
(3,'Rosana','RH','Analista','Senior',4000),
(4,'Elisabete','RH','Coordenador','LideranÃ§a',5000),
(5,'Amanda','RH','Gerente','GerÃªncia',7000),
(6,'Rafael','Analytics','Analista','Junior',3000),
(7,'Pedro','Analytics','Analista','Pleno',5000),
(8,'Lucas','Analytics','Analista','Pleno',5000),
(9,'Luiz AntÃ´nio','Analytics','Analista','Senior',7000),
(10,'Giovanni','Analytics','Analista','Senior',7000),
(11,'Nadia','Analytics','Coordenador','LideranÃ§a',9000),
(12,'Carmen','Analytics','Gerente','GerÃªncia',11000),
(13,'MaurÃ­cio','Dados','Analista','Pleno',5000),
(14,'Bruno Silva','Dados','Analista','Senior',8000),
(15,'Andressa','Dados','Cientista','Junior',5000),
(16,'JosÃ© de Sousa','Dados','Cientista','Junior',6500),
(17,'Helena','Dados','Cientista','Pleno',7000),
(18,'Bruna','Dados','Cientista','Pleno',7000),
(19,'Bruno Pereira','Dados','Cientista','Pleno',8000),
(20,'Bianca','Dados','Cientista','Senior',11000),
(21,'Murilo','Dados','Coordenador','LideranÃ§a',12000),
(22,'Gisele','Dados','Coordenador','LideranÃ§a',14000),
(23,'Paulo','Dados','Gerente','GerÃªncia',18000),
(24,'Wesley','Dados','Engenheiro','Junior',6000),
(25,'Vagner','Dados','Engenheiro','Pleno',9000),
(26,'LÃ©ticia','Dados','Engenheiro','Pleno',9000),
(27,'Sandro','Dados','Engenheiro','Senior',11000),
(28,'Enzo','Dados','Engenheiro','Senior',12000),
(29,'Lavinia','Dados','Engenheiro','Senior',12000),
(30,'Andrei','Dev','Engenheiro de Software','Junior',4000),
(31,'George','Dev','Engenheiro de Software','Junior',4000),
(32,'Caio','Dev','Engenheiro de Software','Pleno',5000),
(33,'Edna','Dev','Engenheiro de Software','Pleno',5000),
(34,'Debora','Dev','Engenheiro de Software','Pleno',6500),
(35,'Luiza','Dev','Engenheiro de Software','Pleno',6000),
(36,'Pedro Henrique','Dev','Engenheiro de Software','Pleno',6000),
(37,'Willian','Dev','Engenheiro de Software','Senior',7000),
(38,'Viviane','Dev','Engenheiro de Software','Senior',9000),
(39,'Mnnuel','Dev','Coordenador','LideranÃ§a',8000),
(40,'Lurdes','Dev','Coordenador','LideranÃ§a',9500),
(41,'Hygor','Dev','Gerente','GerÃªncia',10000),
(42,'Ana Paula','Financeiro','Analista','Junior',2000),
(43,'Luciana','Financeiro','Analista','Junior',2000),
(44,'Lorena','Financeiro','Analista','Junior',2500),
(45,'Sara','Financeiro','Analista','Junior',2500),
(46,'Cintia','Financeiro','Analista','Pleno',3000),
(47,'Karina','Financeiro','Analista','Pleno',3000),
(48,'Camila','Financeiro','Analista','Senior',3500),
(49,'Afonso','Financeiro','Coordenador','LideranÃ§a',4500),
(50,'Cibele','Financeiro','Gerente','GerÃªncia',5000);


/* Inserindo dados na tabela Vendas */
INSERT INTO vendas VALUES
	(1,1,'Arroz',1,22.50),
(1,2,'FeijÃ£o',1,8.90),
(1,3,'Ã“leo',2,7.50),
(1,4,'Sal',1,4.20),
(1,5,'MacarrÃ£o',2,4.50),
(2,6,'Cerveja',36,2.5),
(2,7,'Refrigerante',4,9.80),
(2,8,'Carne',2,45.00),
(2,9,'LinguiÃ§a',2,15.80),
(3,1,'Arroz',1,22.50),
(3,2,'FeijÃ£o',1,8.90),
(3,5,'MacarrÃ£o',4,4.50),
(3,10,'Molho',6,2.20),
(3,7,'Refrigerante',2,9.80),
(3,11,'Leite',12,4.60),
(4,11,'Leite',6,4.60),
(4,12,'Fralda',1,62.50),
(4,7,'Refrigerante',2,9.80),
(4,13,'Sorvete',1,25.50),
(4,5,'MacarrÃ£o',1,4.50),
(5,1,'Arroz',2,22.50),
(5,2,'FeijÃ£o',2,8.90),
(5,4,'Sal',1,4.20),
(5,14,'AÃ§Ãºcar',1,3.90),
(5,15,'CafÃ©',2,8.90),
(5,11,'Leite',12,4.60),
(5,16,'Bolacha',4,2.40),
(6,17,'Morango',1,6.20),
(6,18,'Banana',1,4.99),
(6,11,'Leite',4,4.60),
(6,14,'AÃ§Ãºcar',1,3.90),
(6,1,'Arroz',1,22.50),
(6,2,'FeijÃ£o',1,8.90),
(7,19,'Lasanha',1,8.70),
(7,10,'Molho',4,2.20),
(7,20,'Presunto',3,8.70),
(7,21,'Mussarela',3,7.30),
(7,7,'Refrigerante',1,9.80),
(7,13,'Sorvete',1,25.50),
(8,5,'MacarrÃ£o',3,4.50),
(8,3,'Ã“leo',1,7.50),
(8,4,'Sal',1,4.20),
(8,7,'Refrigerante',2,9.80),
(8,10,'Molho',2,2.20),
(9,1,'Arroz',1,22.50),
(9,2,'FeijÃ£o',1,8.90),
(9,3,'Ã“leo',1,7.50),
(9,13,'Sorvete',2,25.50),
(10,5,'MacarrÃ£o',2,4.50),
(10,10,'Molho',4,2.20),
(10,7,'Refrigerante',2,9.80),
(10,6,'Cerveja',12,2.5),
(10,8,'Carne',1,45.00),
(10,4,'Sal',1,4.20);


/*COMANDO SELECT*/
SELECT * FROM funcionarios;

SELECT 
	nome, 
	senioridade 
FROM funcionarios;

SELECT 
	salario
FROM funcionarios;

/*COMANDO LIMIT*/
SELECT *
FROM funcionarios 
LIMIT 3;

/*COMANDO ORDER BY*/
SELECT *
FROM funcionarios 
ORDER BY funcionario_id DESC
LIMIT 3;

/*COMANDO WHERE*/
SELECT *
FROM funcionarios 
WHERE funcionario_id > 40;

SELECT 
	departamento,
	salario
FROM funcionarios 
WHERE senioridade = 'Junior'
ORDER BY salario DESC;

/*COMANDO GROUP BY*/
SELECT 
	departamento,
	SUM(salario) AS total_salarios
FROM funcionarios 
GROUP BY departamento
ORDER BY departamento;

/*SEQUENCIA DE COMANDOS NO SQL
		SELECT
		FROM
		WHERE
		GROUP BY
		ORDER BY
		LIMIT
*/

SELECT 
	departamento,
	senioridade,
	AVG(salario) AS media_salarial
FROM funcionarios 
GROUP BY departamento, senioridade
ORDER BY departamento, senioridade;

/*ARREDONDANDO COM O ROUND*/
SELECT 
	departamento,
	senioridade,
	ROUND(AVG(salario),2) AS media_salarial
FROM funcionarios 
GROUP BY departamento, senioridade
ORDER BY departamento, senioridade;

/*CONTAR QTD DE SALARIOS*/
SELECT 
	departamento,
	senioridade,
	ROUND(AVG(salario),2) AS media_salarial,
	COUNT(salario) AS qtd_func
FROM funcionarios 
GROUP BY departamento, senioridade
ORDER BY departamento, senioridade;

/*SALARIO MEDIO*/
SELECT 
	departamento,
	ROUND(AVG(salario),2) AS media_salarial,
	COUNT(salario) AS qtd_func,
	ROUND(SUM(salario)/COUNT(salario), 2) AS salario_medio
FROM funcionarios 
GROUP BY departamento
ORDER BY departamento;


/*COMANDO CAST - Converte o tipo de variável*/
SELECT 
	departamento,
	senioridade,
	ROUND(AVG(CAST(salario AS NUMERIC)),2) AS media_salarial
FROM funcionarios 
GROUP BY departamento, senioridade
ORDER BY departamento, senioridade;

/* Comando DISTINCT - Trazer valores únicos */
SELECT DISTINCT senioridade
FROM funcionarios f 
