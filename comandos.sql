

-- Pegar o maior e o menor valor
select max(price), min(price)
from products

--JUNTAR DUAS TABELAS

--Seleciona o nome da categoria e a soma das quantidades dos produtos.
SELECT category.name, SUM(product.amount) AS total_amount
--Define a tabela principal products e atribui a ela um alias product.
FROM products product
--Realiza uma junção (JOIN) com a tabela categories usando a condição que relaciona as colunas de ID de categoria.
JOIN categories category ON product.id_categories = category.id
--Agrupa os resultados por nome da categoria para calcular a soma das quantidades dentro de cada grupo.
GROUP BY category.name;


--RETORNA A MÉDIA E ARREDONDA
select round(AVG(price),2)
from products;

select id, name 
where id_genres = 3
from movies


select m.id, m.name
from movies m
join prices p on m.id_prices = p.id
where p.value < 2.00


