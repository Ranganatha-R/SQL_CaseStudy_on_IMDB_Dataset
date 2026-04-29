show databases;

use project_movie_database;

#Q(a)

select *
from movies;

#Q(b)
select *
from directors;

#Q(c)

select title from movies;

select count(title) from movies;
select count(*) from movies;

#Q(d)

select distinct(name) 
from directors
where director in ('James Cameron', 'Luc Besson', 'John Woo');

alter table directors rename column "name" to dir_name;

#Q(e)

select *
from directors
where "name" 
like 'S%';

 select "name" as director
from directors;

select *
from directors;

 select name
from directors;

select *
from directors
where name 
like 'S%';

#Q(d)AGAIN
select name 
from directors
where name in ('James Cameron', 'Luc Besson', 'John Woo');

#Q(F)

select count(gender)
from directors
where gender=1;

#Q(g)

select d.name 
from directors as d 
join movies as m
on d.id = m.director_id
where d.gender= '1'
order by m.release_date
limit 1 offset 9;

select d.name 
from directors as d 
join movies as m
  on d.id = m.director_id
where d.gender= '1' and m.release_date is not null
group by d.id, d.name
order by min(m.release_date)
limit 1 offset 9;

select * from directors;

select name
from directors
where gender=1
order by name
limit 15;

select name
from directors
where gender=1
order by name
limit 1 offset 9;

select d.name 
from directors as d 
join movies as m
on d.id = m.director_id
where d.gender= '1'
order by m.release_date
limit 1 offset 9;


select * from movies;

use project_movie_database;

select * from movies;

###Q(h)

select title
from movies
order by popularity desc
limit 3;

###Q(i)

select title
from movies
order by revenue desc
limit 3;

###Q(j)

select release_date 
from movies 
order by release_date asc;

select title
from movies
where year(release_date)>=2000
order by vote_average desc
limit 1;

select release_date, vote_average, title
from movies
where year(release_date)>=2000
order by vote_average desc;

###Q(k)

select m.title
from movies as m
join directors as d on m.director_id=d.id
where d.name = 'Brenda Chapman';

select name
from directors
where name='Brenda Chapman';

select m.title, d.name
from movies as m
left join directors as d on m.director_id=d.id
where d.name = (select d2.name from directors d2 where='Brenda Chapman');

select * 
from movies
where director_id in 
(select id from directors where name= 'Brenda Chapman');

select m.title, d.name
from directors d
left join movies m on m.director_id=d.id
where d.name = 'Brenda Chapman';

###Q(l)


select d.name
from directors d
join movies m on d.id=m.director_id
group by d.id, d.name
order by count(m.title) desc
limit 1;

###Q(m)


select d.name
from directors d
join movies m on d.id=m.director_id
group by d.id, d.name
order by sum(revenue) desc
limit 1;