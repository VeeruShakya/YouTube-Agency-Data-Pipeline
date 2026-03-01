-- ==============================================================================
-- PROJECT: YouTube Creator Agency Data Analytics 
-- DESCRIPTION: Advanced SQL analytics querying a PostgreSQL database populated 
--              via an automated Python/Pandas ETL pipeline.
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- MISSION 1: Audience Valuation & RPM
-- Business Logic: Calculates the Revenue Per Mille (RPM) for each geographic 
-- region to identify which audience demographic yields the highest return.
-- Features: Aggregation, Math Operations, Type Casting to bypass integer traps.
-- ------------------------------------------------------------------------------

SELECT 
    audience_geography,
    SUM(views) AS total_views, 
    SUM(adsense_revenue_usd) AS total_revenue,
    (SUM(adsense_revenue_usd)::NUMERIC / SUM(views)) * 1000 AS adsense_rpm
FROM creator_finances
GROUP BY audience_geography
ORDER BY adsense_rpm DESC;


-- ------------------------------------------------------------------------------
-- MISSION 2: The Sponsor ROI Audit
-- Business Logic: Identifies the most lucrative recurring brand partners by 
-- calculating the average agency earnings per sponsor.
-- Features: The HAVING clause is utilized to filter out one-off deals, 
-- restricting the output strictly to brands with more than 3 sponsored videos.
-- ------------------------------------------------------------------------------

SELECT 
    sponsor_brand,
    AVG(agency_earnings_usd) AS avg_earning
FROM creator_finances
GROUP BY sponsor_brand
HAVING COUNT(video_id) > 3 
ORDER BY avg_earning DESC;


-- ------------------------------------------------------------------------------
-- MISSION 3: Month-over-Month Viral Momentum Tracker
-- Business Logic: Tracks the agency's revenue growth trajectory by comparing 
-- the current month's total revenue directly against the previous month's.
-- Features: Pre-Aggregation CTEs, Date Math (EXTRACT), ROUND(), and the 
-- LAG() Window Function for row-by-row comparative analysis.
-- ------------------------------------------------------------------------------

WITH monthly_total AS (
    SELECT 
        EXTRACT(MONTH FROM publish_date) AS revenue_month,
        ROUND(SUM(total_video_revenue_usd)) AS current_revenue 
    FROM creator_finances
    GROUP BY EXTRACT(MONTH FROM publish_date)
)
SELECT 
    revenue_month, 
    current_revenue,
    LAG(current_revenue) OVER (ORDER BY revenue_month) AS previous_month_revenue
FROM monthly_total;