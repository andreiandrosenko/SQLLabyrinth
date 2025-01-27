-- JOIN --

-- #1 just JOIN
SELECT 
 E.name AS employee_name,
 E.role employee_role,
 D.name AS department_name
FROM
  `inlaid-stratum-383516.employee_data.departments` D
  INNER JOIN
    `inlaid-stratum-383516.employee_data.employees` E
  ON E.department_id = D.department_id;


-- #2 LEFT JOIN
SELECT 
 E.name AS employee_name,
 E.role employee_role,
 D.name AS department_name
FROM
  `inlaid-stratum-383516.employee_data.employees` E
  LEFT JOIN
    `inlaid-stratum-383516.employee_data.departments` D
  ON E.department_id = D.department_id;


-- #3 RIGTH JOIN
SELECT 
 E.name AS employee_name,
 E.role employee_role,
 D.name AS department_name
FROM
  `inlaid-stratum-383516.employee_data.employees` E
  RIGHT JOIN
    `inlaid-stratum-383516.employee_data.departments` D
  ON E.department_id = D.department_id;


-- #4 FULL OUTER JOIN
SELECT 
 E.name AS employee_name,
 E.role employee_role,
 D.name AS department_name
FROM
  `inlaid-stratum-383516.employee_data.employees` E
  FULL OUTER JOIN
    `inlaid-stratum-383516.employee_data.departments` D
  ON E.department_id = D.department_id;

-- #5
SELECT
  country_name,
  S.country_code,
  value
FROM `bigquery-public-data.world_bank_intl_education.country_summary` S
  JOIN
    `bigquery-public-data.world_bank_intl_education.international_education` IE
  ON S.country_code = IE.country_code;


-- #6
SELECT
  S.region,
  SUM(IE.value) secondary_edu_population
FROM `bigquery-public-data.world_bank_intl_education.country_summary` S
  JOIN
    `bigquery-public-data.world_bank_intl_education.international_education` IE
  ON S.country_code = IE.country_code
WHERE
  S.region IS NOt NULL
  AND IE.indicator_name = 'Population of the official age for secondary education, both sexes (number)'
  AND IE.year = 2015
GROUP BY 1
ORDER BY 2 DESC


-- #7
SELECT
  S.market AS university,
  S.name AS team_name,
  M.mascot AS team_mascot,
  ROUND(AVG(S.wins),2) AS avg_wins,
  ROUND(AVG(S.losses),2) AS avg_losses,
  ROUND(AVG(S.ties),2) AS avg_ties
FROM
  `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons` S
  LEFT JOIN
    `bigquery-public-data.ncaa_basketball.mascots` M
  ON S.team_id = M.id
WHERE
  S.season BETWEEN 1990 AND 1999
  AND S.division = 1
GROUP BY 1, 2, 3
ORDER BY 4 DESC, 1;
