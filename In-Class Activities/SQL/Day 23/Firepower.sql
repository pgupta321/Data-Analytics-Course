-- Drop table if exists
DROP TABLE firepower;

-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

-- Import data from firepower.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM firepower;

delete from firepower where reservepersonnel = 0;

update firepower set fighteraircraft = 1 where fighteraircraft = 0;

update firepower set totalaircraftstrength = totalaircraftstrength + 1;

select avg(totalmilitarypersonnel) as "avgmilitarypersonnel" from firepower;