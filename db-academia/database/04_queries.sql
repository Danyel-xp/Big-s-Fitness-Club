-- Clientes
SELECT * 
FROM tb_cliente;

-- Produtos
SELECT nomePR
FROM tb_produto

-- Apenas o nome, telefone e e-mail dos clientes
SELECT nomeC AS 'CLIENTE', foneC AS 'TELEFONE', email AS 'EMAIL'
FROM tb_cliente
ORDER BY nomeC ASC;

-- Lista todos os nomes e salarios dos funcionarios em ordem crescente
SELECT nomeF, salario
FROM tb_funcionario
ORDER BY salario ASC;

-- Lista todos os funcionarios que trabalham como INSTRUTORES
SELECT nomeF AS 'INSTRUTORES'
FROm tb_funcionario
WHERE cargo = 'Instrutor';

-- Lista produtos com preço acima de R$50,00
SELECT nomePR AS 'PRODUTO'
FROM tb_produto
WHERE valorPR > 50;

-- Lista funcionarios que recebem entre R$2.500 e R$3.000
SELECT nomeF AS 'FUNCIONARIOS'
FROM tb_funcionario
WHERE salario  BETWEEN 2500 and 3000;

-- Liste o nome dos funcionarios que trabalham como ATENDENTE
SELECT nomeF AS 'ANTENDENTES'
FROM tb_funcionario
WHERE cargo in ('Atendente');

-- Lista os clientes que começam com a letra D
SELECT nomeC
FROM tb_cliente
WHERE nomeC LIKE 'D%';

-- Lista todos os produtos que são menor ou iguais a 5 unidades
SELECT nomePR AS 'PRODUTO'
FROM tb_produto
WHERE qnt_estoque BETWEEN 0 and 5;


-- Liste todos os funcionarios que recebem mais de R$2.500
SELECT nomeF AS 'FUNCIONARIOS'
FROM tb_funcionario
WHERE salario > 2500

-- Lista clientes que possuem e-mail e telefone cadastrados
SELECT nomeC AS 'CLIENTE'
FROM tb_cliente
WHERE email IS NOT NULL
AND foneC IS NOT NULL;

-- Lista  o total de clientes
SELECT count(*) AS 'TOTAL DE CLIENTES'
FROM tb_cliente;

-- Calcular a media sálarial de totos os funcionairos 
SELECT cargo AS 'CARGO', ROUND(AVG(salario),2) AS 'SALÁRIO'
FROM tb_funcionario
GROUP BY cargo

-- Lista o produto mais caro e o mais barato
SELECT nomePR AS 'PRODUTO', valorPR AS 'PREÇO'
FROM tb_produto
ORDER BY valorPR DESC LIMIT 1;

SELECT nomePR AS 'PRODUTO', valorPR AS 'PREÇO'
FROM tb_produto
ORDER BY valorPR ASC LIMIT 1;

-- Calcula o valor total de todos os produtos
SELECT SUM(valorPR) AS 'SOMA DE TODOS OS PRODUTOS'
FROM tb_produto
WHERE nomePR IS NOT NULL AND valorPR IS NOT NULL

-- Lista quantos funcionários existem em cada cargo.
SELECT cargo AS 'CARGO', COUNT(*) AS 'TOTAL'
FROM tb_funcionario
GROUP BY cargo;

-- Calcule a média salarial de cada cargo.
SELECT cargo AS 'CARGO', ROUND(AVG(salario),2) AS 'SALARIO'
FROM tb_funcionario
GROUP BY cargo;

-- Lista quantas matrículas existem para cada status.
SELECT status AS 'STATUS', COUNT(status) AS 'TOTAL'
FROM tb_matricula
GROUP BY status

-- Mostra o faturamento total agrupado por forma de pagamento
SELECT forma_pag, ROUND(SUM(valor),2)
FROM tb_pagamento
GROUP BY forma_pag

-- Lista os clientes juntamente com os planos que contrataram
SELECT tb_cliente.nomeC AS 'CLINTE' ,tb_plano.nomeP AS 'PLANO'
FROM tb_cliente INNER JOIN tb_matricula
ON tb_cliente.id_cliente = tb_matricula.id_cliente
INNER JOIN tb_plano 
ON tb_matricula.id_plano = tb_plano.id_plano
ORDER BY tb_cliente.nomeC ASC;


-- Lista todos os instrutores, exibindo seus nomes, cargos e registros CREF
SELECT tb_funcionario.nomeF AS 'NOME', tb_funcionario.cargo AS 'CARGO', tb_instrutor.creF AS 'REGISTRO'
FROM tb_funcionario INNER JOIN tb_instrutor
ON tb_funcionario.id_funcionario = tb_instrutor.id_funcionario;

-- Mostra quais serviços estão disponíveis em cada plano.
SELECT tb_servico.nomeS AS 'SERVIÇO', tb_plano.nomeP AS 'PLANOS'
FROM tb_servico INNER JOIN tb_plano_servico 
ON tb_servico.id_servico = tb_plano_servico.id_servico
INNER JOIN tb_plano
ON tb_plano_servico.id_plano = tb_plano.id_plano

-- Liste todas as turmas, mostrando o nome da turma, o serviço oferecido e o instrutor responsável
SELECT tb_turma.nomeT AS 'TURMA', tb_servico.nomeS AS 'SERVIÇO', tb_funcionario.nomeF
FROM tb_turma INNER JOIN tb_servico
ON tb_turma.id_servico = tb_servico.id_servico
INNER JOIN tb_instrutor
ON tb_turma.id_instrutor = tb_instrutor.id_instrutor
INNER JOIN tb_funcionario
ON tb_instrutor.id_funcionario = tb_funcionario.id_funcionario

-- Mostra os clientes e o status de sua matrula
SELECT tb_cliente.nomeC AS 'NOME', tb_matricula.status AS 'STATUS'
FROM tb_cliente LEFT JOIN tb_matricula
ON tb_cliente.id_cliente = tb_matricula.id_cliente
ORDER BY tb_cliente.nomeC ASC;

-- Lista as vendas realizadas, exibindo o nome do funcionário responsável e o valor total de cada venda.
SELECT tb_venda.id_venda AS 'ID VENDA', tb_funcionario.nomeF AS 'FUNCIONARIO', tb_venda.total AS 'TOTAL'
FROM tb_funcionario INNER JOIN tb_venda
ON tb_funcionario.id_funcionario = tb_venda.id_funcionario

-- FUNÇÕES

-- mostra o nome de todos os clientes
SELECT listarNomeCliente() AS 'CLIENTES';

-- Lista todas as informações do cliente aparti do ID
SELECT clienteId(3) AS 'CLIENTE'

-- Lista o nome do funcionario, de acordo com o cargo 
SELECT funcionarioCargo('Instrutor') AS 'INSTRUTOR';

