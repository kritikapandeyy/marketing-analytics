USE MarketingSEO;
GO

-------------------------------------------------------------
-- Understanding intent behind the keywords searched
SELECT intent,
       COUNT(*) AS keywords,
       AVG(search_volume) AS avg_search_volume,
       AVG(cpc) AS avg_cpc,
       AVG(score) AS avg_difficulty,
       AVG(opp_score) AS avg_opp_score
FROM fact_seo
GROUP BY intent
ORDER BY avg_opp_score DESC;