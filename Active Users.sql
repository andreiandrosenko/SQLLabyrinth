# Write your MySQL query statement below
WITH CTE AS(
SELECT
    A.id,
    Accounts.name,
    login_date,
    ROW_NUMBER() OVER (PARTITION BY A.id ORDER BY login_date) AS order_id,
    DATE_SUB(login_date, INTERVAL ROW_NUMBER()
    OVER (PARTITION BY A.id ORDER BY login_date) DAY ) AS 'order'
FROM
    (SELECT
        *
    FROM
        Logins
    GROUP BY
        id,
        login_date) A
    LEFT JOIN Accounts
    ON A.id = Accounts.id
    )

SELECT
    DISTINCT
        CTE.id,
        CTE.name
from
    CTE
GROUP BY
    CTE.id,
    CTE.order
    HAVING COUNT(CTE.order) >= 5;