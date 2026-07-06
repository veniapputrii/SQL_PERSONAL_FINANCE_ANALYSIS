



CREATE TABLE finance (
	Date DATE,
	user_id INT,
	monthly_income NUMERIC,
	monthly_expense_total NUMERIC,
	savings_rate INT,
	budget_goal NUMERIC,
	financial_scenario TEXT,
	credit_score NUMERIC,
	debt_to_income_ration INT,
	loan_payment NUMERIC,
	investment_amount INT,
	subscription_services INT,
	emrgency_fund NUMERIC,
	transaction_count INT,
	fraud_flag INT,
	discretionary_spending NUMERIC,
	essential_spending NUMERIC,
	income_type TEXT,
	rent_or_mortgage NUMERIC,
	category TEXT,
	cash_flow_status TEXT,
	financial_advice_score INT,
	financial_stress_level TEXT,
	actual_savings INT,
	savings_goal_met INT
	
);
select * from finance;
ALTER TABLE finance
ADD COLUMN goal_saving_month INT
GENERATED ALWAYS AS (monthly_income * savings_rate) STORED;
select * from finance 
where income_type = 'Salary';

select
	user_id,
	date,
	monthly_income,
	monthly_expense_total,
	discretionary_spending,
	essential_spending,
	CASE
		WHEN monthly_expense_total > (monthly_income * 1.5) THEN 'CRITICAL RISK'
		WHEN discretionary_spending > (essential_spending *2) THEN 'HIGH RISK'
		ELSE 'Normal'
	END AS risk_flag
FROM finance
WHERE monthly_expense_total > (monthly_income * 1.5) 
   OR discretionary_spending > (essential_spending * 2)
ORDER BY monthly_expense_total DESC;

WITH UserSpendingStats AS (
    SELECT 
        user_id,
        date,
        monthly_expense_total,
        -- Calculates the average expense for this specific user across all months
        ROUND(AVG(monthly_expense_total) OVER(PARTITION BY user_id), 2) AS user_avg_expense
    FROM user_finances
)
SELECT 
    user_id,
    date,
    monthly_expense_total,
    user_avg_expense,
    -- Calculates the percentage increase above their personal average
    ROUND(((monthly_expense_total - user_avg_expense) / user_avg_expense) * 100, 2) AS pct_above_average,
    CASE 
        WHEN monthly_expense_total > (user_avg_expense * 1.60) THEN 'SPIKE FLAG: Spending 60%+ above personal norm'
        ELSE 'Normal'
    END AS spending_anomaly_flag
FROM UserSpendingStats
WHERE monthly_expense_total > (user_avg_expense * 1.60)
ORDER BY pct_above_average DESC;
