CREATE OR REPLACE VIEW user_growth_log.vw_churn_user AS
SELECT
    user_id,
    MAX(log_date) AS last_login_date,
    DATE_DIFF(DATE '2025-04-30', MAX(log_date), DAY) AS days_since_last_login,
    CASE
        WHEN DATE_DIFF(DATE '2025-04-30', MAX(log_date), DAY) >= 14 THEN 1
        ELSE 0
    END AS churn_flag
FROM user_growth_log.user_growth_log
GROUP BY user_id;