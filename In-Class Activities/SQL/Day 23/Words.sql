drop table words;

create table words (author int, word1 varchar(500), word2 varchar (500), source char(2));

select * from words where word1 = 'stone';

select * from words where author in (1,2,3,4,5,6,7,8,9,10);

select * from words where word1 = 'pie' or word2 = 'pie';

select * from words where source = 'BC' and author between 333 and 335;