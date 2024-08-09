select C.id, C.name 
from customers C, locations L
where L.id != C.id;

select C.id, C.name 
from customers C 
left join locations L on C.id = L.id_customers
where L.id_customers is null
order by C.id


select Pr.name, Fr.name 
from products Pr
join providers Fr on Pr.id_providers = Fr.id
where Fr.name ='Ajax SA'

select prod.name, fornec.name, cat.name 
from products prod
join providers fornec on prod.id_providers = fornec.id 
join categories cat on  prod.id_categories = cat.id
where fornec.name ='Sansul SA'
and cat.name ='Imported';

select prod.name , fornec.name, prod.price
from products prod 
join providers fornec on prod.id_providers = fornec.id 
join categories cat on prod.id_categories = cat.id
where prod.price > 1000 
and cat.name = 'Super Luxury';

select cliente.name , pedido.id 
from customers cliente 
join orders pedido on pedido.id_customers = cliente.id 
where pedido.orders_date BETWEEN '2016-01-01' AND '2016-06-30';

select prod.name 
from products prod 
join providers fornec on prod.id_providers = fornec.id
where prod.amount between 10 and 20 
and fornec.name like 'P%';

--O setor de vendas quer fazer uma promoção para todos os clientes que são pessoas jurídicas. Para isso você deve exibir o nome dos clientes que sejam pessoa jurídica.
select cliente.name 
from customers cliente
join legal_person juridica on juridica.id_customers = cliente.id;

-- O setor de vendas precisa de um relatório para saber quais produtos estão sobrando em estoque.
-- Para você ajudar o setor de vendas, exiba o nome do produto e o nome da categoria, para os produtos cuja quantidade seja maior que 100 e o código da categoria seja 1,2,3,6 ou 9. Mostre essas informações em ordem crescente pelo código da categoria.

select  prod.name , cat.name 
from products prod 
join categories cat on prod.id_categories = cat.id 
where prod.amount > 100
and cat.id in (1,2,3,6,9)
order by cat.id asc;

-- A diretoria da empresa pediu para você um relatório simples de quantas cidades a empresa já alcançou.
-- Para fazer isso você deve exibir a quantidade de cidades distintas da tabela clientes.

select count(distinct city)
from customers;

-- Os diretores do setor de comunicação da sua empresa querem um relatório sobre os dados dos clientes físicos que estão cadastrados no banco de dados. Porem o antigo relatório teve um problema. Os dados do CPF dos clientes vieram sem a máscara.
-- Por isso seu trabalho agora é selecionar todos os CPFs de todos os clientes, e aplicar uma máscara sobre o retorno dos dados.
-- A máscara do CPF é parecida com: '000.000.000-00'.

select concat (
   SUBSTRING(cpf, 1, 3), '.',
   SUBSTRING(cpf, 4, 3), '.',
   SUBSTRING(cpf, 7, 3), '-',
   SUBSTRING(cpf, 10, 2)
) as cpf 
from natural_person;

-- O diretor da Mangojata Advogados ordenou que lhe fosse entregue um relatório sobre seus advogados atuais.
-- O diretor quer que você mostre para ele o nome do advogado que têm mais clientes, o nome do advogado que tem menos clientes e a média de clientes entre todos os advogados.
-- OBS: Antes de apresentar a média mostre um campo chamado Average a fim de deixar o relatório mais apresentável. A média deverá ser apresentada em inteiros.

-- Encontrar o advogado com o maior número de clientes
(SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MAX(customers_number) FROM lawyers))

UNION ALL

-- Encontrar o advogado com o menor número de clientes
(SELECT
    name,
    customers_number
FROM lawyers
WHERE customers_number = (SELECT MIN(customers_number) FROM lawyers))

UNION ALL

-- Calcular a média de clientes e formatar o resultado
SELECT
    'Average' AS name,
    FLOOR(AVG(customers_number)) AS customers_number
FROM lawyers;

-- A Universidade Tecnológica de Marte está com seu concurso aberto para Pesquisadores. 
-- Porém o computador que processava os dados dos candidatos estragou. Você deve mostrar a lista dos candidatos, contendo o nome do candidato e a sua pontuação final (com duas casas decimais após a vírgula).
--  Lembre-se de mostrar a lista ordenada pela pontuação do candidato (maior pontuação no topo da lista).
-- A pontuação do candidato é o resultado da média ponderada descrita abaixo:

select candidate.name, ROUND(((score.math * 2) + (score.specific * 3) + (score.project_plan * 5)) / 10, 2) AS pontuacao_final
from candidate
inner join score on score.candidate_id = candidate.id 
order by pontuacao_final desc;