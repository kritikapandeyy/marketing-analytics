USE MarketingSEO;
GO

------------------------------------------
-- 7-day rolling sums by traffic_type 
-- first we create sum of diffrent campaigns then we create a rolling sum of different  traffic types with dates

WITH daily AS (
  SELECT
      [date],
      traffic_type,
      SUM(sessions)    AS sessions,
      SUM(conversions) AS conversions,
      SUM(revenue)     AS revenue
  FROM dbo.vw_campaign_daily
  GROUP BY [date], traffic_type
)
SELECT
    [date],
    traffic_type,
    SUM(conversions) OVER (
        PARTITION BY traffic_type
        ORDER BY [date]
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS conv_7d,
    SUM(revenue) OVER (
        PARTITION BY traffic_type
        ORDER BY [date]
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS revenue_7d,
    SUM(sessions) OVER (
        PARTITION BY traffic_type
        ORDER BY [date]
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS sessions_7d
FROM daily
ORDER BY traffic_type, [date];

---------------------------------------------------------------
-- getting ROI/ROAS by checking lower budget campaigns
SELECT campaign_id,
       SUM(budget) AS spend,
       SUM(revenue_generated) AS revenue,
       CASE WHEN SUM(budget) > 0 THEN SUM(revenue_generated)/SUM(budget) END AS roas
FROM fact_marketing
GROUP BY campaign_id
HAVING SUM(budget) > 1000;


