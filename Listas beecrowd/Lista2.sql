select max(price), min(price)
from products


--Seleciona o nome da categoria e a soma das quantidades dos produtos.
SELECT category.name, SUM(product.amount) AS total_amount
--Define a tabela principal products e atribui a ela um alias product.
FROM products product
--Realiza uma junção (JOIN) com a tabela categories usando a condição que relaciona as colunas de ID de categoria.
JOIN categories category ON product.id_categories = category.id
--Agrupa os resultados por nome da categoria para calcular a soma das quantidades dentro de cada grupo.
GROUP BY category.name;


-- Na empresa que você trabalha está sendo feito um levantamento sobre os valores dos produtos que são comercializados.
-- Para ajudar o setor que está fazendo esse levantamento você deve calcular e exibir o valor médio do preço dos produtos.
-- OBS: Mostrar o valor com dois números após o ponto.

select round(AVG(price),2)
from products;