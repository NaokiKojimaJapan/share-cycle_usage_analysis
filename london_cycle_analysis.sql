-- usage count by day of week & hour
select
  extract(hour from start_date) as hour,
  countif(extract(dayofweek from start_date) = 1) as sun,
  countif(extract(dayofweek from start_date) = 2) as mon,
  countif(extract(dayofweek from start_date) = 3) as tue,
  countif(extract(dayofweek from start_date) = 4) as wed,
  countif(extract(dayofweek from start_date) = 5) as thr,
  countif(extract(dayofweek from start_date) = 6) as fri,
  countif(extract(dayofweek from start_date) = 7) as sat
from corded-observer-442016-n7.london_share_cycle.hire
group by hour
order by hour



-- avg duration by day of week & hour
select
extract(hour from start_date) as hour,
sum(case when extract(dayofweek from start_date) = 1 then duration else 0 end)/countif(extract(dayofweek from start_date) = 1) as sun,
sum(case when extract(dayofweek from start_date) = 2 then duration else 0 end)/countif(extract(dayofweek from start_date) = 2) as mon,
sum(case when extract(dayofweek from start_date) = 3 then duration else 0 end)/countif(extract(dayofweek from start_date) = 3) as tue,
sum(case when extract(dayofweek from start_date) = 4 then duration else 0 end)/countif(extract(dayofweek from start_date) = 4) as wed,
sum(case when extract(dayofweek from start_date) = 5 then duration else 0 end)/countif(extract(dayofweek from start_date) = 5) as thr,
sum(case when extract(dayofweek from start_date) = 6 then duration else 0 end)/countif(extract(dayofweek from start_date) = 6) as fri,
sum(case when extract(dayofweek from start_date) = 7 then duration else 0 end)/countif(extract(dayofweek from start_date) = 7) as sat
from corded-observer-442016-n7.london_share_cycle.hire
group by hour
order by hour



-- usage count by year
select
  countif(extract(year from start_date) = 2015) as y2015,
  countif(extract(year from start_date) = 2016) as y2016,
  countif(extract(year from start_date) = 2017) as y2017,
  countif(extract(year from start_date) = 2018) as y2018,
  countif(extract(year from start_date) = 2019) as y2019,
  countif(extract(year from start_date) = 2020) as y2020,
  countif(extract(year from start_date) = 2021) as y2021,
  countif(extract(year from start_date) = 2022) as y2022
from corded-observer-442016-n7.london_share_cycle.hire



-- usage count by month
select
  countif(extract(month from start_date) = 1) as jan,
  countif(extract(month from start_date) = 2) as feb,
  countif(extract(month from start_date) = 3) as mar,
  countif(extract(month from start_date) = 4) as apr,
  countif(extract(month from start_date) = 5) as may,
  countif(extract(month from start_date) = 6) as jun,
  countif(extract(month from start_date) = 7) as jul,
  countif(extract(month from start_date) = 8) as aug,
  countif(extract(month from start_date) = 9) as sep,
  countif(extract(month from start_date) = 10) as oct,
  countif(extract(month from start_date) = 11) as nov,
  countif(extract(month from start_date) = 12) as dec
from corded-observer-442016-n7.london_share_cycle.hire
where extract(year from start_date) <> 2023


-- usage count by year and month
select
  extract(year from start_date) as year,
  countif(extract(month from start_date) = 1) as jan,
  countif(extract(month from start_date) = 2) as feb,
  countif(extract(month from start_date) = 3) as mar,
  countif(extract(month from start_date) = 4) as apr,
  countif(extract(month from start_date) = 5) as may,
  countif(extract(month from start_date) = 6) as jun,
  countif(extract(month from start_date) = 7) as jul,
  countif(extract(month from start_date) = 8) as aug,
  countif(extract(month from start_date) = 9) as sep,
  countif(extract(month from start_date) = 10) as oct,
  countif(extract(month from start_date) = 11) as nov,
  countif(extract(month from start_date) = 12) as dec
from corded-observer-442016-n7.london_share_cycle.hire
where extract(year from start_date) <> 2023
group by year
order by year



-- usage count by weather type and month
select
  weather_code,
  countif(extract(month from start_date) = 1) as jan,
  countif(extract(month from start_date) = 2) as feb,
  countif(extract(month from start_date) = 3) as mar,
  countif(extract(month from start_date) = 4) as apr,
  countif(extract(month from start_date) = 5) as may,
  countif(extract(month from start_date) = 6) as jun,
  countif(extract(month from start_date) = 7) as jul,
  countif(extract(month from start_date) = 8) as aug,
  countif(extract(month from start_date) = 9) as sep,
  countif(extract(month from start_date) = 10) as oct,
  countif(extract(month from start_date) = 11) as nov,
  countif(extract(month from start_date) = 12) as dec
from corded-observer-442016-n7.london_share_cycle.hire as hire
inner join corded-observer-442016-n7.london_share_cycle.weather as weather
on 
  extract(year from hire.start_date) = extract(year from weather.timestamp)
  and extract(month from hire.start_date) = extract(month from weather.timestamp)
  and extract(day from hire.start_date) = extract(day from weather.timestamp)
  and extract(hour from hire.start_date) = extract(hour from weather.timestamp)
group by weather_code
order by weather_code



-- weather type count by month
select
  weather_code,
  countif(extract(month from timestamp) = 1) as jan,
  countif(extract(month from timestamp) = 2) as feb,
  countif(extract(month from timestamp) = 3) as mar,
  countif(extract(month from timestamp) = 4) as apr,
  countif(extract(month from timestamp) = 5) as may,
  countif(extract(month from timestamp) = 6) as jun,
  countif(extract(month from timestamp) = 7) as jul,
  countif(extract(month from timestamp) = 8) as aug,
  countif(extract(month from timestamp) = 9) as sep,
  countif(extract(month from timestamp) = 10) as oct,
  countif(extract(month from timestamp) = 11) as nov,
  countif(extract(month from timestamp) = 12) as dec
from corded-observer-442016-n7.london_share_cycle.weather
group by weather_code
order by weather_code



-- weather type count
select
  weather_code as weather,
  count(*) as count_hire
from corded-observer-442016-n7.london_share_cycle.weather
group by weather_code
order by weather_code



-- usage count by weather
select
  weather_code,
  count(*)
from corded-observer-442016-n7.london_share_cycle.hire as hire
inner join corded-observer-442016-n7.london_share_cycle.weather as weather
on 
  extract(year from hire.start_date) = extract(year from weather.timestamp)
  and extract(month from hire.start_date) = extract(month from weather.timestamp)
  and extract(day from hire.start_date) = extract(day from weather.timestamp)
  and extract(hour from hire.start_date) = extract(hour from weather.timestamp)
group by weather_code
order by weather_code



-- Hiring and Parking count per station joining station table
with start_counts as(
  select
    start_station_name as station_name,
    count(*) as start_count,
    latitude,
    longitude
  from corded-observer-442016-n7.london_share_cycle.hire as hire
  inner join corded-observer-442016-n7.london_share_cycle.station as station
  on hire.start_station_name = station.name
  where end_station_name is not null
  group by start_station_name, latitude, longitude),

end_counts as(
  select
    end_station_name as station_name,
    count(*) as end_count,
    latitude,
    longitude
  from corded-observer-442016-n7.london_share_cycle.hire as hire
  inner join corded-observer-442016-n7.london_share_cycle.station as station
  on hire.end_station_name = station.name
  where end_station_name is not null
  group by end_station_name, latitude, longitude)

select
  coalesce(start_counts.station_name,end_counts.station_name) as station_name,
  coalesce(start_count, 0) as start_count,
  coalesce(end_count, 0) as end_count,
  coalesce(start_count, 0) - coalesce(end_count, 0) as gap,
  coalesce(start_count, 0) / coalesce(end_count, 0) as ratio,
  coalesce(start_counts.latitude, end_counts.latitude) as latitude,
  coalesce(start_counts.longitude, end_counts.longitude) as longitude
from start_counts
full outer join end_counts
on start_counts.station_name = end_counts.station_name
order by start_counts.station_name



-- Hiring and Parking count by station, year, month, day, day of week, hour
with start_counts as(
  select 
    start_station_name as station_name,
    extract(year from start_date) as year,
    extract(month from start_date) as month,
    extract(day from start_date) as day,
    extract(dayofweek from start_date) as dayofweek,
    extract(hour from start_date) as hour,
    count(*) as start_count
  from corded-observer-442016-n7.london_share_cycle.hire
  where end_station_name is not null
  group by
    start_station_name,
    extract(year from start_date),
    extract(month from start_date),
    extract(day from start_date),
    extract(dayofweek from start_date),
    extract(hour from start_date)
),
end_counts as(
  select 
    end_station_name as station_name,
    extract(year from end_date) as year,
    extract(month from end_date) as month,
    extract(day from end_date) as day,
    extract(dayofweek from end_date) as dayofweek,
    extract(hour from end_date) as hour,
    count(*) as end_count
  from corded-observer-442016-n7.london_share_cycle.hire
  where end_station_name is not null
  group by
    end_station_name,
    extract(year from end_date),
    extract(month from end_date),
    extract(day from end_date),
    extract(dayofweek from end_date),
    extract(hour from end_date)
)
select
  coalesce(start_counts.station_name, end_counts.station_name) as station_name,
  coalesce(start_counts.year, end_counts.year) as year,
  coalesce(start_counts.month, end_counts.month) as month,
  coalesce(start_counts.day, end_counts.day) as day,
  coalesce(start_counts.dayofweek, end_counts.dayofweek) as dayofweek,
  coalesce(start_counts.hour, end_counts.hour) as hour,
  coalesce(start_count, 0) as start_count,
  coalesce(end_count, 0) as end_count,
--  coalesce(end_count, 0) - coalesce(start_count, 0) as gap_count,
--  coalesce(end_count, 0) / coalesce(nullif(start_count, 0),1) as gap_ratio
from start_counts
full outer join end_counts
on 
  start_counts.station_name = end_counts.station_name
  and start_counts.year = end_counts.year
  and start_counts.month = end_counts.month
  and start_counts.day = end_counts.day
  and start_counts.dayofweek = end_counts.dayofweek
  and start_counts.hour = end_counts.hour
where coalesce(start_counts.year, end_counts.year) = 2016
order by 
  station_name, 
--  year, 
  month, 
  day,
  dayofweek, 
  hour


-- Hiring and Parking count by station, year, month, day, day of week, hour ordered by station, year, month, day, day of week, hour
select
  counts_table.station_name,
  counts_table.year,
  counts_table.month,
  counts_table.day,
  counts_table.dayofweek,
  counts_table.hour,
  weather.weather_code,
  sum(counts_table.start_count) as start_count,
  sum(counts_table.end_count) as end_count 
from(
  with start_counts as(
    select 
      start_station_name as station_name,
      extract(year from start_date) as year,
      extract(month from start_date) as month,
      extract(day from start_date) as day,
      extract(dayofweek from start_date) as dayofweek,
      extract(hour from start_date) as hour,
      count(*) as start_count
    from corded-observer-442016-n7.london_share_cycle.hire
    where end_station_name is not null
    group by
      start_station_name,
      extract(year from start_date),
      extract(month from start_date),
      extract(day from start_date),
      extract(dayofweek from start_date),
      extract(hour from start_date)
  ),
  end_counts as(
    select 
      end_station_name as station_name,
      extract(year from end_date) as year,
      extract(month from end_date) as month,
      extract(day from end_date) as day,
      extract(dayofweek from end_date) as dayofweek,
      extract(hour from end_date) as hour,
      count(*) as end_count
    from corded-observer-442016-n7.london_share_cycle.hire
    where end_station_name is not null
    group by
      end_station_name,
      extract(year from end_date),
      extract(month from end_date),
      extract(day from end_date),
      extract(dayofweek from end_date),
      extract(hour from end_date)
  )
  select
    coalesce(start_counts.station_name, end_counts.station_name) as station_name,
    coalesce(start_counts.year, end_counts.year) as year,
    coalesce(start_counts.month, end_counts.month) as month,
    coalesce(start_counts.day, end_counts.day) as day,
    coalesce(start_counts.dayofweek, end_counts.dayofweek) as dayofweek,
    coalesce(start_counts.hour, end_counts.hour) as hour,
    coalesce(start_count, 0) as start_count,
    coalesce(end_count, 0) as end_count,
  --  coalesce(end_count, 0) - coalesce(start_count, 0) as gap_count,
  --  coalesce(end_count, 0) / coalesce(nullif(start_count, 0),1) as gap_ratio
  from start_counts
  full outer join end_counts
  on 
    start_counts.station_name = end_counts.station_name
    and start_counts.year = end_counts.year
    and start_counts.month = end_counts.month
    and start_counts.day = end_counts.day
    and start_counts.dayofweek = end_counts.dayofweek
    and start_counts.hour = end_counts.hour
  where coalesce(start_counts.year, end_counts.year) = 2016
  order by 
    station_name, 
    year, 
    month, 
    day,
    dayofweek, 
    hour
) as counts_table
inner join corded-observer-442016-n7.london_share_cycle.weather as weather
on 
  counts_table.year = extract(year from weather.timestamp)
  and counts_table.month = extract(month from weather.timestamp)
  and counts_table.day = extract(day from weather.timestamp)
  and counts_table.hour = extract(hour from weather.timestamp)
group by
  counts_table.station_name,
  counts_table.year,
  counts_table.month,
  counts_table.day,
  counts_table.dayofweek,
  counts_table.hour,
  weather.weather_code
order by
  counts_table.station_name,
  counts_table.year,
  counts_table.month,
  counts_table.day,
  counts_table.dayofweek,
  counts_table.hour,
  weather.weather_code



-- Hiring and Parking count by station, year, month, day, day of week
with start_counts as(
  select 
    start_station_name as station_name,
    extract(year from start_date) as year,
    extract(month from start_date) as month,
    extract(day from start_date) as day,
    extract(dayofweek from start_date) as dayofweek,
--    extract(hour from start_date) as hour,
    count(*) as start_count
  from corded-observer-442016-n7.london_share_cycle.hire
  where end_station_name is not null
  group by
    start_station_name,
    extract(year from start_date),
    extract(month from start_date),
    extract(day from start_date),
    extract(dayofweek from start_date)--,
--    extract(hour from start_date)
),
end_counts as(
  select 
    end_station_name as station_name,
    extract(year from end_date) as year,
    extract(month from end_date) as month,
    extract(day from end_date) as day,
    extract(dayofweek from end_date) as dayofweek,
--    extract(hour from end_date) as hour,
    count(*) as end_count
  from corded-observer-442016-n7.london_share_cycle.hire
  where end_station_name is not null
  group by
    end_station_name,
    extract(year from end_date),
    extract(month from end_date),
    extract(day from end_date),
    extract(dayofweek from end_date)--,
--    extract(hour from end_date)
)
select
  coalesce(start_counts.station_name, end_counts.station_name) as station_name,
  coalesce(start_counts.year, end_counts.year) as year,
  coalesce(start_counts.month, end_counts.month) as month,
  coalesce(start_counts.day, end_counts.day) as day,
  coalesce(start_counts.dayofweek, end_counts.dayofweek) as dayofweek,
--  coalesce(start_counts.hour, end_counts.hour) as hour,
  coalesce(start_count, 0) as start_count,
  coalesce(end_count, 0) as end_count,
--  coalesce(end_count, 0) - coalesce(start_count, 0) as gap_count,
--  coalesce(end_count, 0) / coalesce(nullif(start_count, 0),1) as gap_ratio
from start_counts
full outer join end_counts
on 
  start_counts.station_name = end_counts.station_name
  and start_counts.year = end_counts.year
  and start_counts.month = end_counts.month
  and start_counts.day = end_counts.day
  and start_counts.dayofweek = end_counts.dayofweek
--  and start_counts.hour = end_counts.hour
where coalesce(start_counts.year, end_counts.year) = 2016
order by 
  station_name, 
--  year, 
  month, 
  day,
  dayofweek--, 
--  hour


-- Hiring and Parking count by station, year, month, day, day of week, hour, joining station table to calculate exceed dock limit
select
  count_day_table.station_name,
  count_day_table.year,
  count_day_table.month,
  count_day_table.day,
  count_day_table.dayofweek,
  count_day_table.start_count,
  count_day_table.end_count,
  case
    when abs(count_day_table.end_count - count_day_table.start_count) > station.total_docks then
      case
        when count_day_table.start_count > count_day_table.end_count then
          count_day_table.end_count - count_day_table.start_count + station.total_docks
        else count_day_table.end_count - count_day_table.start_count - station.total_docks
      end
    else null
  end as exceed_dock
from(
  with start_counts as(
    select 
      start_station_name as station_name,
      extract(year from start_date) as year,
      extract(month from start_date) as month,
      extract(day from start_date) as day,
      extract(dayofweek from start_date) as dayofweek,
  --    extract(hour from start_date) as hour,
      count(*) as start_count
    from corded-observer-442016-n7.london_share_cycle.hire
    where end_station_name is not null
    group by
      start_station_name,
      extract(year from start_date),
      extract(month from start_date),
      extract(day from start_date),
      extract(dayofweek from start_date)--,
  --    extract(hour from start_date)
  ),
  end_counts as(
    select 
      end_station_name as station_name,
      extract(year from end_date) as year,
      extract(month from end_date) as month,
      extract(day from end_date) as day,
      extract(dayofweek from end_date) as dayofweek,
  --    extract(hour from end_date) as hour,
      count(*) as end_count
    from corded-observer-442016-n7.london_share_cycle.hire
    where end_station_name is not null
    group by
      end_station_name,
      extract(year from end_date),
      extract(month from end_date),
      extract(day from end_date),
      extract(dayofweek from end_date)--,
  --    extract(hour from end_date)
  )
  select
    coalesce(start_counts.station_name, end_counts.station_name) as station_name,
    coalesce(start_counts.year, end_counts.year) as year,
    coalesce(start_counts.month, end_counts.month) as month,
    coalesce(start_counts.day, end_counts.day) as day,
    coalesce(start_counts.dayofweek, end_counts.dayofweek) as dayofweek,
  --  coalesce(start_counts.hour, end_counts.hour) as hour,
    coalesce(start_count, 0) as start_count,
    coalesce(end_count, 0) as end_count,
  --  coalesce(end_count, 0) - coalesce(start_count, 0) as gap_count,
  --  coalesce(end_count, 0) / coalesce(nullif(start_count, 0),1) as gap_ratio
  from start_counts
  full outer join end_counts
  on 
    start_counts.station_name = end_counts.station_name
    and start_counts.year = end_counts.year
    and start_counts.month = end_counts.month
    and start_counts.day = end_counts.day
    and start_counts.dayofweek = end_counts.dayofweek
  --  and start_counts.hour = end_counts.hour
  where coalesce(start_counts.year, end_counts.year) = 2016
  order by 
    station_name, 
  --  year, 
    month, 
    day,
    dayofweek--, 
  --  hour
) as count_day_table
inner join corded-observer-442016-n7.london_share_cycle.station as station
on count_day_table.station_name = station.name
where
  case
    when abs(count_day_table.end_count - count_day_table.start_count) > station.total_docks then
      case
        when count_day_table.start_count > count_day_table.end_count then
          count_day_table.end_count - count_day_table.start_count + station.total_docks
        else count_day_table.end_count - count_day_table.start_count - station.total_docks
      end
    else null
  end is not null
order by
  station_name,
  year,
  month,
  day
  
-- bike type analysis (not used)
select *
from corded-observer-442016-n7.london_share_cycle.hire
where extract(year from start_date) = 2022 and (bike_model = 'PBSC_EBIKE' or bike_model = 'CLASSIC')

select bike_model, sum(duration)/count(distinct rental_id)
from corded-observer-442016-n7.london_share_cycle.hire
where extract(year from start_date) = 2022 and (bike_model = 'PBSC_EBIKE' or bike_model = 'CLASSIC')
group by bike_model