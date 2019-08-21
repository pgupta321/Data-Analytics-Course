create table programming_languages (id serial primary key, language varchar (20), rating int);

insert into programming_languages (language, rating)
values ('HTML', 95), ('JS', 99), ('JQuery', 98), ('MySQL', 70), ('MySQL', 70);

select * from programming_languages;

delete from programming_languages where id = 5;
update programming_languages set language = 'JavaScript' where language = 'JS';
update programming_languages set rating = 90 where language = 'HTML';

alter table programming_languages add mastered bool default true;

select * from programming_languages order by id;

