# 💲 SQL_PERSONAL_FINANCE_ANALYSIS

## 📌 Project Overview
This project leverages **PostgreSQL** to analyze and extract insights from the [Personal Finance Tracker Dataset](https://www.kaggle.com/datasets/khushikyad001/personal-finance-tracker-dataset). The dataset is a synthetic yet realistic simulation of personal finance behavior over a multi-year period for 3,000 users, capturing income, expenses, savings, and credit profiles across different economic climates (Normal, Inflation, Recession).

**Goal:** To demonstrate advanced SQL querying skills—including Window Functions, Common Table Expressions (CTEs), Aggregations, and Data Modeling—by exploring financial habits, anomaly detection, and economic impact on personal wealth.

## 📊 Dataset Dictionary

This dataset simulates monthly financial records for 3,000 users. Here is a simple breakdown of what each column represents:

### 🆔 Context & Identification
* **`Date`**: The month and year of the financial record.
* **`user_id`**: A unique ID assigned to each person.
* **`financial_scenario`**: The state of the economy during that month (*Normal*, *Inflation*, or *Recession*).

### 💵 Income & Spending
* **`income_type`**: The source of the user's money (e.g., salary, freelance, hourly).
* **`monthly_income`**: Total money earned in that month.
* **`monthly_expense_total`**: Total money spent across everything in that month.
* **`essential_spending`**: Money spent on basic survival needs (groceries, utilities, healthcare).
* **`discretionary_spending`**: Money spent on personal "wants" (dining out, hobbies, vacations).
* **`rent_or_mortgage`**: Monthly housing payment.
* **`subscription_services`**: Recurring automated costs (streaming services, gym memberships).
* **`category`**: The primary spending or budgeting category for that record.

### 🏦 Savings & Investments
* **`budget_goal`**: The target spending or saving limit set by the user.
* **`savings_rate`**: The percentage of income the user saves instead of spends.
* **`actual_savings`**: The actual dollar amount successfully saved that month.
* **`savings_goal_met`**: Shows if the user reached their savings target (`1` = Yes, `0` = No).
* **`emrgency_fund`**: Total cash saved in a safety net for unexpected emergencies.
* **`investment_amount`**: Money put toward wealth-building (stocks, retirement, mutual funds).

### 💳 Credit, Debt & Transactions
* **`credit_score`**: The user's credit rating (300–850). Higher scores mean better credit health.
* **`debt_to_income_ration`**: The percentage of monthly income used to pay off debt.
* **`loan_payment`**: Fixed monthly payments for debts (car loans, student loans, etc.).
* **`transaction_count`**: The total number of individual purchases or bank transactions made.

### 📈 Financial Health & Risk
* **`cash_flow_status`**: Shows if income is higher than expenses (*Positive*, *Negative*, or *Neutral*).
* **`financial_stress_level`**: The user's level of financial anxiety (*Low*, *Medium*, or *High*).
* **`financial_advice_score`**: A rating of how well the user follows good personal finance habits.
* **`fraud_flag`**: Detects suspicious or abnormal transaction activity (`1` = Suspicious, `0` = Normal).



*(Note: This is a synthetic dataset built for research and experimentation, not real-world financial decision-making).*

---

## 🗄️ Database Schema 

Here is the DDL (Data Definition Language) used to create the table in PostgreSQL:

``sql
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
);``


💡 **Potential Use Cases Explored**
1. Risk & Fraud Detection: Creating flags for abnormal spending patterns.

2. Creditworthiness: Segmenting users into risk tiers based on synthetic credit scores and debt ratios.

3. Budget Forecasting: Identifying users who consistently miss their budget goals.

