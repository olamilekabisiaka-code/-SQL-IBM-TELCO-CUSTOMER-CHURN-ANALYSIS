/* ============================================================
   IBM TELCO CUSTOMER CHURN ANALYSIS
   Tool: Microsoft SQL Server
   Dataset: IBM Telco Customer Churn
   Purpose: Customer churn analysis and segmentation
   ============================================================ */


/* ============================================================
   1. DATA OVERVIEW
   ============================================================ */

-- Total number of customers
SELECT COUNT(*) AS Total_Customers
FROM vw_TelcoChurn_Cleaned;


-- Check churn distribution
SELECT
    Churn,
    COUNT(*) AS Customer_Count
FROM vw_TelcoChurn_Cleaned
GROUP BY Churn;


/* ============================================================
   2. OVERALL CHURN ANALYSIS
   ============================================================ */

WITH Customer_Overview AS (
    SELECT
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers,
        SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
            AS Retained_Customers
    FROM vw_TelcoChurn_Cleaned
)

SELECT
    Total_Customers,
    Churned_Customers,
    Retained_Customers,
    CAST(Churned_Customers AS DECIMAL(10,2))
        / Total_Customers * 100 AS Churn_Rate
FROM Customer_Overview;


/* ============================================================
   3. CHURN BY CONTRACT TYPE
   ============================================================ */

WITH Contract_Analysis AS (
    SELECT
        Contract,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers
    FROM vw_TelcoChurn_Cleaned
    GROUP BY Contract
)

SELECT
    Contract,
    Total_Customers,
    Churned_Customers,
    CAST(Churned_Customers AS DECIMAL(10,2))
        / Total_Customers * 100 AS Churn_Rate
FROM Contract_Analysis
ORDER BY Churn_Rate DESC;


/* ============================================================
   4. CHURN BY INTERNET SERVICE
   ============================================================ */

WITH Internet_Service_Analysis AS (
    SELECT
        InternetService,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers
    FROM vw_TelcoChurn_Cleaned
    GROUP BY InternetService
)

SELECT
    InternetService,
    Total_Customers,
    Churned_Customers,
    CAST(Churned_Customers AS DECIMAL(10,2))
        / Total_Customers * 100 AS Churn_Rate
FROM Internet_Service_Analysis
ORDER BY Churn_Rate DESC;


/* ============================================================
   5. CHURN BY PAYMENT METHOD
   ============================================================ */

WITH Payment_Analysis AS (
    SELECT
        PaymentMethod,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers
    FROM vw_TelcoChurn_Cleaned
    GROUP BY PaymentMethod
)

SELECT
    PaymentMethod,
    Total_Customers,
    Churned_Customers,
    CAST(Churned_Customers AS DECIMAL(10,2))
        / Total_Customers * 100 AS Churn_Rate
FROM Payment_Analysis
ORDER BY Churn_Rate DESC;


/* ============================================================
   6. CHURN BY TENURE GROUP
   ============================================================ */

WITH Tenure_Analysis AS (
    SELECT
        CASE
            WHEN tenure BETWEEN 0 AND 12
                THEN '0-12 months'
            WHEN tenure BETWEEN 13 AND 24
                THEN '13-24 months'
            WHEN tenure BETWEEN 25 AND 48
                THEN '25-48 months'
            WHEN tenure BETWEEN 49 AND 72
                THEN '49-72 months'
        END AS Tenure_Group,

        Churn
    FROM vw_TelcoChurn_Cleaned
)

SELECT
    Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS Churned_Customers,
    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS DECIMAL(10,2)
    ) / COUNT(*) * 100 AS Churn_Rate
FROM Tenure_Analysis
GROUP BY Tenure_Group
ORDER BY
    CASE Tenure_Group
        WHEN '0-12 months' THEN 1
        WHEN '13-24 months' THEN 2
        WHEN '25-48 months' THEN 3
        WHEN '49-72 months' THEN 4
    END;


/* ============================================================
   7. CHURN BY SENIOR CITIZEN STATUS
   ============================================================ */

WITH Senior_Citizen_Analysis AS (
    SELECT
        CASE
            WHEN SeniorCitizen = 0
                THEN 'Non-Senior Citizen'
            WHEN SeniorCitizen = 1
                THEN 'Senior Citizen'
        END AS Senior_Citizen_Status,

        Churn
    FROM vw_TelcoChurn_Cleaned
)

SELECT
    Senior_Citizen_Status,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS Churned_Customers,
    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS DECIMAL(10,2)
    ) / COUNT(*) * 100 AS Churn_Rate
FROM Senior_Citizen_Analysis
GROUP BY Senior_Citizen_Status
ORDER BY Churn_Rate DESC;


/* ============================================================
   8. CHURN BY GENDER
   ============================================================ */

WITH Gender_Analysis AS (
    SELECT
        gender,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers
    FROM vw_TelcoChurn_Cleaned
    GROUP BY gender
)

SELECT
    gender,
    Total_Customers,
    Churned_Customers,
    CAST(Churned_Customers AS DECIMAL(10,2))
        / Total_Customers * 100 AS Churn_Rate
FROM Gender_Analysis
ORDER BY Churn_Rate DESC;


/* ============================================================
   9. CHURN BY PARTNER STATUS
   ============================================================ */

WITH Partner_Analysis AS (
    SELECT
        Partner,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers
    FROM vw_TelcoChurn_Cleaned
    GROUP BY Partner
)

SELECT
    Partner,
    Total_Customers,
    Churned_Customers,
    CAST(Churned_Customers AS DECIMAL(10,2))
        / Total_Customers * 100 AS Churn_Rate
FROM Partner_Analysis
ORDER BY Churn_Rate DESC;


/* ============================================================
   10. CHURN BY ONLINE SECURITY
   ============================================================ */

WITH Security_Analysis AS (
    SELECT
        OnlineSecurity,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers
    FROM vw_TelcoChurn_Cleaned
    GROUP BY OnlineSecurity
)

SELECT
    OnlineSecurity,
    Total_Customers,
    Churned_Customers,
    CAST(Churned_Customers AS DECIMAL(10,2))
        / Total_Customers * 100 AS Churn_Rate
FROM Security_Analysis
ORDER BY Churn_Rate DESC;


/* ============================================================
   11. CHURN BY TECH SUPPORT
   ============================================================ */

WITH Tech_Support_Analysis AS (
    SELECT
        TechSupport,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers
    FROM vw_TelcoChurn_Cleaned
    GROUP BY TechSupport
)

SELECT
    TechSupport,
    Total_Customers,
    Churned_Customers,
    CAST(Churned_Customers AS DECIMAL(10,2))
        / Total_Customers * 100 AS Churn_Rate
FROM Tech_Support_Analysis
ORDER BY Churn_Rate DESC;


/* ============================================================
   12. CHURN BY CONTRACT + INTERNET SERVICE
   ============================================================ */

WITH Segment_Analysis AS (
    SELECT
        Contract,
        InternetService,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers
    FROM vw_TelcoChurn_Cleaned
    GROUP BY
        Contract,
        InternetService
)

SELECT
    Contract,
    InternetService,
    Total_Customers,
    Churned_Customers,
    CAST(Churned_Customers AS DECIMAL(10,2))
        / Total_Customers * 100 AS Churn_Rate
FROM Segment_Analysis
ORDER BY Churn_Rate DESC;


/* ============================================================
   13. HIGH-RISK CUSTOMER SEGMENTS
   ============================================================ */

SELECT
    Contract,
    InternetService,
    PaymentMethod,

    COUNT(*) AS Total_Customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,

    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS DECIMAL(10,2)
    ) / COUNT(*) * 100 AS Churn_Rate

FROM vw_TelcoChurn_Cleaned

GROUP BY
    Contract,
    InternetService,
    PaymentMethod

HAVING COUNT(*) >= 50

ORDER BY Churn_Rate DESC;
