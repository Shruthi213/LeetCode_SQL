
--# LeetCode_SQL

---This Repository have Leetcode SQL Questions and answers
-### Question1:
Table: Employee
Write a solution to find managers with at least five direct reports.
Return the result table in any order.
The result format is in the following example.
#### Answer:
select name from employee
having count(ManagerID) >= 5
### Question2:
Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.
Return the result table in any order.
#### Answer:
select firstName, lastName, city, state
from Person left join Address
on Person.personId = Address.personId
### Question3
Write a solution to find the ids of products that are both low fat and recyclable.
Return the result table in any order.
The result format is in the following example.
#### Answer:
select product_id 
from Products 
where low_fats = 'Y' and recyclable = 'Y'
### Question4:
Find the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.
#### Answer:
select name from Customer
where referee_id != 2 or referee_id is null;
### Question5:
A country is big if:
it has an area of at least three million (i.e., 3000000 km2), or
it has a population of at least twenty-five million (i.e., 25000000).
Write a solution to find the name, population, and area of the big countries.
Return the result table in any order.
#### Answer:
select name, population, area
from world
where area >= 3000000 or population >= 25000000;
### Question6:
Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
Return the result table in any order.
The query result format is in the following example.
#### Answer:
select p.product_id, coalesce(round(sum(p.price*u.units)/sum(u.units), 2), 0) as average_price
from prices as p
left join unitssold as u
on p.product_id = u.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date
---Question7: Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.
-----Return the result table in any order.
-----The result format is in the following example
select activity_date as day , count(distinct user_id) as active_users
from Activity 
where datediff('2019-07-27', activity_date)<30 
and activity_date <= '2019-07-27'
group by activity_date
-----Question8:Not Boring Movies
----Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
----Return the result table ordered by rating in descending order.
----The result format is in the following example.
select * from Cinema 
where id%2 != 0 and description != 'boring'
order by rating desc
----Question9:Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
----Return the result table in any order.
----The query result format is in the following example.
select p.project_id, round(avg(e.experience_years), 2) as average_years
from project as p
join employee as e
on p.employee_id = e.employee_id
group by p.project_id ;
------Question10 :
---Write a solution to find all the authors that viewed at least one of their own articles.
---Return the result table sorted by id in ascending order.
---The result format is in the following example.
select distinct(author_id) as id
from views
where author_id = viewer_id
Order By id asc;
