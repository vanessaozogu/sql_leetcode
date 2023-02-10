# Question 1
# Creating Table
CREATE TABLE Courses (
    student VARCHAR(50),
    class VARCHAR(50)
);

# Inserting into Courses table 
INSERT INTO Courses (student, class) VALUES ('A', 'Math');
INSERT INTO Courses (student, class) VALUES ('B', 'English');
INSERT INTO Courses (student, class) VALUES ('C', 'Math');
INSERT INTO Courses (student, class) VALUES ('D', 'Biology');
INSERT INTO Courses (student, class) VALUES ('E', 'Math');
INSERT INTO Courses (student, class) VALUES ('F', 'Computer');
INSERT INTO Courses (student, class) VALUES ('G', 'Math');
INSERT INTO Courses (student, class) VALUES ('H', 'Math');
INSERT INTO Courses (student, class) VALUES ('I', 'Math');

# Leetcode solution
SELECT A.CLASS FROM
(SELECT CLASS, COUNT(STUDENT) AS Course_num FROM COURSES
GROUP BY CLASS) A
WHERE Course_num >= 5;

# Question 2
# Creating Table
CREATE TABLE Orders (
    order_number INT PRIMARY KEY,
    customer_number INT
);

# Inserting into Orders table 
INSERT INTO Orders (order_number, customer_number) VALUES (1, 1);
INSERT INTO Orders (order_number, customer_number) VALUES (2, 2);
INSERT INTO Orders (order_number, customer_number) VALUES (3, 3);
INSERT INTO Orders (order_number, customer_number) VALUES (4, 3);

# Leetcode solution
SELECT customer_number FROM
(SELECT customer_number, count(order_number) as num_order FROM Orders
GROUP BY customer_number) A
WHERE A.num_order = (SELECT max(B.num_order) from 
(SELECT customer_number, count(order_number) as num_order FROM Orders
GROUP BY customer_number) B);

# Question 3
# Creating Table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    managerId INT
);

# Inserting into Employee table 
INSERT INTO Employee (id, name, salary, managerId) VALUES (1, 'Joe', 70000,3);
INSERT INTO Employee (id, name, salary, managerId) VALUES (2, 'Henry', 80000,4);
INSERT INTO Employee (id, name, salary, managerId) VALUES (3, 'Sam', 60000, NULL);
INSERT INTO Employee (id, name, salary, managerId) VALUES (4, 'Max', 90000, NULL);

# Leetcode solution
SELECT name as Employee from Employee A
where A.salary > (select salary from Employee 
WHERE id = A.managerId);

# Question 4
# Creating Table
CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(50)
);

# Inserting into Person table 
INSERT INTO Person (id, email) VALUES (1, 'a@b.com');
INSERT INTO Person (id, email) VALUES (2, 'c@d.com');
INSERT INTO Person (id, email) VALUES (3, 'a@b.com');

# Leetcode Solution
SELECT email as Email FROM Person
group by email
having count(email)> 1;

# Question 5
# Creating Tables Customers and Orders
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT
);

# Inserting into Customers table 
INSERT INTO Customers (id, name) VALUES (1, 'Joe');
INSERT INTO Customers (id, name) VALUES (2, 'Henry');
INSERT INTO Customers (id, name) VALUES (3, 'Sam');
INSERT INTO Customers (id, name) VALUES (4, 'Max');

# Inserting into Orders table 
INSERT INTO Orders (id, name) VALUES (1, 3);
INSERT INTO Orders (id, name) VALUES (2, 1);

# Leetcode Solution
SELECT name as Customers from Customers
where id not in (SELECT customerId from Orders);

# Question 6
# Creating Table
CREATE TYPE gender AS ENUM ('f', 'm');

CREATE TABLE Salary (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    sex gender,
    salary INT
);

# Inserting into Salary table 
INSERT INTO Salary (id, name, sex, salary) VALUES (1, 'A', 'm', 2500);
INSERT INTO Salary (id, name, sex, salary) VALUES (2, 'B', 'f', 1500);
INSERT INTO Salary (id, name, sex, salary) VALUES (3, 'C', 'm', 5500);
INSERT INTO Salary (id, name, sex, salary) VALUES (4, 'D', 'f', 500);

#Leetcode Solution
UPDATE Salary
SET sex = (CASE WHEN sex ='m' THEN 'f'
            WHEN sex = 'f' THEN 'm' END);

# Question 7
# Creating Table
CREATE TABLE ActorDirector (
    actor_id INT,
    director_id INT,
    timestamp INT PRIMARY KEY
);

# Inserting into ActorDirector table 
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES (1, 1, 0);
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES (1, 1, 1);
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES (1, 1, 2);
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES (1, 2, 3);
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES (1, 2, 4);
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES (2, 1, 5);
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES (2, 1, 6);

# Leetcode Solution
SELECT actor_id, director_id FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) >=3;

# Question 8
# Creating Table
CREATE TABLE Views (
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date DATE
);

# Inserting into Views table 
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES (1, 3, 5, '2019-08-01');
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES (1, 3, 6, '2019-08-02');
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES (2, 7, 7, '2019-08-01');
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES (2, 7, 6, '2019-08-02');
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES (4, 7, 1, '2019-07-22');
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES (3, 4, 4, '2019-07-21');
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES (3, 4, 4, '2019-07-21');

# Leetcode Solution
SELECT author_id AS id FROM Views
WHERE author_id = viewer_id
GROUP BY author_id, viewer_id
ORDER BY author_id;

# Question 9
CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Rides (
    id INT PRIMARY KEY,
    user_id INT,
    distance INT
);

# Inserting into Users table 
INSERT INTO Users (id, name) VALUES (1, 'Alice');
INSERT INTO Users (id, name) VALUES (2, 'Bob');
INSERT INTO Users (id, name) VALUES (3, 'Alex');
INSERT INTO Users (id, name) VALUES (4, 'Donald');
INSERT INTO Users (id, name) VALUES (7, 'Lee');
INSERT INTO Users (id, name) VALUES (13, 'Jonathan');
INSERT INTO Users (id, name) VALUES (19, 'Elvis');

# Inserting into Rides table 
INSERT INTO Rides (id, user_id, distance) VALUES (1, 1, 120);
INSERT INTO Rides (id, user_id, distance) VALUES (2, 2, 317);
INSERT INTO Rides (id, user_id, distance) VALUES (3, 3, 222);
INSERT INTO Rides (id, user_id, distance) VALUES (4, 7, 100);
INSERT INTO Rides (id, user_id, distance) VALUES (5, 13, 312);
INSERT INTO Rides (id, user_id, distance) VALUES (6, 19, 50);
INSERT INTO Rides (id, user_id, distance) VALUES (7, 7, 120);
INSERT INTO Rides (id, user_id, distance) VALUES (8, 19, 400);
INSERT INTO Rides (id, user_id, distance) VALUES (9, 7, 230);

# Leetcode Solution
SELECT name, SUM(CASE WHEN B.distance is not null then B.distance ELSE 0 end) AS travelled_distance FROM Rides B
RIGHT join Users A
ON A.id = B.user_id
GROUP BY A.id
ORDER BY 2 DESC,1 ASC;

#Question 10
CREATE TABLE DailySales (
    date_id DATE,
    make_name VARCHAR(50),
    lead_id INT,
    partner_id INT
);

# Inserting into DailySales table 
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-8', 'toyota', 0, 1);
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-8', 'toyota', 1, );
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-8', 'toyota', 1, 2);
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-7', 'toyota', 0, 2);
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-7', 'toyota', 0, 1);
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-8', 'honda', 1, 2);
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-8', 'honda', 2, 1);
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-7', 'honda', 0, 1);
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-7', 'honda', 1, 2);
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES ('2020-12-7', 'honda', 2, 1);

# Leetcode Solution
SELECT date_id, make_name, COUNT(DISTINCT lead_id) AS unique_leads, COUNT(DISTINCT partner_id) AS unique_partners FROM DailySales
GROUP BY date_id, make_name;