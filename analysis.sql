
-- What are the top three states with Data Engineer job titles in 2015?
SELECT
    g.state,
    COUNT(e.job_title) AS job_count
FROM general g
LEFT JOIN employ e ON g.case_id = e.case_id
WHERE e.soc_name LIKE '%Computer%'
GROUP BY g.state
ORDER BY job_count DESC
LIMIT 3;

-- What are the top 10 salaries of  the sample of H1B petitions in 2015? Where are the visas applied to? What companies are applying for these H1Bs?

SELECT 
	g.city,
	g.state,
	e.employer,
	e.wage
FROM	employ  e
LEFT JOIN general g
ON e.case_id = g.case_id
ORDER BY wage DESC
LIMIT 10;

-- By how much do managerial positions make on average more than analyst positions?

WITH 	
	analyst_wage AS (
	SELECT
		COALESCE(avg(wage),0) AS analyst_salary
	FROM employ
	WHERE soc_name LIKE ' %Analyst%' ),
	
	manager_wage AS(
	SELECT
		COALESCE(avg(wage ),0)AS manager_salary
	FROM employ
	WHERE soc_name LIKE '%Manager%')
	
SELECT
	ROUND(m.manager_salary - a.analyst_salary , 2)AS salary_difference
FROM manager_wage m, analyst_wage  a

			-- Answer: 98790.63
			
-- Provide the average wage for all the states

SELECT
	g.state,
	ROUND(AVG(e.wage),2) AS Average_wage_per_state
FROM employ e
LEFT JOIN general g ON e.case_id = g.case_id
GROUP BY g.state
ORDER BY Average_wage_per_state DESC

-- The highest wage for the above query is Maine with an average salary of 141627.73. Which company is applying for such a high salary petition? List the top 5 companies and the wages.

SELECT
FROM	employ e
LEFT JOIN general g ON e.case_id =g.case_id




			
