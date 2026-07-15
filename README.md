# 📊 Telecom Customer Churn Analysis — End-to-End Data Analytics Project

## 📌 Project Overview
This project analyzes customer churn behavior for a telecom company using a real-world dataset
(Telco Customer Churn — sourced from Kaggle). The goal is to identify key factors driving customer
churn and provide actionable business insights to help reduce customer attrition.

The project follows a complete end-to-end analytics workflow across multiple tools:

**Excel → SQL (MySQL) → Python → Power BI**

---

## 🎯 Objective
- Understand customer demographics, services, and billing patterns
- Identify which customer segments are most likely to churn
- Statistically validate churn-driving factors
- Build a predictive model to flag high-risk customers
- Deliver an interactive dashboard for business stakeholders

---

## 🗂️ Dataset
- **Source:** Kaggle — Telco Customer Churn Dataset
- **Records:** 7,043 (raw) → 7,032 (after handling 11 records with missing `TotalCharges`,
  due to customers with 0 tenure who hadn't been billed yet)
- **Features:** 21 columns including demographics, account information, subscribed services,
  billing details, and churn status

---

## 🛠️ Tools & Technologies

| Stage | Tool | Purpose |
|---|---|---|
| Data Validation | Excel | Row/column checks, blank & duplicate detection, pivot tables |
| Data Querying | MySQL | Business queries — customer overview, segmentation, churn rate |
| Data Analysis | Python (Pandas, Matplotlib, Seaborn, SciPy, Scikit-learn) | EDA, statistical testing, predictive modeling |
| Dashboarding | Power BI | Interactive churn dashboard for stakeholders |

---

## 🔄 Project Workflow

1. **Excel** — Validated data structure (row/column counts, duplicate & blank checks using
   `COUNTBLANK`, `COUNTA`, Conditional Formatting) and built pivot tables to get an early feel
   for churn patterns by contract type, payment method, and internet service. This is where the
   11 missing `TotalCharges` records were first identified.

2. **MySQL** — Wrote business queries covering customer overview, segmentation, churn rate,
   and revenue impact. During import, MySQL's numeric column type rejected the 11 rows with
   blank `TotalCharges`, resulting in a clean table of 7,032 records.

3. **Python** — Connected directly to the MySQL database using SQLAlchemy + PyMySQL, then:
   - Performed univariate, bivariate, and correlation-based EDA
   - Validated visual patterns statistically using Independent Sample T-Tests (p < 0.05)
   - Engineered features (`tenure_group`, `CLV`)
   - Built a Logistic Regression model (80% accuracy) to predict churn and rank feature importance

4. **Power BI** — Imported the cleaned, feature-engineered dataset and built an interactive
   one-page dashboard with KPI cards, segmented churn charts, and dynamic filters.

---

## 💡 Key Business Questions Answered
- What is the overall customer churn rate?
- Which contract types and payment methods have the highest churn?
- Does tenure impact the likelihood of churn?
- Which services (e.g., online security, tech support) correlate with retention?
- Who are the high-risk customers the business should prioritize for retention offers?

---

## 📈 Key Findings

- **Overall churn rate: 26.6%** — roughly 1 in 4 customers has left
- **Contract type is the strongest churn driver:** Month-to-month churns at 42.7% vs. 2.8%
  for two-year contracts
- **Payment method matters:** Electronic check users churn at 45.3%, nearly 3x automatic
  payment methods
- **New customers are highest risk:** Churn is concentrated in the first 12 months of tenure
- **Fiber optic customers churn more** than DSL despite being the premium service (41.9% vs 19.0%)
- **Add-on services reduce churn:** Customers without Online Security/Tech Support churn more
- **Statistically validated:** T-tests confirm tenure and MonthlyCharges differences between
  churned/retained customers are real, not random (p < 0.05)
- **Model confirms EDA:** Logistic Regression independently ranked Contract type, Internet
  service, and support services as top churn predictors

---

## 🚀 Recommendations
- Incentivize month-to-month customers to switch to longer-term contracts
- Encourage automatic payment enrollment
- Prioritize onboarding and proactive support in the first 12 months
- Investigate Fiber optic pricing/satisfaction
- Bundle Online Security / Tech Support to increase retention
- Use the churn model to proactively flag and target high-risk customers

---

## 📊 Power BI Dashboard

The final dashboard includes:
- **5 KPI cards:** Total Customers, Churn Rate %, Revenue at Risk, Avg Tenure, CLV at Risk
- **4 interactive charts:** Churn by Contract Type, Churn by Tenure Group, Churn by Payment
  Method, and overall Churn Distribution
- **Dynamic slicers:** Contract, Internet Service, Senior Citizen — filters the entire dashboard live



---

## 📁 Repository Structure

```
telecom-churn-analysis/
│
├── data/
│   └── cleaned/telecom_churn_cleaned.csv
│
├── sql/
│   └── business_queries.sql
│
├── notebooks/
│   └── churn_eda_analysis.ipynb
│
├── powerbi/
│   ├── churn_dashboard.pbix
│   └── dashboard_preview.png
│
├── README.md
└── .gitignore
```

> Note: The Excel validation file is not included in this repository, as its purpose was
> exploratory (initial data validation and pivot analysis) and its findings are documented
> and carried forward into the SQL and Python stages above.

---

## ⚠️ Limitations
- The predictive model was intentionally kept simple (Logistic Regression, no class balancing)
  for interpretability; recall on churned customers (53%) leaves room for improvement with
  techniques like SMOTE or class weighting
- Analysis is based on a static snapshot of customer data; a time-series view would help
  validate whether these patterns hold consistently over time

## 🔮 Future Scope
- Apply class-balancing techniques (SMOTE) to improve churn recall
- Test additional models (Random Forest, XGBoost) for comparison
- Extend the Power BI dashboard with a high-risk customer watchlist page
- Automate the SQL → Python → Power BI refresh pipeline

---


---
**Tools Used:** Excel • MySQL • Python (Pandas, Seaborn, Matplotlib, SciPy, Scikit-learn) • Power BI
