CREATE DATABASE ibm_hr_analysis;
USE ibm_hr_analysis;
SHOW DATABASES;

RENAME TABLE `wa_fn-usec_-hr-employee-attrition`
TO hr_attrition;
USE ibm_hr_analysis;

SELECT *FROM hr_attrition
LIMIT 10;

SELECT COUNT(*) AS total_employees
FROM hr_attrition;

DESCRIBE hr_attrition;

SELECT DISTINCT Attrition
FROM hr_attrition;

SELECT
    Attrition,
    COUNT(*) AS employees
FROM hr_attrition
GROUP BY Attrition;

SELECT
    COUNT(*) AS total_employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_attrition;

SELECT
    Attrition,
    CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END AS attrition_flag
FROM hr_attrition
LIMIT 10;



#Q1: Attrition Rate by Department
SELECT
    Department,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_pct
FROM hr_attrition
GROUP BY Department
ORDER BY attrition_pct DESC;

#Q2: Does Salary Affect Attrition?
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low (under 3k)'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Mid (3k-6k)'
        WHEN MonthlyIncome BETWEEN 6000 AND 12000 THEN 'Upper Mid (6k-12k)'
        ELSE 'High (12k+)'
    END AS salary_band,
    
    COUNT(*) AS employees,
    
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_pct

FROM hr_attrition

GROUP BY salary_band
ORDER BY attrition_pct DESC;


#Q3: Overtime and Attrition

SELECT
    OverTime,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_pct
FROM hr_attrition
GROUP BY OverTime
ORDER BY attrition_pct DESC;


#Q4: Job Satisfaction vs Attrition

SELECT
    JobSatisfaction,

    CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS satisfaction_label,

    COUNT(*) AS employees,

    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_pct

FROM hr_attrition

GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


#Q5: Work-Life Balance Impact

SELECT
    WorkLifeBalance,

    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad'
        WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better'
        WHEN 4 THEN 'Best'
    END AS wlb_label,

    COUNT(*) AS employees,

    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_pct

FROM hr_attrition

GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


#Q6: Age Group Analysis

SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        ELSE 'Over 45'
    END AS age_group,

    COUNT(*) AS employees,

    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_pct,

    ROUND(AVG(MonthlyIncome), 0) AS avg_salary

FROM hr_attrition

GROUP BY age_group
ORDER BY attrition_pct DESC;

#Q7: Years Since Last Promotion

SELECT
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN 'Just promoted'
        WHEN YearsSinceLastPromotion BETWEEN 1 AND 2 THEN '1-2 years'
        WHEN YearsSinceLastPromotion BETWEEN 3 AND 5 THEN '3-5 years'
        ELSE 'Over 5 years'
    END AS promotion_gap,

    COUNT(*) AS employees,

    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_pct

FROM hr_attrition

GROUP BY promotion_gap
ORDER BY attrition_pct DESC;


#Q8: Employee Profile Most Associated With Attrition

SELECT
    Department,
    JobRole,
    OverTime,

    ROUND(AVG(MonthlyIncome), 0) AS avg_salary,

    ROUND(AVG(YearsSinceLastPromotion), 1) AS avg_years_since_promo,

    COUNT(*) AS employees,

    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_pct

FROM hr_attrition

GROUP BY
    Department,
    JobRole,
    OverTime

HAVING COUNT(*) >= 10

ORDER BY attrition_pct DESC

LIMIT 15;



#Department Attrition Ranking Using Window Function.

WITH department_attrition AS (
    SELECT
        Department,
        COUNT(*) AS total_employees,
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
        ROUND(
            100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS attrition_pct
    FROM hr_attrition
    GROUP BY Department
)

SELECT
    Department,
    total_employees,
    employees_left,
    attrition_pct,

    RANK() OVER (
        ORDER BY attrition_pct DESC
    ) AS attrition_rank

FROM department_attrition;




#Q10 – Department Salary vs Company Average.


SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS department_avg_income,

    (
        SELECT ROUND(AVG(MonthlyIncome), 2)
        FROM hr_attrition
    ) AS company_avg_income

FROM hr_attrition

GROUP BY Department

ORDER BY department_avg_income DESC;



#