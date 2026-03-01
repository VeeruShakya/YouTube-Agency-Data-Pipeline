# 🚀 YouTube Agency Data Pipeline: Python to PostgreSQL

## 📊 The Business Problem
Managing massive amounts of raw, messy financial data from YouTube creators is a major bottleneck for digital agencies. Broken spreadsheets, missing values, and isolated CSV files make it impossible to track true ROI. 

## 💡 The Solution
I built an automated end-to-end data engineering pipeline that ingests raw creator metrics, cleans the data, engineers custom financial features, and securely injects the final dataset into a relational database for secure storage and analysis.

## 🛠️ Tech Stack
* **Language:** Python 
* **Libraries:** Pandas, SQLAlchemy, psycopg2
* **Database:** PostgreSQL (pgAdmin 4)

## ⚙️ The Pipeline Architecture
1. **Ingestion:** Extracted raw financial data from local CSVs using Pandas.
2. **Data Cleaning:** Purged corrupted rows (`.dropna()`) and imputed missing financial values (`.fillna()`) to ensure 100% data integrity.
3. **Feature Engineering:** Calculated dynamic metrics, including `Total_Video_Revenue_USD` and `Agency_Earnings_USD`, transforming raw metrics into actionable business ROI.
4. **Backend Storage:** Configured an SQLAlchemy engine to bypass local security constraints and bulk-insert the cleaned, 1,000-row dataframe directly into a secure PostgreSQL database.

## 📈 The Result
A fully automated ETL (Extract, Transform, Load) script that eliminates manual spreadsheet formatting and prepares clean data for advanced SQL querying and dashboarding.

![Image Alt](https://github.com/VeeruShakya/YouTube-Agency-Data-Pipeline/blob/1b27f3680dbc1e796d8dd0e9de85c9467e68553a/Screenshot%202026-02-27%20184301.png)
![Image Alt](https://github.com/VeeruShakya/YouTube-Agency-Data-Pipeline/blob/67c4cd65bd3f0b4bcb6c46d7f247803b22b6a5d1/Screenshot%202026-02-27%20184203.png)

## 📊 V2: Advanced SQL Analytics Layer

After establishing the automated Python-to-PostgreSQL pipeline, I engineered a production-ready SQL analytics layer to extract actionable business intelligence from the cleaned dataset. 

This layer consists of advanced queries designed to answer high-level executive questions for creator agencies:

* **Regional Adsense RPM:** Calculates revenue per mille (RPM) across geographic regions to identify the most profitable audiences.
  * **Technical Flex:** Mathematical operators, `::DECIMAL` Type Casting, `GROUP BY`.
* **Sponsor Lifetime Value (LTV) Audit:** Aggregates historical brand deal data to isolate high-value, recurring sponsors from one-off campaigns.
  * **Technical Flex:** Aggregate Functions (`SUM`, `COUNT`), `HAVING` clause filtering.
* **Month-Over-Month Viral Momentum:** Tracks chronological view velocity and revenue growth to forecast channel trajectory.
  * **Technical Flex:** Pre-Aggregation Common Table Expressions (CTEs), `LAG()` Window Function, `OVER(ORDER BY)`.

**[View the complete analytics script here](https://github.com/VeeruShakya/YouTube-Agency-Data-Pipeline/blob/7ad676b735331e671aa14b09bef3a42d616f7c82/V2%20Advanced%20SQL%20Analytics%20Layer.sql))**
