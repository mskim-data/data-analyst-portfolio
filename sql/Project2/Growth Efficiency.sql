WITH efficiency_segment AS (

SELECT
user_id,
AVG(growth_efficiency) AS avg_efficiency
FROM user_growth_log.user_growth_log
GROUP BY user_id

)

SELECT
CASE
WHEN avg_efficiency >= 300000000 THEN 'High'
WHEN avg_efficiency >= 200000000 THEN 'Medium'
ELSE 'Low'
END AS efficiency_group,
COUNT(*) AS users,
SUM(c.churn_flag) AS churn_users,
SAFE_DIVIDE(SUM(c.churn_flag), COUNT(*)) AS churn_rate
FROM efficiency_segment e
JOIN user_growth_log.churn_user c
ON e.user_id = c.user_id
GROUP BY efficiency_group