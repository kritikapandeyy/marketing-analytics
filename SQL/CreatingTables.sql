-- create a working database
CREATE DATABASE MarketingSEO;
GO
USE MarketingSEO;
GO

-- PART I - CREATING TABLES 
------------------------------------------
-- Marketing KPIs  (marketing_kpi.csv)

IF OBJECT_ID('dbo.fact_marketing', 'U') IS NOT NULL DROP TABLE dbo.fact_marketing;
CREATE TABLE dbo.fact_marketing (
  campaign_id                         VARCHAR(50)    NULL,
  product_id                          VARCHAR(50)    NULL,
  budget                              DECIMAL(18,2)  NULL,
  clicks                              INT            NULL,
  conversions                         INT            NULL,
  revenue_generated                   DECIMAL(18,2)  NULL,
  roi                                 DECIMAL(18,6)  NULL,  
  customer_id                         VARCHAR(50)    NULL,
  subscription_tier                   VARCHAR(30)    NULL,
  subscription_length                 INT            NULL,
  flash_sale_id                       VARCHAR(50)    NULL,
  discount_level                      INT            NULL,
  units_sold                          INT            NULL,
  bundle_id                           VARCHAR(50)    NULL,
  bundle_price                        DECIMAL(18,2)  NULL,
  customer_satisfaction_post_refund   INT            NULL,
  common_keywords                     VARCHAR(200)   NULL,
  roas                                DECIMAL(18,6)  NULL,
  roi_recalc                          DECIMAL(18,6)  NULL,
  cpc                                 DECIMAL(18,6)  NULL,
  cpa                                 DECIMAL(18,6)  NULL,
  conversion_rate                     DECIMAL(18,6)  NULL,
  revenue_per_click                   DECIMAL(18,6)  NULL,
  avg_order_value                     DECIMAL(18,6)  NULL
);
GO

--------------------------------------------------------
-- Daily campaign aggregates  (campaign_agg_daily.csv)
CREATE TABLE dbo.fact_campaign_daily (
  [date]                   DATE           NULL,
  source                   VARCHAR(100)   NULL,
  medium                   VARCHAR(100)   NULL,
  campaign                 VARCHAR(200)   NULL,
  device_category          VARCHAR(50)    NULL,
  sessions                 INT            NULL,
  page_views               INT            NULL,
  conversions              INT            NULL,
  revenue                  DECIMAL(18,2)  NULL,
  session_duration         INT            NULL,
  new_users                INT            NULL,

  -- derived in Python
  cvr_per_session          DECIMAL(18,6)  NULL,
  cvr_per_pageview         DECIMAL(18,6)  NULL,
  arpu                     DECIMAL(18,6)  NULL,
  avg_session_duration     DECIMAL(18,6)  NULL,
  avg_pages_per_session    DECIMAL(18,6)  NULL,
  new_user_rate            DECIMAL(18,6)  NULL
);
GO

------------------------------------------------------
-- SEO KPIs  (seo_kpi.csv)
IF OBJECT_ID('dbo.fact_seo', 'U') IS NOT NULL DROP TABLE dbo.fact_seo;
CREATE TABLE dbo.fact_seo (
  keyword        NVARCHAR(300)   NOT NULL,   
  cpc            DECIMAL(18,6)   NULL,
  search_volume  INT             NULL,
  competition    NVARCHAR(30)    NULL,       
  score          DECIMAL(18,6)   NULL,       
  opp_score      DECIMAL(18,6)   NULL,       
  intent         NVARCHAR(30)    NULL        
);
GO

-------------------------------------------------------
--Traffic mix daily ( traffic_mix_daily.csv)
CREATE TABLE dbo.fact_traffic_mix_daily (
  [date]                   DATE           NULL,
  traffic_type             VARCHAR(30)    NULL,   
  sessions                 INT            NULL,
  page_views               INT            NULL,
  conversions              INT            NULL,
  revenue                  DECIMAL(18,2)  NULL
);
GO

-- PART II - BULK INSERT THE DATA IN THE TABLES
------------------------------------------------------------

-- Marketing KPI data
BULK INSERT dbo.fact_marketing
FROM 'C:\\Users\\kriti\\Documents\\Projects\\Marketing\\marketing-analytics\\data\\processed_files\\kpi_marketing.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0d0a',   -- if it fails, try 0x0a
  FIELDQUOTE = '"',           -- handle commas in text
  CODEPAGE = '65001',         -- UTF-8
  DATAFILETYPE = 'char',
  TABLOCK,
  KEEPNULLS
);

SELECT TOP 5 * FROM dbo.fact_marketing;


-- Daily aggregated campaign data
BULK INSERT dbo.fact_campaign_daily
FROM 'C:\\Users\\kriti\\Documents\\Projects\\Marketing\\marketing-analytics\\data\\processed_files\\agg_campaign_daily.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0a',
  TABLOCK,
  CODEPAGE = '65001',
  KEEPNULLS
);
GO

-- Different traffic (where the data comes from)
BULK INSERT dbo.fact_traffic_mix_daily
FROM 'C:\\Users\\kriti\\Documents\\Projects\\Marketing\\marketing-analytics\\data\\processed_files\\traffic_mix_daily.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0a',
  TABLOCK,
  CODEPAGE = '65001',
  KEEPNULLS
);
GO

-- Seo KPI dataset
BULK INSERT dbo.fact_seo
FROM 'C:\\Users\\kriti\\Documents\\Projects\\Marketing\\marketing-analytics\\data\\processed_files\\kpi_seo.csv'   
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0d0a',   
  FIELDQUOTE = '"',           
  CODEPAGE = '65001',         
  DATAFILETYPE = 'char',
  TABLOCK,
  KEEPNULLS
);
GO

-- checking the tables and how many rows each have
SELECT TOP 10 * FROM dbo.fact_seo;

SELECT TOP 5 * FROM dbo.fact_campaign_daily ORDER BY [date] DESC;

-- row counts
SELECT 'marketing' AS table_name, COUNT(*) AS rows FROM dbo.fact_marketing
UNION ALL
SELECT 'campaign_daily', COUNT(*) FROM dbo.fact_campaign_daily
UNION ALL
SELECT 'seo', COUNT(*) FROM dbo.fact_seo;

