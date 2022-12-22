/* Comando para criar tabelas */
-- Para comentar (--) ou (/* */) ou ctrl + /
CREATE TABLE professores(
	professor_id SERIAL NOT NULL, -- Preenche sozinho
	nome VARCHAR(40),
	dominio1 VARCHAR(40),
	dominio2 VARCHAR(40),
	dominio3 VARCHAR(40)
);

/* Comando para inserir valores na tabela */
INSERT INTO professores (nome,
						 dominio1,
						 dominio2,
						 dominio3)
	 VALUES ('Sandro Saorin', 'SQL', 'Machine Learning', 'Data Science'),
	 		('André Juan', 'Estatística', 'Data Science', 'Machine Learning'),
			('Renata Marchese', 'Estatística', 'Data Science', 'Machine Learning'),
			('Larissa Moreira', 'Python', 'SQL', 'Deep Learning'),
			('Rafael Moreira', 'Power BI', 'Tableu', 'Microstrategy');
	 		 
/* Comando para excluir tabelas */
DROP TABLE professores;

/* Comando para atualizar valores na tabela*/
UPDATE professores SET professor_id = 2 WHERE nome = 'André Juan';