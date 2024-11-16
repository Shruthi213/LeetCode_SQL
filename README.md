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
