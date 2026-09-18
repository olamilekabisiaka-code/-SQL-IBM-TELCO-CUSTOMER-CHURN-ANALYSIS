# -SQL-IBM-TELCO-CUSTOMER-CHURN-ANALYSIS
Customer churn analysis using SQL Server and Power BI, exploring churn patterns across contracts, services, tenure, payment methods, and customer demographics.

# IBM Telco Customer Churn Analysis

## 📊 Project Overview

Customer churn is an important business challenge for telecommunications companies because losing existing customers can significantly affect revenue and long-term growth.

In this project, I analyzed the **IBM Telco Customer Churn dataset** to identify patterns and customer segments associated with churn.

The analysis was performed using **Microsoft SQL Server**, while **Power BI** was used to create an interactive dashboard for communicating the findings.

The project follows a complete data analytics workflow:

**Raw Data → Data Cleaning → SQL Analysis → DAX → Power BI Dashboard → Business Insights**

---

## 🎯 Business Objective

The primary objective of this analysis was to understand:

- What proportion of customers are churning?
- Which contract types have the highest churn?
- How does internet service relate to customer churn?
- Which payment methods are associated with higher churn?
- How does customer tenure affect churn?
- Does churn differ between senior and non-senior customers?
- Are there specific combinations of customer characteristics associated with higher churn?

---

## 🛠️ Tools & Technologies

- **SQL Server** – Data cleaning, transformation, validation and analysis
- **SQL** – CTEs, CASE statements, aggregations, GROUP BY, HAVING and conditional calculations
- **Power BI** – Interactive dashboard and data visualization
- **DAX** – Measures, calculated columns and KPI calculations

---

## 🧹 Data Preparation

The dataset was imported into SQL Server and inspected for:

- Missing values
- Duplicate records
- Incorrect data types
- Invalid numerical values
- Inconsistent values

A cleaned SQL view named:

`vw_TelcoChurn_Cleaned`

was created and used as the primary source for the analysis.

---

## 🔎 SQL Analysis

The analysis examined customer churn across multiple dimensions, including:

### Overall Churn

- Total Customers
- Churned Customers
- Retained Customers
- Overall Churn Rate

### Customer Segments

Churn was analyzed by:

- Contract Type
- Internet Service
- Payment Method
- Tenure Group
- Senior Citizen Status
- Gender
- Partner Status
- Online Security
- Tech Support

Additional segmentation was performed using combinations of:

- Contract
- Internet Service
- Payment Method

to identify customer groups with relatively high churn rates.

---

## 📈 Key Findings

The analysis produced several notable findings:

| Metric | Result |
|---|---:|
| Total Customers | 7,043 |
| Churned Customers | 1,869 |
| Retained Customers | 5,174 |
| Overall Churn Rate | 26.54% |
| Avg. Monthly Charges | 64.76 |

### Key observations

- **Month-to-month customers** recorded a churn rate of approximately **42.71%**.
- **Fiber optic customers** recorded a churn rate of approximately **41.89%**.
- **Electronic check users** recorded a churn rate of approximately **45.29%**.
- **Senior citizens** recorded a churn rate of approximately **41.68%**, compared with 23.61% for non-senior citizens.
- Customers with **shorter tenure** generally showed higher churn rates than customers with longer tenure.
- Churn rates between male and female customers were relatively similar.

---

## 📊 Power BI Dashboard

The cleaned SQL view was connected directly to Power BI to create an interactive dashboard.

The dashboard includes:

### KPI Cards

- Total Customers
- Churned Customers
- Churn Rate
- Average Monthly Charges

### Visualizations

- Churned vs Retained Customers
- Churn Rate by Contract
- Churn Rate by Internet Service
- Churn Rate by Payment Method
- Churn Rate by Tenure Group
- Churn Rate by Senior Citizen Status
- Churn Rate by Gender
- Churn Rate by Partner Status

### Interactive Filters

Users can filter the dashboard using customer attributes such as:

- Gender
- Contract
- Internet Service
- Payment Method
- Senior Citizen Status

---

## 💡 Business Insights

The analysis suggests that customer churn is not evenly distributed across the customer base.

Certain customer characteristics show substantially different churn rates, particularly:

- Short-term/month-to-month contracts
- Certain internet service categories
- Electronic check payment
- Shorter customer tenure
- Senior citizen status

These patterns can help a telecom company investigate potential retention opportunities and prioritize further analysis of higher-churn customer segments.

---

👤 Author

Habib Isiaka

Aspiring Data Analyst | SQL | Power BI | Excel | Python
