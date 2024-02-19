create table users (
id serial primary key,
first_name varchar(30),
last_name varchar(30),
email varchar(30)
);

insert into users (first_name, last_name, email) values
('Antonella', 'Capiacci', 'antcci@hotmail.com'),
('Katherine', 'Wesler', 'katewestqgmail.com'),
('Jhon', 'Castle', 'jhcastle@gmail.com');

update users set email = 'katewest@gmail.com' where id = 2; --me equivoqué en el correo y lo corregí

select * from  users;

create table posts (
id serial primary key,
title varchar(50),
text text,
creator_id int references users(id)
);


insert into posts (title, text, creator_id) values
('El mounstruo que aterro a un país', 'Criatura de origen desconocido, fue apodado como el Chupacabras.', 3),
('La verdad sobre el fantasma de Bodega Aurrera', 'Un vigilante en la tienda de Bodega Aurrera, vió como una sombra amenazante.', 3),
('Captan fantasmas en un hospital', 'Fantasmas captados en hospitales, fotos escalofriantes tomadas por el personal del hospital.', 1),
('Fantasmas en la tienda Soriana','Un vigilante vivió una de las experiencias más espeluznantes y aterradoras de toda su vida.', 3),
('Fotografié a un fantasma por accidente', 'La historia detrás de esta fotografía te sorprenderá ya que la persona de la historia ve espíritus.', 1);

select * from posts;

create table likes (
id serial primary key,
user_id int references users(id),
post_id int references posts(id)

);

insert into likes (user_id, post_id) values
(1, 6),
(2, 7),
(3, 8),
(1, 9),
(2, 9);

select * from likes;

--Consulta que trae todos los posts y la información del usuario del campo creator_id
select * from posts inner join users
on users.id = posts.creator_id;


--Consulta que trae todos los posts, con la información de los usuarios que les dieron like.
SELECT posts.*, users.*
FROM posts
LEFT JOIN likes ON posts.id = likes.post_id
LEFT JOIN users ON likes.user_id = users.id;



