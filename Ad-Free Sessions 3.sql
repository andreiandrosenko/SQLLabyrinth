# Write your MySQL query statement below
SELECT
    session_id
FROM
    Playback
WHERE
    session_id NOT IN
(
SELECT
    DISTINCT session_id
FROM
    Playback P
    JOIN
        Ads A
    ON ((timestamp BETWEEN start_time AND end_time) AND (P.customer_id = A.customer_id))
);