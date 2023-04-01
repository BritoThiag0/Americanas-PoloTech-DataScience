/* Aula 04 - 09/01/2023 - Constraints */

/* Aqui veremos alguns constraints que não foram vistos anteriormente */

/* REVISÃO: Constraints
 * 
 * UNIQUE: Como o nome indica, permite somente valores únicos;
 * SERIAL: Cria uma sequência de números (1, 2, 3, 4...);
 * NOT: Constraint de negação/inversão;
 * NULL: Valores nulos;
 * NOT NULL: Valores não nulos;
 * DEFAULT: Atribuição de valores quando não informado pelo usuário;
 * CHECK: Permite a criação de condições pra inserção dos valores;
 * CHAVES: Como referenciamos determinado valor dentro de uma tabela;
 * 		- CHAVE PRIMÁRIA (PRIMARY KEY): Chave de referência da tabela
 * 		- CHAVE ESTRANGEIRA (FOREIGN KEY): Chave de "conexão" com outra tabela. Geralmente, a PK de outra tabela;
 * 
 * */

CREATE TABLE mercado(
	produto_id INTEGER UNIQUE NOT NULL,
	nome_produto VARCHAR(40),
	tipo_produto VARCHAR(40),
	estoque INTEGER CHECK(estoque > 0), --Só vai inserir na tabela se a variável vier com um valor maior que 0
	valor_produto NUMERIC(8, 2) DEFAULT 0.0
);

DROP TABLE mercado;

SELECT * FROM mercado;

INSERT INTO mercado(produto_id, nome_produto, tipo_produto, estoque, valor_produto)
	   VALUES (1, 'Pasta de dente', 'Higiene', 20, 5.50),
	   (2, 'Refrigerante', 'Bebidas', 50, 9.80),
	   (3, 'Pão de forma', 'Padaria', 4, 6.20),
	   (4, 'Batata frita', 'Congelados', 15, 17.00),
	   (5, 'Leite', 'Laticínios', 10, 8),
	   (6, 'Maçã', 'Horti-Fruti', 2, 2.73);
	  
INSERT INTO mercado (produto_id, nome_produto, tipo_produto, estoque, valor_produto)
	   VALUES (5, 'Leite', 'Laticínios');
	  
	  
-- TRABALHANDO COM CHAVES
CREATE TABLE mercado(
	produto_id INTEGER PRIMARY KEY,
	nome_produto VARCHAR(40),
	tipo_produto VARCHAR(40),
	estoque INTEGER CHECK(estoque > 0), --Só vai inserir na tabela se a variável vier com um valor maior que 0
	valor_produto NUMERIC(8, 2) DEFAULT 0.0
);

DROP TABLE mercado;
DROP TABLE vendas;

CREATE TABLE vendas2(
	venda_id INTEGER PRIMARY KEY,
	quantidade INTEGER,
	produto_id INTEGER REFERENCES "mercado" (produto_id) --Lembrar de referenciar nomes de tabelas entre aspas duplas
);
	   

/* Dicas: 
 *  
 * LIMIT: Limita o tamanho do resultado da consulta (a quantidade de linhas retornadas);
 * DISTINCT: Retorna todos os elementos distintos/únicos;
 * ORDER BY: Ordena o resultado de acordo com uma ou mais variáveis;
 * WHERE: Realiza filtros na consulta;
 * HAVING: Permite fazer filtros com funções de agregações. Um "where" pra funções de agregações;
 * GROUP BY e AGREGADORES (COUNT, MAX, MIN, SUM, AVG): Permitem diversas funções na consulta;
 *
 */

SELECT data_pedido,
	   COUNT(DISTINCT pedido_id) AS total_pedidos
FROM sales
GROUP BY 1
HAVING COUNT(DISTINCT pedido_id) > 250
ORDER BY 1;


