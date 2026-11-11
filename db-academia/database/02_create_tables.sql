--Tabela de planos
CREATE TABLE tb_plano (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    duracao INT,
    nomeP VARCHAR(50) NOT NULL UNIQUE,
    valor_mensal DECIMAL(10, 2)
);

--Tabela de serviços
CREATE TABLE tb_servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    nomeS VARCHAR(50),
    descricaoS VARCHAR(200)
);

-- Relacionamento entre planos e serviços
CREATE TABLE tb_plano_servico (
    id_plano INT,
    id_servico INT,
    PRIMARY KEY (id_plano, id_servico),
    FOREIGN KEY (id_plano) REFERENCES tb_plano(id_plano),
    FOREIGN KEY (id_servico) REFERENCES tb_servico(id_servico)
);

-- Tabela de funcionários
CREATE TABLE tb_funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nomeF VARCHAR(70) NOT NULL,
    cpfF VARCHAR(14) NOT NULL UNIQUE,
    foneF VARCHAR(14),
    cargo VARCHAR(50),
    data_admissao DATE,
    salario DECIMAL(10, 2)
);

-- Tabela de instrutores
CREATE TABLE tb_instrutor (
    id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT,
    creF VARCHAR(20),
    FOREIGN KEY (id_funcionario) REFERENCES tb_funcionario(id_funcionario)
);

-- Tabela de turmas
CREATE TABLE tb_turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    nomeT VARCHAR(50),
    dia VARCHAR(20),
    hora_inicio TIME,
    hora_fim TIME,
    id_servico INT,
    id_instrutor INT,
    FOREIGN KEY (id_servico) REFERENCES tb_servico(id_servico),
    FOREIGN KEY (id_instrutor) REFERENCES tb_instrutor(id_instrutor)
);

--Tabela de clientes
CREATE TABLE tb_cliente (
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeC VARCHAR(100) NOT NULL,
    cpfC VARCHAR(20) UNIQUE NOT NULL,
    foneC VARCHAR(14),
    email VARCHAR(100)
);

-- Tabela de matrículas
CREATE TABLE tb_matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATE,
    data_fim DATE,
    status VARCHAR(20),
    id_plano INT,
    id_cliente INT,
    FOREIGN KEY (id_plano) REFERENCES tb_plano(id_plano),
    FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
);

-- Tabela de pagamentos
CREATE TABLE tb_pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    data_pagamento DATE,
    data_vencimento DATE,
    forma_pag VARCHAR(30),
    valor DECIMAL(10, 2),
    id_matricula INT,
    FOREIGN KEY (id_matricula) REFERENCES tb_matricula(id_matricula)
);

-- Tabela de avaliações físicas
CREATE TABLE tb_avaliacao_fisica (
    id_avali_fisic INT PRIMARY KEY AUTO_INCREMENT,
    dataF DATE,
    peso DECIMAL(5,2),
    altura DECIMAL(5,2),
    valorF DECIMAL(10, 2),
    forma_pag VARCHAR(30),
    observacao VARCHAR(200),
    percentual_gordura DECIMAL(5, 2),
    id_cliente INT,
    id_instrutor INT,
    FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente),
    FOREIGN KEY (id_instrutor) REFERENCES tb_instrutor(id_instrutor)
);


-- Tabela de fornecedores
CREATE TABLE tb_fornecedor (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    nomeFO VARCHAR(100),
    emailFO VARCHAR(100),
    foneFO VARCHAR(14)
);

-- Tabela de produtos
CREATE TABLE tb_produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nomePR VARCHAR(100),
    valorPR DECIMAL(10, 2),
    qnt_estoque INT,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES tb_fornecedor(id_fornecedor)
);

-- Tabela de vendas
CREATE TABLE tb_venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE,
    forma_pag VARCHAR(30),
    total DECIMAL(10, 2),
    id_funcionario INT,
    FOREIGN KEY (id_funcionario) REFERENCES tb_funcionario(id_funcionario)
);

-- Tabela de itens dos produtos vendidos
CREATE TABLE tb_item_produto (
    id_produto INT,
    id_venda INT,
    preco_unico DECIMAL(10, 2),
    quantidade INT,
    PRIMARY KEY (id_produto, id_venda),
    FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto),
    FOREIGN KEY (id_venda) REFERENCES tb_venda(id_venda)
);
