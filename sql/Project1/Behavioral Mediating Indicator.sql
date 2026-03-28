CREATE OR REPLACE VIEW `maple_ab.v_mediator_metrics` AS
WITH per_user AS (
  SELECT
    user_id,
    ab_group,
    segment,
    COUNT(*) AS attempts,
    SUM(CASE WHEN used_protection THEN 1 ELSE 0 END) AS protect_used,
    SUM(CASE WHEN result = 'destroy' THEN 1 ELSE 0 END) AS destroys,
    SUM(CASE WHEN destroy_prevented THEN 1 ELSE 0 END) AS destroys_prevented,
    SUM(meso_cost) AS meso_spent
  FROM `maple_ab.fact_starforce_attempt`
  GROUP BY user_id, ab_group, segment
)
SELECT
  ab_group,
  segment,
  COUNT(*) AS users_with_attempts,
  AVG(attempts) AS avg_attempts,
  AVG(protect_used) AS avg_protect_used,
  AVG(destroys) AS avg_destroys,
  AVG(destroys_prevented) AS avg_destroys_prevented,
  AVG(meso_spent) AS avg_meso_spent,
  SAFE_DIVIDE(SUM(protect_used), SUM(attempts)) AS protect_use_rate
FROM per_user
GROUP BY ab_group, segment;
