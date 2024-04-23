use laliga;

select Country as Nationality, count(distinct(Player)) as Count from laliga_stats
group by Country
order by Count desc;
