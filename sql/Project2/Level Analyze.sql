SELECT
level,
exp_required,
SAFE_DIVIDE(
exp_required,
LAG(exp_required) OVER (ORDER BY level)
) AS exp_growth_ratio
FROM user_growth_log.level_exp_table
ORDER BY level