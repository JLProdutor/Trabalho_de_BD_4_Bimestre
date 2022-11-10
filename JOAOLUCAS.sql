/*Trabalho de 2 Pontos - Banco de Dados - 10/11/2022 - João Lucas Lima Alexandre*/



/*Tabela para os usuários*/
create table user(
id_user int auto_increment primary key,
name varchar(50) not null,
birth date,
sex enum('M','F'),
weight decimal (5,2),
height decimal(3,2)
);

/*Valores da tabela usuários*/
insert into user
(name, birth, sex, weight, height)
values
('Joao', '2006-07-02', 'M', '69.2', '1.76'),
('Lucas', '2000-10-16', 'M', '75.0', '1.85'),
('Alexandre', '1980-05-7', 'M', '87.6', '1.86'),
('Leticia', '2005-03-27', 'F', '74.3', '1.70'),
('Luiz', '2004-06-16', 'M', '82.7', '1.83');

/*Selecionar a tabela dos usuários para verificar se os dados estão corretos*/
select * from user;

/*Tabela para os cargos/posições*/
create table roles(
id_roles int auto_increment primary key,
access varchar(16) not null
);

/*Valores da tabela doa cargos/posições*/
insert into roles
(access)
values
("Admin"),
("Employee"),
("Cient");

/*Tabela para definir o relacionamento entre os usuários e os cargos*/
create table user_roles(
id_user int,
id_roles int,
foreign key(id_user) references user(id_user),
foreign key(id_roles) references roles(id_roles)
);

/*Definir os relacionamentos dos usuários e os cargos*/
insert into user_roles
(id_user, id_roles)
values
(1, 1),
(1, 3),
(2, 2),
(2, 3),
(3, 2),
(4, 3),
(5, 3);

/*Tabela para post's*/
create table post(
id_post int auto_increment primary key,
title varchar(50),
description text,
id_user int,
foreign key(id_user) references user(id_user)
);

/*Valores da tabela de post's*/
insert into post
(id_user, title, description)
values
(1,'O que gosto de fazer?', 'Gosto de jogar videogames'),
(1,'Como me sinto fazendo isso?', 'Me sinto bem, pois isso me ajuda a desestressar'),
(2,'O que gosto de fazer?', 'Gosto de interagir com minha namorada'),
(2,'Como me sinto fazendo isso?', 'Me sinto incrível! Ela é muito especial para mim, fazer qualquer coisa com ela me faz bem'),
(3,'O que gosto de fazer?', 'Gosto de sair com meus melhores amigos'),
(3,'Como me sinto fazendo isso?', 'Sair com eles é muito divertido, é muito legal ter um momento com eles'),
(4,'O que gosto de fazer?', 'Gosto de ir à igreja'),
(4,'Como me sinto fazendo isso?', 'Me sinto bem, pois aquele ambiente é agradável para mim'),
(5,'O que gosto de fazer?', 'Gosto de assistir animes'),
(5,'Como me sinto fazendo isso?', 'Me sinto entretido e me divirto bastante');



/*TAREFA*/
/*1 - Selecionar os post's dos usuários 3 e 5*/
select * from post where id_user = 3;
select * from post where id_user = 5;

/*2 - Deletar os dados do usuário 2*/
delete from post where id_user = 2;
delete from user_roles where id_user = 2;
delete from user where id_user = 2;

/*3 - Apagar os post's do usuário 4*/
delete * from post where id_user = 4;

/*4 - Atualizar o post do usuário 1*/
update post set description = 'Gosto de escutar música' where id_user = '1' limit 1;

/*5 - Selecionar apenas os dados dos "Admins"*/
select user.id, user.nome, roles.nome, from user_roles
join user on user.id_user = user_roles.id_user
join roles on roles.id_role = user_roles.id_roles
where roles.name = 'admin';



/*COMANDOS AUXILIARES(EXTRAS) - Comandos para reorganizar e verificar o código*/
select * from user;
delete from user;
delete from post;
drop table user;
drop table roles;
drop table user_roles;
drop table post;
)