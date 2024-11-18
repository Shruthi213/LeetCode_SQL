# LeetCode_SQL
This Repository have Leetcode SQL Questions and answers
### Question1:
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
