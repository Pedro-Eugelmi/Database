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

-- O Banco Central de Financiamentos perdeu vários registros após uma falha no servidor que ocorreu no mês de Outubro.
-- As datas de cobrança das parcelas foram perdidas. Porém uma cópia de segurança foi encontrada contendo as informações 
--sobre as datas de pagamento das parcelas dos clientes.
-- Por tanto, o Banco pede a sua ajuda para selecionar os nomes e o dia do mês que cada cliente deve pagar sua parcela.
-- OBS: Obrigatoriamente o dia do mês precisa ser um inteiro.
SELECT name, EXTRACT(DAY FROM payday) AS dia_do_mes
FROM loan;


-- Selecione os três primeiros colocados da lista com a frase inicial Podium: 
-- e também, os dois últimos times que serão rebaixados para série B com a frase inicial Demoted:

(select position, concat('Podium: ', name) 
from league limit 3
order by position)
union all
(SELECT position, concat('Demoted: ', name) 
FROM league 
ORDER BY position DESC 
LIMIT 2);


-- Portanto, você deverá mostrar a frase 'Approved: ' junto com o nome do aluno e a sua nota, para os alunos que foram aprovados (grade ≥7).
-- Lembre-se de ordenar a lista pela maior nota.

select concat('Approved: ', name) as name, grade as grade 
from students 
where grade >= 7
order by grade DESC;

-- A sua primeira tarefa é selecionar todos os possíveis Richards das dimensões C875 e C774, 
-- junto a sua probabilidade de existência (o fator N) com a precisão de 3 casas decimais.
-- Lembre-se que (o fator N) é calculado multiplicando o valor omega por 1,618. Os dados devem ser ordenados pelo menor valor do campo omega.

SELECT
    l.name AS nome_do_richard,
    ROUND(l.omega * 1.618, 3) AS fator_N
FROM
    life_registry l
INNER JOIN dimensions d ON d.id = l.dimensions_id
WHERE
    d.name IN ('C875', 'C774')
    AND l.name LIKE '%Richard%'
ORDER BY
    l.omega ASC;



-- A Organização Mundial de Caracteres em Nomes de Pessoas (OMCNP) está fazendo um censo para saber qual é a quantidade de caracteres que as pessoas têm em seus nomes.
-- Para ajudar a OMCNP, você deve mostrar a quantidade de caracteres de cada nome em ordem decrescente pela quantidade de caracteres.

SELECT name ,LENGTH(name) AS tamanho 
FROM people 
ORDER BY tamanho desc;

-- Por tanto você deve selecionar o id, a senha atual e a senha transformada em MD5 de cada usuário na tabela account.

select id, password, MD5('MD5', password) as MD5
from  account;

-- Você está indo para uma reunião no plano Internacional de Taxas Pessoais, sua proposta é: toda pessoa com renda acima de
-- 3000 deve pagar uma taxa para o governo, essa taxa é 10% do que ela ganha.
-- Portanto, mostre o nome da pessoa e o valor que ela deve pagar para o governo com a precisão de duas casas decimais.
--Mostrar nome + salario * 10%, arredondando duas casas

SELECT name , ROUND(salary * 0.1, 02) as tax
from people
where salary > 3000


-- Os vírus estão evoluindo, porém uma nova pesquisa tem provado que trocando algumas proteínas a vacina se torna imbatível. 
-- A proteína H1 (Hemaglutinina) quando é substituída pela proteína X (Xenomorphina) tem efeitos interessantes no combate de quase todas as doenças virais. 
-- Alguns conspiracionistas dizem que após a descoberta dessa vacina algumas criaturas de 3 metros de altura foram vistas perto do laboratório,
--  mas claro, isso é mentira.
-- Portanto você deve substituir todo caractere 'H1' ( Hemaglutinina ) por 'X' ( Xenomorphina ).
SELECT REPLACE(name, 'H1', 'X')
from virus

-- O Campeonato Cearense de Futebol atrai milhares de torcedores todos os anos, 
-- você trabalha em um jornal e está encarregado de calcular a tabela de pontuação dos times.
--  Mostre uma tabela com as seguintes colunas: o nome do time, número de partidas, vitórias, derrotas, empates e pontuação. 
--  Sabendo que a pontuação é calculada com cada vitória valendo 3 pontos, empate vale 1 e derrota rende 0. 
-- No final mostre sua tabela com a pontuação ordenada do maior para o menor.

SELECT 
    t.name,
    COUNT(m.id) AS matches,
    SUM(CASE WHEN t.id = m.team_1 AND m.team_1_goals > m.team_2_goals THEN 1
             WHEN t.id = m.team_2 AND m.team_2_goals > m.team_1_goals THEN 1
             ELSE 0 END) AS victories,
    SUM(CASE WHEN t.id = m.team_1 AND m.team_1_goals < m.team_2_goals THEN 1
             WHEN t.id = m.team_2 AND m.team_2_goals < m.team_1_goals THEN 1
             ELSE 0 END) AS defeats,
    SUM(CASE WHEN m.team_1_goals = m.team_2_goals THEN 1 ELSE 0 END) AS draws,
    SUM(CASE WHEN t.id = m.team_1 AND m.team_1_goals > m.team_2_goals THEN 3
             WHEN t.id = m.team_2 AND m.team_2_goals > m.team_1_goals THEN 3
             WHEN m.team_1_goals = m.team_2_goals THEN 1
             ELSE 0 END) AS score
FROM 
    teams t
LEFT JOIN 
    matches m ON t.id IN (m.team_1, m.team_2)
GROUP BY 
    t.id, t.name
ORDER BY 
    score DESC, victories DESC, draws DESC, defeats ASC;

-- Para cada departamento, mostrar o nome do departamento, o nome de suas divisões,
--  com a respectiva média salarial e maior salário de cada divisão. 
-- O resultado deve estar em ordem decrescente usando a média salarial.
-- Dica: Você pode utilizar a função COALESCE(check_expression , 0) 
-- para substituir algum valor null por zero; Além disso, você também pode utilizar a função ROUND(value, 2) 
-- para exibir os valores com 2 casas decimais.

SELECT DEP.nome as DEPARTAMENTO, 
DIV.nome AS DIVISAO,
ROUND(COALESCE( AVG(VENC.VALOR),0),2) AS MEDIA,
ROUND(COALESCE(MAX(VENC.VALOR), 0),2) AS MAIOR 
FROM divisao DIV
JOIN 
    departamento DEP ON dep.cod_dep = div.cod_dep
JOIN 
    empregado emp ON emp.lotacao_div = div.cod_divisao
JOIN 
    emp_venc ev ON ev.matr = emp.matr
JOIN 
    vencimento venc ON venc.cod_venc = ev.cod_venc
GROUP BY DEP.nome, DIV.nome 
ORDER BY media DESC

-- Mostrar o CPF, nome dos empregados e o nome do departamento dos empregados que não trabalham em nenhum projeto. 
-- O resultado deve estar ordenado por cpf


LEFT JOIN trabalha TRAB ON EMP.cpf = TRAB.cpf_emp
JOIN projetos PROJ ON PROJ.pnumero = TRAB.pnumero 
JOIN departamento DEP ON DEP.dnumero  = PROJ.dnumero  
WHERE TRAB.cpf_emp IS NULL
ORDER BY EMP.cpf 



