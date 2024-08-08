select * from curso;

select * from aluno;

 select nome, ano from curso;

5--  Apresentar o id, o nome e a carga horária onde o ano é igual a 2021 e a carga horária é menor ou igual a que 100
select id, nome, carga_horaria from curso
where ano = 2021
and carga_horaria <= 100;


6-- Buscar os cursos no qual não existe descrição cadastrada
select * from curso
where descricao IS NULL;

--   7) Buscar os cursos no qual a carga_horária esteja entre 50 e 150
select * from curso
where carga_horaria > 50 and carga_horaria < 150;



--  8) Trazer o nome e a matricula dos alunos com as matriculas 2, 5 e 8 


select nome, matricula from aluno 
where matricula in (2,5,8);


--   9) Trazer os cursos no qual o nome tem a palavra dados
select * from curso 
where  nome like '%dados%';


--     10) Trazer os alunos que possuem a letra 'a' na segunda posição do seu nome
select * from aluno
where  nome like '_O%';


--  11) Apresentar o nome e a matricula dos alunos em ordem de nome
select nome, matricula from aluno
group by nome asc;


 

-- 12) Apresentar os curso em ordem decrescente de nome



