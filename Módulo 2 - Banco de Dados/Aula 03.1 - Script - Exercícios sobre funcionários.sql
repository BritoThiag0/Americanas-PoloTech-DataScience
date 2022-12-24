/* Aula 03 - 23/12/2022 - Exercícios sobre funcionários */
SELECT *
FROM vendas

--> tabela vendas
-- Calcule quantos produtos distintos tem por pedido?
SELECT pedido_id,
	   COUNT(produto_id) AS qtd_produtos
FROM vendas
GROUP BY pedido_id
ORDER BY qtd_produtos DESC;

--> tabela funcionarios
SELECT *
FROM funcionarios;

-- Calcule o total de salario por departamento mas apenas com senioridade Liderança e Gerência
SELECT departamento,
	   SUM(salario) AS dept_salario_total
FROM funcionarios
WHERE senioridade IN ('Liderança', 'Gerência')
GROUP BY departamento;

-- Calcule quantos funcionarios tem por departamento
SELECT departamento,
	   COUNT(nome) AS qtd_funcionarios 
FROM funcionarios
GROUP BY departamento
ORDER BY 1;

-- Calcule quantos funcionarios tem por senioridade
SELECT senioridade,
	   COUNT(nome) AS qtd_funcionarios
FROM funcionarios
GROUP BY senioridade;
