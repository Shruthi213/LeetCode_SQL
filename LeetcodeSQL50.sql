
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
-----Question 11: Replace Employee ID With The Unique Identifier
-----Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null. Return the result table in any order. The result format is in the following example.
select unique_id, name
from Employees as emp
left join employeeuni as uni
on emp.id = uni.id
### Question 12: Average Selling Price
---Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.
---Return the result table in any order.
---The result format is in the following example.
select p.product_id, coalesce(round(sum(p.price*u.units)/sum(u.units), 2), 0) as average_price
from prices as p
left join unitssold as u
on p.product_id = u.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date
group by p.product_id
order by product_id
### Question 13: Second Highest Salary
----Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas)
select Max(distinct salary) as SecondHighestSalary
from Employee
where salary < (select Max(salary) from Employee)
### Question 14:Rank Scores
---Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:
---The scores should be ranked from the highest to the lowest.
---If there is a tie between two scores, both should have the same ranking.
---After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
---Return the result table ordered by score in descending order.
# Write your MySQL query statement below
select score ,
dense_rank() over(Order By score desc) 'rank'
from Scores
### Question 15:Consecutive Numbers
---Find all numbers that appear at least three times consecutively.
---Return the result table in any order.
---The result format is in the following example.
select distinct l1.num as ConsecutiveNums
from Logs l1, Logs l2, Logs l3
where l1.num = l2.num and l2.num = l3.num
and l1.id = l2.id -1
and l1.id = l3.id -2
###Question 16: Department Highest Salary
--- Write a solution to find employees who have the highest salary in each of the departments.
---Return the result table in any order.
---The result format is in the following example.  
select d.name as Department, e.name as Employee ,e.salary as Salary
from Employee e
join Department d
on e.departmentId = d.id
where (d.id, e.salary) in (SELECT DepartmentId, max(Salary)
from Employee
group by DepartmentID)
### Question 17: Game Play Analysis IV
---Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.
---The result format is in the following example.
with cte as (select player_id, min(event_date) as First_loggin
from Activity
group by player_id)
select round(1.0*SUM(CASE WHEN DATEDIFF(day, First_loggin, event_date) = 1 THEN 1 ELSE 0 END) /
Count(distinct A.player_id), 2) as fraction
from Activity as A 
inner join cte as c
on A.player_id = c.player_id
### Question 18: Managers with at Least 5 Direct Reports
--Write a solution to find managers with at least five direct reports.
--Return the result table in any order.The result format is in the following example.
select name from Employee
where id in (select managerId from Employee group by managerID having Count(*) >= 5)
### Question 19: Investments in 2016
--Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
--have the same tiv_2015 value as one or more other policyholders, and
--are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
--Round tiv_2016 to two decimal places.
--The result format is in the following example.
# Write your MySQL query statement below
select round(sum(tiv_2016), 2) as tiv_2016
from 
(select tiv_2016,
count(*) over(partition by tiv_2015) as condition1,
count(*) over(partition by lat, lon) as condition2
from Insurance) as subquery
where condition1 > 1 and condition2 = 1
### Question 20 : Friend Requests II: Who Has the Most Friends
--Write a solution to find the people who have the most friends and the most friends number.
--The test cases are generated so that only one person has the most friends.
--The result format is in the following example.
select id, sum(num) as num
from (
    select requester_id as id ,
    count(*) as num 
    from RequestAccepted
    group by requester_id

    Union all

    select accepter_id as id ,
    count(*) as num 
    from RequestAccepted
    group by accepter_id) as subquery 
group by id
order by num desc
limit 1

