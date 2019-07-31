-- Create tables and import data
-- Drop table if exists
DROP TABLE IF EXISTS players;

-- Create new table
CREATE TABLE players (
  id INT,
  player VARCHAR,
  height INT,
  weight INT,
  college VARCHAR,
  born INT,
  birth_city VARCHAR,
  birth_state VARCHAR
);

-- Verify successful data import
SELECT * FROM players;

-- Drop if exists
DROP TABLE IF EXISTS seasons_stats;

-- Create new table
CREATE TABLE seasons_stats (
  player_id INT,
  year DEC,
  position VARCHAR,
  age DEC,
  Tm VARCHAR,
  G VARCHAR,
  TS_Percentage DEC,
  FTr DEC,
  OWS DEC,
  DWS DEC,
  WS DEC,
  FG DEC,
  FGA DEC,
  FG_Percentage DEC,
  Two_Points DEC,
  Two_PA DEC,
  Two_Point_Percentage DEC,
  eFG_Percentage DEC,
  FT DEC,
  FTA DEC,
  FT_Percentage DEC,
  AST DEC,
  PF DEC,
  PTS DEC
);

-- Verify successful data import
SELECT * FROM seasons_stats;

select pl.id, pl.player, pl.height, pl.height, pl.college, pl.born, ss.position, ss.tm
from players as pl
join seasons_stats as ss
on pl.id = ss.player_id;

select ss.player_id, pl.college, ss.year, ss.position, ss.two_point_percentage, ss.fg_percentage, 
ss.ft_percentage, ss.ts_percentage
from seasons_stats as ss
join players as pl
on pl.id = ss.player_id;
