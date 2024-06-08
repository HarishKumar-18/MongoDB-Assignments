/* BY NALLAPURAYA HARISH KUMAR 21MIC0049*/

CREATE DATABASE ORG1;
SHOW DATABASES;
USE ORG1;

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
(001, 'Monika', 'Arora', 100000, '14-02-20 09:00:00', 'HR'), 
(002, 'Niharika', 'Verma', 80000, '14-06-11 09:00:00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 09:00:00', 'HR'), 
 (004, 'Amitabh', 'Singh', 500000, '14-02-20 09:00:00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09:00:00', 'Admin'),
 (006, 'Vipul', 'Diwan', 200000, '14-06-11 09:00:00', 'Account'),
( 007, 'Satish', 'Kumar', 75000, '14-01-20 09:00:00', 'Account'), 
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09:00:00', 'Admin');

select * from worker;
CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);
INSERT INTO Bonus 
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);
INSERT INTO Title 
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

/*q1*/
select first_name as worker_name from worker;

/*q2*/
select upper(first_name) from worker;

/*q3*/
select distinct(department) from worker;

/*q4*/
select substr(first_name,1,3) from worker;

/*q5*/
select locate('a', first_name) as position_of_a from worker where first_name = 'Amitabh';

/*q6*/
select distinct(department),length(department) from worker;

/*q7*/


/*q8*/


/*q9*/
select replace(first_name, 'a', 'A') as first_name from worker;

/*q10*/
select concat(first_name,' ',last_name) as complete_name from worker;

/*q11*/
select * from worker order by first_name;

/*q12*/
select * from worker order by first_name asc, department desc;

/*q13*/
select * from worker where first_name in('vipul','satish');

/*q14*/
select * from worker where first_name not in('vipul','satish');

/*q15*/
select * from worker where department="admin";

/*q16*/
select * from worker where first_name like '%a%';

/*q17*/
select * from worker where first_name like '%a';

/*q18*/
select * from worker where first_name like '%h' and length(first_name)=6;

/*q19*/
select * from worker where salary>100000 and salary<500000;

/*q20*/
select * from worker where joining_date between '2014-02-01' and '2014-02-28';

/*q21*/
select count(department) from worker where department="admin";

/*q22*/
select * from worker where salary>=50000 and salary<=100000;

/*q23*/
select department, count(department) as Total_Workers from worker group by department order by Total_Workers desc;

/*q24*/
select * from Worker w join Title t on w.worker_id = t.worker_ref_id where t.worker_title = 'Manager';

/*q25*/


/*q26*/


/*q27*/


/*q28*/
create table new_bonus_clone as select * from bonus;
select * from new_bonus_clone;

/*q29*/
select * from worker inner join bonus  on worker_id = worker_ref_id;

/*q30*/
select * from worker w left outer join bonus on worker_id = worker_ref_id;

/*q31*/
select now();

/*q32*/
select * from worker limit 10;

/*q33*/
select distinct salary from worker order by salary desc limit 1 offset 4;

/*q34*/
select distinct salary from worker w1
where 5 = (
    select count(distinct salary)
    from worker w2
    where w2.salary >= w1.salary
);

/*q35*/
select * from worker where salary in 
(
    select salary
    from Worker
    group by salary
    having count(*) > 1
);

/*q36*/
select distinct salary from worker order by salary desc limit 1 offset 1;

/*q37*/
select * from worker union all select * from worker;

/*q38*/
select * from worker w right outer join bonus on worker_id = worker_ref_id;

/*q39*/


/*q40*/
select department from worker group by department having count(department) < 5;

/*q41*/
select department, count(department) as Total_Workers from worker group by department;

/*q42*/
select * from worker order by worker_id desc limit 1;

/*q43*/
select * from worker order by worker_id asc limit 1;

/*q44*/
select * from worker order by worker_id desc limit 5;

/*q45*/
select first_name,department from worker w where salary = 
(select max(salary) from worker where department = w.department);

/*q46*/
select * from worker order by salary desc limit 3;

/*q47*/
select * from worker order by salary asc limit 3;

/*q48*/
select distinct salary as 4th_highest from worker order by salary desc limit 1 offset 3;

/*q49*/
select department, sum(salary) as total_salary from worker group by department;

/*q50*/
select first_name from worker where salary = (select max(salary) from worker);