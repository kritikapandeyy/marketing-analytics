# Marketing & SEO Analytics

## Project Overview
This project analyzes **digital marketing campaigns** (paid ads) alongside **SEO keyword performance** to evaluate which channels and keywords deliver the best ROI.  
Using **Python, SQL Server, and Power BI**, I transformed raw campaign and SEO data into actionable insights and an interactive dashboard for smarter marketing spend allocation.

---

## Business Problem
Marketing teams often struggle to understand:
- Which ad channels generate high ROI despite low impressions.
- Which campaigns waste budget with high spend but low conversions.
- Which SEO keywords bring the most organic value compared to paid traffic.

This project provides a single view of **Paid vs Organic performance** to support better decision-making.

---

## Data Sources
- [Digital Marketing Campaign Dataset](https://www.kaggle.com/datasets/sazid28/digital-marketing-dataset) – Paid ads (impressions, clicks, conversions, spend, revenue).  
- [SEO Keywords Dataset](https://www.kaggle.com/datasets/ahmedmohameddawoud/google-keywords-search-volume-cpc) – Organic keywords (search volume, CTR, CPC).  

---

## Tools & Technologies
- **Python** – Data cleaning & KPI calculations (CTR, CPC, Conversion Rate, ROI).  
- **SQL Server** – Structured queries for campaign and SEO analysis.  
- **Power BI** – Interactive dashboards (Paid vs Organic performance).  

---

## Project Workflow
1. **Data Cleaning & Preparation**  
   - Standardized column names, handled missing values.  
   - Combined paid campaign and SEO keyword datasets.  

2. **KPI Calculations**  
   - CTR (Click-Through Rate)  
   - CPC (Cost per Click)  
   - Conversion Rate  
   - CPA (Cost per Acquisition)  
   - ROI (Return on Investment)  
   - Paid vs Organic traffic mix  

3. **Dashboard Design (Power BI)**  
   - KPI cards: CTR, CPC, Conversion Rate, ROI  
   - Funnel: Impressions → Clicks → Conversions  
   - Bar chart: ROI by channel (Google Ads, Facebook, etc.)  
   - SEO keyword table: Top keywords by CTR & CPC  
   - Pie chart: Paid vs Organic traffic share  

---

## Key Insights
- A channel with lower impressions delivered the **highest ROI**, making it ideal for budget reallocation.  
- Several campaigns showed **high spend but poor conversion efficiency**.  
- Top SEO keywords had **lower CPC with higher CTR**, outperforming some paid campaigns.  
- Recommended shifting spend toward high-ROI channels while scaling proven SEO keywords.  

---

## Business Impact
This project demonstrates how data analytics can be applied in **digital marketing and SEO** to:  
- Optimize marketing spend allocation.  
- Identify underperforming campaigns early.  
- Balance investments between **paid advertising and organic SEO**.  

---

## Deliverables
- Cleaned datasets (campaign + SEO).  
- Python scripts for KPI calculations.  
- SQL queries for channel and keyword analysis.  
- Power BI dashboard (screenshots + `.pbix` file).  
