CREATE TABLE child_labor (
	country varchar(50) PRIMARY KEY,
  	total_percent int,
  	male_percent int,
	female_percent int
);

CREATE TABLE education (
  	iso3_code char(3) PRIMARY KEY,
  	country varchar(50),
  	total_percent int,
  	male_percent int,
	female_percent int
);

create table gdp (
	iso3_code char(3) primary key,
	country varchar(100),
	"2008" float,
	"2009" float,
	"2010" float,
	"2011" float,
	"2012" float,
	"2013" float,
	"2014" float,
	"2015" float,
	"2016" float,
	"2017" float,
	avg_gdp float);