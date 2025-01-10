# Write your MySQL query statement below
SELECT
    H.team_name AS home_team,
    A.team_name AS away_team
FROM
    Teams H
    JOIN
        Teams A
    ON H.team_name != A.team_name;