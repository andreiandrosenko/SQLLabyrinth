-- WHERE. Task #1. Big Countries
# Write your MySQL query statement below
SELECT
    name,
    population,
    area
FROM
    World
WHERE
    area >= 3000000 OR population >= 25000000;


-- WHERE. Task #2. Recyclable and Low Fat Products
# Write your MySQL query statement below
SELECT
    product_id
FROM
    Products
WHERE
    low_fats = 'Y' AND recyclable = 'Y';


-- WHERE. Task #3. Find Customer Referee
# Write your MySQL query statement below
SELECT
    name
FROM
    Customer
WHERE
    referee_id != 2 OR referee_id IS NULL;


-- WHERE. Task #4. Calculate Special Bonus
# Write your MySQL query statement below
SELECT
    employee_id,
    IF( MOD(employee_id, 2) = 0 OR name LIKE 'M%', 0, salary) AS bonus
FROM
    Employees
ORDER BY
    employee_id;


-- Task #5  Swap Salary
# Write your MySQL query statement below
UPDATE Salary
SET sex =
    CASE
        WHEN sex = 'f'
            THEN 'm'    
        ELSE 'f'
    END


-- Task #6. Article Views I
# Write your MySQL query statement below
SELECT
    DISTINCT author_id AS id
FROM
    Views
WHERE
    author_id  = viewer_id
ORDER BY
    id ASC;


-- Task #7. Daily Leads and Partners
# Write your MySQL query statement below
SELECT
    date_id,
    make_name,
    COUNT(DISTINCT lead_id) AS unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners 
FROM
    DailySales
GROUP BY
    date_id,
    make_name;


-- Task #8. Find Followers Count
# Write your MySQL query statement below
SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM
    Followers
GROUP BY
    user_id
ORDER BY
    user_id;


-- Task #9. Game Play Analysis I
# Write your MySQL query statement below
SELECT
    player_id,
    MIN(event_date) AS first_login
FROM
    Activity
GROUP BY
    player_id;


-- Task #10. Duplicate Emails
# Write your MySQL query statement below
SELECT
    email
FROM
    Person
GROUP BY
    email
    HAVING COUNT(email) > 1;


-- Task #11. Actors and Directors Who Cooperated At Least Three Times
# Write your MySQL query statement below
SELECT
    actor_id,
    director_id
FROM
    ActorDirector
GROUP BY
    actor_id, director_id
    HAVING COUNT(actor_id AND director_id) >= 3;


-- JOIN. Task #12. Customer Who Visited but Did Not Make Any Transactions
# Write your MySQL query statement below
SELECT
    customer_id,
    COUNT(T.visit_id IS NULL) AS count_no_trans
FROM
    Visits V
    LEFT JOIN
        Transactions T
    ON V.visit_id = T.visit_id
WHERE T.visit_id IS NULL
GROUP BY
    customer_id;

-- JOIN. Task #13. Combine Two Tables
# Write your MySQL query statement below
SELECT
    firstName,
    lastName,
    city,
    state
FROM
    Person P
    LEFT JOIN
        Address A
    ON P.personId = A.personId
    



