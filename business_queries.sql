-- ===============================================
-- Telecom Customer Churn Analysis - Business Queries
-- Database: telecom_customer_churn
-- Table: telecom_churn
-- Records: 7,032 (11 records with missing TotalCharges
--          excluded during import due to 0 tenure customers)
-- ===============================================

CREATE DATABASE telecom_customer_churn;
USE telecom_customer_churn;

SELECT * FROM telecom_churn;


-- ===============================================
-- 1. CUSTOMER OVERVIEW
-- ===============================================

-- 1.1 Total Customers
SELECT COUNT(*) AS total_customers
FROM telecom_churn;

-- 1.2 Active Customers
SELECT COUNT(*) AS active_customers
FROM telecom_churn
WHERE Churn = 'No';

-- 1.3 Churned Customers
SELECT COUNT(*) AS churned_customers
FROM telecom_churn
WHERE Churn = 'Yes';


-- ===============================================
-- 2. CUSTOMER SEGMENTATION
-- Which customer group is more likely to leave?
-- ===============================================

-- 2.1 Churn by Gender
SELECT Gender,
       COUNT(*) AS Customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned
FROM telecom_churn
GROUP BY Gender;

-- 2.2 Churn by Senior Citizen
SELECT SeniorCitizen,
       COUNT(*) AS Customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned
FROM telecom_churn
GROUP BY SeniorCitizen;

-- 2.3 Which contract type has the highest churn?
SELECT Contract,
       COUNT(*) AS Customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned
FROM telecom_churn
GROUP BY Contract;

-- 2.4 Are new customers leaving more frequently? (Tenure Cohort)
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS Tenure_Group,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned
FROM telecom_churn
GROUP BY Tenure_Group;

-- 2.5 Are customers with higher bills more likely to churn?
SELECT Churn,
       ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges
FROM telecom_churn
GROUP BY Churn;

-- 2.6 Which services impact customer retention? (Internet Service)
SELECT InternetService,
       COUNT(*) AS Customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned
FROM telecom_churn
GROUP BY InternetService;

-- 2.7 Which services impact customer retention? (Tech Support)
SELECT TechSupport,
       COUNT(*) AS Customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned
FROM telecom_churn
GROUP BY TechSupport;

-- 2.8 Does payment method influence churn?
SELECT PaymentMethod,
       COUNT(*) AS Customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned
FROM telecom_churn
GROUP BY PaymentMethod;

-- 2.9 Which customer segment is at the highest risk of churn?
-- (Combined view: Contract + InternetService + PaymentMethod)
SELECT Contract, InternetService, PaymentMethod,
       COUNT(*) AS Customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned
FROM telecom_churn
GROUP BY Contract, InternetService, PaymentMethod
ORDER BY Churned DESC;

-- ===============================================
-- End of Business Queries
-- ===============================================
