show tables;

create table crime(
	idx		int not null auto_increment primary key,
	year	int,						/*범죄발생년도*/
	police	varchar(20) not null,		/*경찰서명*/
	robbery	int,						/*강도*/
	murder	int,						/*살인*/
	theft	int,						/*절도*/
	violence int						/*폭력*/
);

desc crime;

select * from crime;

select *,year,count(*) from crime group by year;
select *,year,count(*) from crime where year=2022;
select *,year,count(*) from crime group by year having year=2022;

select * from crime where year=2022 and police like '%충북%' group by year,police having police='충북청주상당서' order by year;

select year,sum(robbery) as totRobbery,sum(murder) as totMurder,sum(theft) as totTheft,sum(violence) as totViolence,
    avg(robbery) as avgRobbery,avg(murder) as avgMurder,avg(theft) as avgTheft,avg(violence) as avgViolence
    from crime where year = 2022;
    
    