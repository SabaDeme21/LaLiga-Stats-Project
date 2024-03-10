create database La_Liga;

use La_Liga;

alter table laliga_stats
change column ï»¿Player Player varchar(50);

alter table laliga_stats
add column Age int after Player;

update laliga_stats
set Age = substring_index(Player, " ", -1);

update laliga_stats
set Player = substring(Player, 1, char_length(Player)-2);

update laliga_stats
set Position = 'Goalkeeper'
where 
	Position = '  GK' or
	Position = '  Goalkeeper';
    
update laliga_stats
set Position = 'Midfielder'
where
	Position = '  M' or
    Position = '  AM' or
    Position = '  DMC' or
    Position = '  Midfielder';
    
update laliga_stats
set Position = 'Defender'
where
	Position = '  D' or
    Position = '  Defender';
    
update laliga_stats
set Position = 'Forward'
where
	Position = '  FW' or
    Position = '  Forward';

update laliga_stats
set Age = Age - 10;

alter table laliga_stats
change column Season Season varchar(50) first;

alter table laliga_stats
change column Team Team varchar(50) after Season;

select * from laliga_stats;

select distinct(Position) from laliga_stats;
