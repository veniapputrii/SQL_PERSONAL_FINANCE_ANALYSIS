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
		WHEN monthly_expense_total > monthly_income THEN 'CRITICAL RISK'
		WHEN discretionary_spending > essential_spending THEN 'HIGH RISK'
		ELSE 'Normal'
	END AS risk_flag
FROM finance
WHERE monthly_expense_total > monthly_income  
   OR discretionary_spending > essential_spending
ORDER BY monthly_expense_total DESC;




