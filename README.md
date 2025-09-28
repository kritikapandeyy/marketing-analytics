# Marketing & SEO Analytics

## Project Overview
This project analyzes **digital marketing campaigns** (paid ads) alongside **SEO keyword performance** to evaluate which channels and keywords deliver the best ROI.  
Using **Python, SQL Server, and Power BI**, I transformed raw campaign and SEO data into actionable insights and an interactive dashboard for smarter marketing spend allocation.

---

## Business Problem
Marketing teams often struggle to understand:
-Channel ROI blind spots -> Some channels deliver high ROI with low visibility, while others consume large budgets with poor returns.
-Inefficient campaign spend -> Without clear CPC, CPA, ROAS, and ROI metrics, it’s hard to identify budget waste early.
-SEO vs Paid imbalance -> Teams struggle to measure how organic keywords compare to paid ads in driving conversions and revenue.
-Fragmented user insights -> Web traffic, device types, and new vs returning user behavior are often siloed, limiting a full funnel view.

---

## Data Sources
- [Digital Marketing Campaign Dataset](https://www.kaggle.com/datasets/sazid28/digital-marketing-dataset): Paid ads (impressions, clicks, conversions, spend, revenue).  
- [SEO Keywords Dataset](https://www.kaggle.com/datasets/ahmedmohameddawoud/google-keywords-search-volume-cpc): Organic keywords (search volume, CTR, CPC).
- [Web Marketing Campaign Performance Analysis] (https://www.kaggle.com/datasets/sulaimanahmed/web-marketing-campaign-performance-analysis):  user sessions, conversions, traffic source 

---

## Tools & Technologies
- **Python** – Data cleaning & KPI calculations (CTR, CPC, Conversion Rate, ROI).  
- **SQL Server** – Structured queries for campaign and SEO analysis.  
- **Power BI** – Interactive dashboards (Paid vs Organic performance).  

---

## Project Workflow
1. **Data Cleaning & Preparation**  
   - Standardized column names, handled missing values.  
   - Create and aggregate new Datasets.  

2. **KPI Calculations**  
   - CTR (Click-Through Rate)  
   - CPC (Cost per Click)  
   - Conversion Rate  
   - CPA (Cost per Acquisition)  
   - ROI (Return on Investment)  
   - Paid vs Organic traffic mix  

3. **Dashboard Design (Power BI)**  
   - Overview → High-level KPIs (Budget, Revenue, ROI, ROAS) with funnel, sessions, and revenue split by channel.
   - Paid Campaigns → ROI, ROAS, CPC, and CPA analysis with Top 10 campaigns and tier-level conversion breakdown.
   - SEO & Organic → Keyword intent, search volume, competition, and top opportunity keywords for organic growth.
   - User Behavior → Daily conversions, page views, medium performance, and device-level new user insights.

## Key Insights
- A channel with lower impressions delivered the **highest ROI**, making it ideal for budget reallocation.  
- Several campaigns showed **high spend but poor conversion efficiency**.  
- Top SEO keywords had **lower CPC with higher CTR**, outperforming some paid campaigns.  
- Recommended shifting spend toward high-ROI channels while scaling proven SEO keywords.  


## Business Impact
This project demonstrates how data analytics can be applied in digital marketing and SEO to:  
- Optimize marketing spend allocation.  
- Identify underperforming campaigns early.  
- Balance investments between paid advertising and organic SEO
- Single source of truth for Paid + Organic performance.
- Clear KPIs (ROI, ROAS, CPC, CPA) to flag inefficiencies.
- User funnel + traffic mix insights to optimize spend..  

## Deliverables
- Cleaned datasets (campaign + SEO).  
- Python scripts for KPI calculations.  
- SQL queries for channel and keyword analysis.  
- Power BI dashboard (screenshots + `.pbix` file).  
