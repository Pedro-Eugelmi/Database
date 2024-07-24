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
    pais = "brasil";

-- k) Cadastrar um fornecedor estrangeiro.

insert into fornecedor(codigo_fornec,nome,fone, cidade,estado) 
values (655, "Health foods inc", "999888", "Austin", "TX" );

-- l) Excluir os fornecedores brasileiros que não são do estado de SP. 

