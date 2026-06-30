# 💲 SQL_PERSONAL_FINANCE_ANALYSIS

## 📌 Project Overview
This project leverages **PostgreSQL** to analyze and extract insights from the [Personal Finance Tracker Dataset](https://www.kaggle.com/datasets/khushikyad001/personal-finance-tracker-dataset). The dataset is a synthetic yet realistic simulation of personal finance behavior over a multi-year period for 3,000 users, capturing income, expenses, savings, and credit profiles across different economic climates (Normal, Inflation, Recession).

**Goal:** To demonstrate advanced SQL querying skills—including Window Functions, Common Table Expressions (CTEs), Aggregations, and Data Modeling—by exploring financial habits, anomaly detection, and economic impact on personal wealth.

## 📊 Dataset Description
The dataset contains monthly financial snapshots for simulated users. It specifically simulates three economic environments that affect user behavior:
* **Normal:** Stable financial behavior.
* **Inflation:** Higher expenses, increased stress, reduced savings.
* **Recession:** Lower income, rising debt ratios, possible fraudulent behavior.

### Key Features (Columns)
* `date`: Month and year of the financial snapshot.
* `user_id`: Unique identifier for the user.
* `monthly_income`: Total monthly income (USD).
* `monthly_expense_total`: Total expenses for the given month.
* `savings_rate`: Fraction of income saved (0 to 1).
* `budget_goal`: User-defined budget target for that month.
* `financial_scenario`: Economic state (Normal, Inflation, or Recession).
* `credit_score`: Synthetic credit score (300–850).
* `debt_to_income_ratio`: Debt-to-income ratio (0.1 to 0.6).
* `loan_payment`: Monthly loan repayment amount.

*(Note: This is a synthetic dataset built for research and experimentation, not real-world financial decision-making).*

---

## 🗄️ Database Schema 

Here is the DDL (Data Definition Language) used to create the table in PostgreSQL:

```sql
CREATE TABLE user_finances (
    id SERIAL PRIMARY KEY,
    snapshot_date DATE NOT NULL,
    user_id INT NOT NULL,
    monthly_income NUMERIC(10, 2),
    monthly_expense_total NUMERIC(10, 2),
    savings_rate NUMERIC(3, 2),
    budget_goal NUMERIC(10, 2),
    financial_scenario VARCHAR(50),
    credit_score INT CHECK (credit_score >= 300 AND credit_score <= 850),
    debt_to_income_ratio NUMERIC(3, 2),
    loan_payment NUMERIC(10, 2)
);
