# Write your MySQL query statement below
SELECT
    product_id,
    MAX(IF(store = 'store1', price, NULL)) AS store1,
    MAX(IF(store = 'store2', price, NULL)) AS store2,
    MAX(IF(store = 'store3', price, NULL)) AS store3
FROM
    Products
GROUP BY
    product_id;