-- Use the laliga database
use laliga;

-- Select the Country column, rename it as Nationality, count the distinct Players, 
-- rename the count as Count, and select the Season column
select Country as Nationality, count(distinct(Player)) as Count, Season as Season 

-- From the laliga_stats table
from laliga_stats

-- Group the results by Country and Season
group by Country, Season

-- Order the results by Season in ascending order, 
-- and within each season, order the counts of players in descending order
order by Season asc, Count desc;
