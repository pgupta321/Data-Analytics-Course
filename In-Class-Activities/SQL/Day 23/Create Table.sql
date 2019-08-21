create table cities (city varchar(30), state varchar(30), population int);

insert into cities values ('Alameda', 'California', 79177);
insert into cities values ('Mesa', 'Arizona', 496401);
insert into cities values ('Boerne', 'Texas', 16056);
insert into cities values ('Anaheim', 'California', 352497);
insert into cities values ('Tucson', 'Arizona', 535677);
insert into cities values ('Garland', 'Texas', 238002);

select * from cities;

select city from cities;

select * from cities where population < 100000 and state = 'California';

-- this is a comment

