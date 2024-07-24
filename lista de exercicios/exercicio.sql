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
