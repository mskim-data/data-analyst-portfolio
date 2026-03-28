CREATE OR REPLACE VIEW `maple_ab.v_ab_by_segment` AS
WITH base AS (
  SELECT
    segment,
    segment_kor,
    ab_group,
    COUNT(*) AS users,
    SUM(is_payer) AS payers,
    SAFE_DIVIDE(SUM(is_payer), COUNT(*)) AS pay_cvr
  FROM `maple_ab.v_user_payment_flag`
  GROUP BY segment, segment_kor, ab_group
),
pivoted AS (
  SELECT
    segment,
    segment_kor,
    MAX(IF(ab_group='A', users, NULL)) AS users_a,
    MAX(IF(ab_group='B', users, NULL)) AS users_b,
    MAX(IF(ab_group='A', payers, NULL)) AS payers_a,
    MAX(IF(ab_group='B', payers, NULL)) AS payers_b,
    MAX(IF(ab_group='A', pay_cvr, NULL)) AS cvr_a,
    MAX(IF(ab_group='B', pay_cvr, NULL)) AS cvr_b
  FROM base
  GROUP BY segment, segment_kor
)
SELECT
  *,
  (cvr_b - cvr_a) AS uplift_abs,
  SAFE_DIVIDE((cvr_b - cvr_a), cvr_a) AS uplift_rel
FROM pivoted;
