{{
  config(
    materialized='view'
  )
}}

SELECT
  CAST(mager9 AS INT64) AS age_group,
  CASE mager9
    WHEN 1 THEN 'Under 15'
    WHEN 2 THEN '15-19'
    WHEN 3 THEN '20-24'
    WHEN 4 THEN '25-29'
    WHEN 5 THEN '30-34'
    WHEN 6 THEN '35-39'
    WHEN 7 THEN '40-44'
    WHEN 8 THEN '45-49'
    WHEN 9 THEN '50+'
    ELSE 'Unknown'
  END AS age_group_description,
  ROUND(AVG(CAST(dbwt AS NUMERIC)), 2) AS avg_birth_weight,
  COUNT(*) AS record_count,
  ROUND(STDDEV(CAST(dbwt AS NUMERIC)), 2) AS std_dev_birth_weight,
  MIN(CAST(dbwt AS NUMERIC)) AS min_birth_weight,
  MAX(CAST(dbwt AS NUMERIC)) AS max_birth_weight
FROM {{ source('natality', 'natality_data') }}
WHERE
  mager9 IS NOT NULL
  AND dbwt IS NOT NULL
  AND CAST(dbwt AS NUMERIC) <> 9999
  AND CAST(dbwt AS NUMERIC) > 0
GROUP BY mager9
ORDER BY age_group