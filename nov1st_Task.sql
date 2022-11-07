CREATE TABLE sales_data(
s_id INT PRIMARY KEY,
s_name varchar(20),
amount BIGINT,
city varchar(20)
)

insert into sales_data values (1,'Devaki',6789,'kadiri')
insert into sales_data values (2,'Meher',6000,'kadiri')
insert into sales_data values (3,'nikki',2100,'kadiri')
insert into sales_data values (4,'siri',4002,'kadiri')
insert into sales_data values (5,'raji',9004,'kadiri')

insert into sales_data values (6,'shilpa',8700,'kadapa')
insert into sales_data values (7,'chaitu',6000,'kadapa')
insert into sales_data values (8,'sai',4000,'kadapa')
insert into sales_data values (9,'madhu',8000,'kadapa')
insert into sales_data values (10,'varshi',6743,'kadapa')

insert into sales_data values (12,'megha',9100,'atp')
insert into sales_data values (13,'kajol',2301,'atp')
insert into sales_data values (14,'sarayu',1000,'atp')
insert into sales_data values (15,'suchir',3400,'atp')
insert into sales_data values (16,'varshi',7654,'atp')

select * from sales_data

CREATE OR ALTER FUNCTION sales_values(@val varchar(20))
RETURNS TABLE AS
RETURN
select city ,amount   from sales_data group by city,amount having city = @val

CREATE OR ALTER FUNCTION maxVal(@city_name varchar(20))
RETURNS @ans TABLE (amount BIGINT) AS
BEGIN

DECLARE @res TABLE (city varchar(20),Amount BIGINT)
insert into @res SELECT * FROM sales_values(@city_name)

insert into @ans SELECT AVG(Amount) from @res

 return 

END

SELECT* from maxVal('atp')

--ques 2

drop table Events_data
CREATE TABLE Events_data(
event_id INT PRIMARY KEY,
Events_name varchar(30),
event_date date,
organizer_name varchar(20),
loc varchar(50),
total_cost BIGINT
)

insert into Events_data values(100,'marriage','01-02-2022','Poojitha','Goa',900000)
insert into Events_data values(203,'Birthday party','08-04-2022','sharu','pune',40000)
insert into Events_data values(206,'engagement','09-03-2023','madhu','hyd',50000)
insert into Events_data values(209,'party','10-12-2022','prema','banglore',12000)
insert into Events_data values(108,'office party','01-01-2023','deepu','kolkata',20334)
insert into Events_data values(309,'naming ceremony','09-03-2023','nikki','kadapa',12220)

select * from Events_data

----

CREATE OR ALTER PROCEDURE display_events @e_daten date AS
BEGIN
SELECT * from Events_data where event_date = @e_daten
END
EXEC display_events '09-03-2023'

-----------

CREATE OR ALTER FUNCTION disp_Event()
RETURNS TABLE AS

RETURN 
SELECT count(Events_name) AS numofevents  from Events_data  where total_cost = (select MAX(total_cost) from Events_data)
select * from disp_Event()

----------

CREATE OR ALTER PROCEDURE display_events @location varchar(50) AS
BEGIN
SELECT * from Events_data where loc = @location
END
EXEC display_events 'Goa'