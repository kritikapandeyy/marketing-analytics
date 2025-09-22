USE MarketingSEO;
GO
--------------------------------------------------
-- Determining type of traffic from campaign dataset.
CREATE OR ALTER VIEW dbo.vw_campaign_daily AS
SELECT
  c.[date], c.source, c.medium, c.campaign, c.device_category,
  CASE 
    WHEN c.medium LIKE '%cpc%' OR c.medium LIKE '%ppc%' OR c.medium LIKE '%paid%' OR c.medium LIKE '%ads%'
      OR c.source LIKE '%google ads%' OR c.source LIKE '%facebook%' OR c.source LIKE '%linkedin%' OR c.source LIKE '%bing ads%'
    THEN 'Paid'
    WHEN c.medium LIKE '%organic%' OR c.source LIKE '%organic%' THEN 'Organic'
    WHEN c.medium LIKE '%email%'   OR c.source LIKE '%email%'   THEN 'Email'
    WHEN c.medium LIKE '%referral%' OR c.source LIKE '%referral%' THEN 'Referral'
    WHEN c.medium LIKE '%social%' 
      OR c.source IN ('Facebook','Twitter','Linkedin','Instagram','Youtube','Tiktok') THEN 'Social'
    WHEN c.source LIKE '%direct%' OR c.medium IN ('(none)','none','direct') THEN 'Direct'
    ELSE 'Other'
  END AS traffic_type,
  c.sessions, c.page_views, c.conversions, c.revenue, c.session_duration, c.new_users,
  c.cvr_per_session, c.cvr_per_pageview, c.arpu, c.avg_session_duration, c.avg_pages_per_session, c.new_user_rate
FROM dbo.fact_campaign_daily c;
GO

-- Checking the result
select * from dbo.vw_campaign_daily

SELECT distinct traffic_type
FROM dbo.vw_campaign_daily;
