SELECT
region,
COUNT(DISTINCT g.user_id) AS total_users,
SUM(c.churn_flag) AS churn_users,
SAFE_DIVIDE(SUM(c.churn_flag), COUNT(DISTINCT g.user_id)) AS churn_rate
FROM user_growth_log.user_growth_log g
LEFT JOIN user_growth_log.churn_user c
ON g.user_id = c.user_id
GROUP BY region
ORDER BY churn_rate DESC