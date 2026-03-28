WITH stagnation_user AS (

SELECT
user_id,
MAX(days_since_last_levelup) AS max_stagnation
FROM user_growth_log.user_growth_log
GROUP BY user_id

)

SELECT

CASE
WHEN max_stagnation >= 5 THEN 'Stagnated'
ELSE 'Normal'
END AS stagnation_group,

COUNT(*) AS users,
SUM(c.churn_flag) AS churn_users,
SAFE_DIVIDE(SUM(c.churn_flag), COUNT(*)) AS churn_rate

FROM stagnation_user s
JOIN user_growth_log.churn_user c
ON s.user_id = c.user_id

GROUP BY stagnation_group