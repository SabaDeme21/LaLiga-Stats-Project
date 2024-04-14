-- Create a new database named "laliga"
create database laliga;

-- Switch to using the "laliga" database
use laliga;

-- Add a new column named "Game" to the "player_stats" table after the "Sub" column
alter table player_stats
add column Game int after Sub;

-- Update the "Game" column in the "player_stats" table by adding the values of the "Start" and "Sub" columns together
update player_stats
set Game = Start + Sub;

-- Update the "Age" column in the "player_stats" table based on the season
update player_stats
set Age = 
case
	when Season = '2010/2011' then Age - 13
    when Season = '2011/2012' then Age - 12
    when Season = '2012/2013' then Age - 11
    when Season = '2013/2014' then Age - 10
    when Season = '2014/2015' then Age - 9
    when Season = '2015/2016' then Age - 8
    when Season = '2016/2017' then Age - 7
    when Season = '2017/2018' then Age - 6
    when Season = '2018/2019' then Age - 5
    when Season = '2019/2020' then Age - 4
    when Season = '2020/2021' then Age - 3
    when Season = '2021/2022' then Age - 2
    when Season = '2022/2023' then Age - 1
end;

-- Select all data from the "player_stats" table
select * from player_stats;

-- Select all data from the "player_nationality" table
select * from player_nationality;

-- Create a view named "laliga_stats" which combines data from both "player_stats" and "player_nationality" tables based on the "player" column
CREATE VIEW laliga_stats AS
SELECT player_stats.*, player_nationality.Nationality, player_nationality.Country
FROM player_stats
LEFT JOIN player_nationality ON player_stats.player = player_nationality.player;

-- Select all data from the "laliga_stats" view, which combines player statistics with their nationality information
select * from laliga_stats;
