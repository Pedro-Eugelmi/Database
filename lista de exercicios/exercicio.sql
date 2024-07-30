mysql -h localhost -u root

create database mercado_eugelmi;

use mercado_eugelmi;

create table fornecedor (
    codigo_fornec int NOT NULL,
    nome varchar(40) NOT NULL,
    fone varchar(20),
    endereco varchar(40),
    cidade varchar(30) default "Birigui",
    estado varchar(2) default "SP",
    primary key(codigo_fornec)
);

create table produto (
    cod_produto int AUTO_INCREMENT NOT NULL,
    nome varchar(40) NOT NULL,
    cod_fornecedor int NOT NULL,
    preco_unitario numeric(10,2),
    qtde int,
    primary key(cod_produto),
    foreign key(cod_fornecedor) references fornecedor(codigo_fornec)
);


insert into fornecedor(codigo_fornec,nome,fone,endereco, cidade,estado) 
values 
    (344, "ALIMENTOS DO BEM", "3345666", "Rua Fundadores", "São Paulo", "SP"),
    (78, "Comidas", "8664545", "Av dos Estados", "Araçatuba", "SP"),
    (952, "Rango Quente", "1327790", "av aclimação", "Birigui", "SP"),
    (111, "Quentinhas", "5644234", "rua teste", "Belo horizonte", "MG")

insert into produto (cod_produto, nome, cod_fornecedor,preco_unitario,qtde)
values 
    (1,"Arroz", 344, 20, 55),
    (2, "Feijão", 78, 16.5, 60),
    (3, "Macarrão", 78, 5, 15),
    (4, "Leite", 344, 3.5, 20),
    (5, "Farinha", 952, 5, 8)


update fornecedor
set nome = "foods"
Where codigo_fornec = 78;

alter table fornecedor add column email varchar(30);


update fornecedor 
    set email = "Alimentos@do.bem"
where codigo_fornec = 344


update fornecedor 
    set email = "quentinhas@food.com"
where codigo_fornec = 111

alter table fornecedor drop column endereco;

update produto 
    set qtde = 15
where cod_produto = 1

select * from fornecedor;

-- Buscar o nome dos produtos onde o preço seja maior que 15 reais.

select nome from produto 
where preco_unitario > 15

--  Apresentar o nome e o código dos fornecedores que são do estado de SP.
select nome, codigo_fornec from fornecedor
where estado = "SP"

-- Apresentar o nome dos produtos e o total de cada produto (preço x qtde) com o
-- nome da coluna de total.

select nome, preco_unitario * qtde as total from produto; 

--  Apresentar o código do produto, o nome do produto do fornecedor de código 78.
select nome, codigo_fornec from fornecedor 
    where codigo_fornec = 78

-- Apresentar o código e o nome dos fornecedores que possuem o código menor que
-- 100 e que seja do estado de SP.

select codigo_fornec,nome from fornecedor 
where codigo_fornec < 100 and estado = "SP"

-- Alterar na tabela produto o nome do leite para leite desnatado.
update produto
    set nome = "Leite desnatado"
where cod_produto = 4

-- Alterar a quantidade de todos os produtos subtraindo em uma unidade cada um.
update produto
    set qtde = qtde - 1

    
-- Adicionar um campo na tabela fornecedor chamado país (varchar(30)).

alter table fornecedor add column pais varchar(30);

update table fornecedor 
  set pais = "brasil";

-- k) Cadastrar um fornecedor estrangeiro.

insert into fornecedor(codigo_fornec,nome,fone, cidade,estado) 
values (655, "Health foods inc", "999888", "Austin", "TX" );

-- l) Excluir os fornecedores brasileiros que não são do estado de SP. 
delete from fornecedor 
    where pais = "brasil" and estado != "SP"

--     m) Apresentar todos os fornecedores cadastrados (só devem aparecer os do estado
-- de SP e o estrangeiro). 

select * from fornecedor


   create database empresa;

   use empresa;



    create table departamento (
        numero int NOT NULL,
        nome varchar(30),
        localizacao varchar(60),
        Primary Key(numero)
    );



   create table gerente (
        codigo int auto_increment,
        nome varchar(30),
        numDepto int NOT NULL,
        Primary Key(codigo),
        foreign key(numDepto) references departamento(numero)
   ); 




    create table empregado (
        codigo int AUTO_INCREMENT,
        nome varchar(30),
        endereco varchar(60),
        telefone varchar(10),
        data_admissao varchar(30),
        numDepto int,
        salario float,
        Primary key(codigo),
        foreign key(numDepto) references departamento(numero)
    ) 




    create table projeto (
        numero int,
        nome varchar(30),
        descricao varchar(100),
        numDepto int,
        primary key (numero),
        foreign key (numDepto) references departamento(numero)
    );



   create table trabalha_em (
    empCode int,
    numProj int,
    total_horas_semanais float,
    primary key(empCode,numProj),
    foreign key (empCode) references empregado(codigo),
    foreign key (numProj) references projeto(numero)
   );




-- Inserir dados na tabela Empregado
INSERT INTO empregado (nome, endereco, telefone, data_admissao, numDepto, salario) VALUES
('Ana Souza', 'Rua A, 123', '11987654321', '2022-01-15', 1, 1500.00),
('Carlos Silva', 'Rua B, 456', '21987654321', '2021-07-22', 2, 4000.00),
('Beatriz Oliveira', 'Rua C, 789', '31987654321', '2023-03-01', 3, 4500.00);

-- Inserir dados na tabela Projeto
INSERT INTO projeto (numero, nome, descricao, numDepto) VALUES
(101, 'Sistema de Gestão', 'Desenvolvimento de sistema para gestão de funcionários', 2),
(102, 'Reforma de Escritório', 'Reforma do escritório principal', 1),
(103, 'Campanha Publicitária', 'Criação e execução de campanha publicitária', 3);

-- Inserir dados na tabela Trabalha_Em
INSERT INTO trabalha_em (empCode, numProj, total_horas_semanais) VALUES
(1, 101, 40.0),
(2, 102, 20.0),
(3, 103, 30.0);

-- Inserir dados na tabela Gerente
INSERT INTO gerente (nome, numDepto) VALUES
('José Martins', 1),
('Fernanda Lima', 2),
('Lucas Pereira', 3);


-- a) Criar um banco chamada escritorio_SeuNome com as tabelas acima.

-- b) Cadastrar 3 registros para cada tabela, incluindo a tabela Trabalha_Em.
-- Inserir dados na tabela Departamento
INSERT INTO departamento (numero, nome, localizacao) VALUES
(1, 'Recursos Humanos', 'São Paulo'),
(2, 'Tecnologia', 'Rio de Janeiro'),
(3, 'Financeiro', 'Belo Horizonte');

-- Inserir dados na tabela Empregado
INSERT INTO empregado (nome, endereco, telefone, data_admissao, numDepto, salario) VALUES
('Ana Souza', 'Rua A, 123', '11987654321', '2022-01-15', 1, 1500.00),
('Carlos Silva', 'Rua B, 456', '21987654321', '2021-07-22', 2, 4000.00),
('Beatriz Oliveira', 'Rua C, 789', '31987654321', '2023-03-01', 3, 4500.00);

-- Inserir dados na tabela Projeto
INSERT INTO projeto (numero, nome, descricao, numDepto) VALUES
(101, 'Sistema de Gestão', 'Desenvolvimento de sistema para gestão de funcionários', 2),
(102, 'Reforma de Escritório', 'Reforma do escritório principal', 1),
(103, 'Campanha Publicitária', 'Criação e execução de campanha publicitária', 3);

INSERT INTO projeto (numero, nome, descricao, numDepto) VALUES
(105, 'Sistema de Gestão', 'Desenvolvimento de sistema para gestão de funcionários', 2),
(104, 'Reforma de Escritório', 'Reforma do escritório principal', 1),
(106, 'Campanha Publicitária', 'Criação e execução de campanha publicitária', 3)

-- Inserir dados na tabela Trabalha_Em
INSERT INTO trabalha_em (empCode, numProj, total_horas_semanais) VALUES
(1, 105, 40.0),
(2, 104, 20.0),
(3, 106, 30.0);

-- Inserir dados na tabela Gerente
INSERT INTO gerente (nome, numDepto) VALUES
('José Martins', 1),
('Fernanda Lima', 2),
('Lucas Pereira', 3);

-- c) Informe o nome e a localização de todos os departamentos.
SELECT nome, localizacao
FROM departamento;

-- d) Obtenha todos os dados dos empregados com salário superior ou igual a
-- 3000 Reais.
SELECT *
FROM empregado
WHERE salario >= 3000.00;

-- e) Apresentar o nome dos gerentes.
SELECT nome
FROM gerente;

-- f) Consultar o nome, o salário e o salário com acréscimo de 10% com nome de ‘salário
-- atualizado’ dos empregados.
SELECT nome, 
       salario AS salario_atual, 
       salario * 1.10 AS salario_com_acrescimo
FROM empregado;

-- g) Atualizar o salário, aumentando o salário de todos empregados em 10%.
UPDATE empregado
SET salario = salario * 1.10;

-- h) Incluir um campo chamado tipo_projeto (varchar(15)) na tabela projeto.
ALTER TABLE projeto
ADD tipo_projeto VARCHAR(15);

-- i) Atualizar a tabela projeto, colocando o valor ‘grande’ no campo tipo_projeto.

UPDATE projeto
SET tipo_projeto = 'grande';



