Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+


-- Option #1
# Write your MySQL query statement below
WITH Dif AS(
SELECT
    product_id,
    new_price,
    change_date,
    IF(DATEDIFF('2019-08-16', change_date) < 0, NULL, DATEDIFF('2019-08-16', change_date)) AS dif
FROM
    Products
),

Dif2 AS(
SELECT
    product_id,
    MIN(dif) AS diff
FROM
   Dif
 GROUP BY
    product_id
)

SELECT
    D2.product_id,
    IF(diff IS NULL, 10, new_price) AS price
FROM
    Products P
    RIGHT JOIN
        Dif2 D2
    ON P.product_id = D2.product_id
    AND change_date = DATE_SUB('2019-08-16', INTERVAL diff DAY);


-- Option #2
# Write your MySQL query statement below
WITH Dif AS(
SELECT
    product_id,
    IF(DATEDIFF('2019-08-16', change_date) < 0, NULL, DATEDIFF('2019-08-16', change_date)) AS dif
FROM
    Products
),

Dif2 AS(
SELECT
    product_id,
    MIN(dif) AS diff
FROM
   Dif
 GROUP BY
    product_id
)

SELECT
    D2.product_id,
    IF(diff IS NULL, 10, new_price) AS price
FROM
    Products P
    RIGHT JOIN
        Dif2 D2
    ON P.product_id = D2.product_id
    AND change_date = DATE_SUB('2019-08-16', INTERVAL diff DAY);


-- Option #3
# Write your MySQL query statement below
WITH Dif AS(
SELECT
    product_id,
    MIN(IF(DATEDIFF('2019-08-16', change_date) < 0, NULL, DATEDIFF('2019-08-16', change_date))) AS diff
FROM
    Products
GROUP BY
    product_id
)

SELECT
    D2.product_id,
    IF(diff IS NULL, 10, new_price) AS price
FROM
    Products P
    RIGHT JOIN
        Dif D2
    ON P.product_id = D2.product_id
    AND change_date = DATE_SUB('2019-08-16', INTERVAL diff DAY);

