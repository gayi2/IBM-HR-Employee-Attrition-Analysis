# IBM-HR-Employee-Attrition-Analysis


## 📌 Project Overview

Employee attrition is an important challenge for organizations because high employee turnover can increase recruitment costs, reduce productivity, and affect overall team performance.

This project analyzes the **IBM HR Analytics Employee Attrition dataset** using **MySQL** to identify patterns associated with employees leaving the company.

The analysis focuses on factors such as department, monthly income, overtime, job satisfaction, work-life balance, age, and promotion history. SQL techniques including **CASE statements, aggregations, subqueries, CTEs, and window functions** are used to transform the HR data into meaningful business insights.

---

## 🎯 Business Objective

The main objective of this project is to understand the factors associated with employee attrition and answer the following questions:

1. What is the overall employee attrition rate?
2. Which department has the highest attrition rate?
3. Does monthly income appear to be associated with attrition?
4. How does overtime relate to employee attrition?
5. Does job satisfaction differ across attrition levels?
6. How does work-life balance relate to attrition?
7. Which age groups have higher attrition rates?
8. Is the time since an employee's last promotion associated with attrition?
9. What employee profiles appear in the highest-attrition groups?

---

## 📊 Dataset

**Dataset:** IBM HR Analytics Employee Attrition & Performance

**Source:** Kaggle — IBM HR Analytics Attrition Dataset

The dataset contains **1,470 employee records** and **35 HR-related attributes**.

Some of the important variables used in this analysis include:

* Age
* Attrition
* Department
* JobRole
* MonthlyIncome
* OverTime
* JobSatisfaction
* WorkLifeBalance
* DistanceFromHome
* PerformanceRating
* YearsAtCompany
* YearsInCurrentRole
* YearsSinceLastPromotion

---

## 🛠️ Tools & Technologies

* **MySQL**
* **MySQL Workbench**
* **SQL**
* **GitHub**

### SQL Concepts Used

* SELECT statements
* WHERE clauses
* CASE statements
* GROUP BY
* ORDER BY
* HAVING
* COUNT(), SUM(), AVG()
* Advanced aggregations
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* RANK()

---

## 🔍 Analysis

### 1. Overall Employee Attrition

The first analysis calculated the total number of employees, number of employees who left the company, and the overall attrition rate.

**Result:**

* Total Employees: **1,470**
* Employees Who Left: **237**
* Overall Attrition Rate: **16.12%**

This provides the baseline attrition level used for comparison throughout the rest of the analysis.

---

### 2. Attrition by Department

Employee attrition was analyzed across different departments to determine whether certain departments experienced higher employee turnover.

The analysis compared:

* Total employees in each department
* Number of employees who left
* Attrition percentage

**Key Finding:**
[Add the department with the highest attrition rate and its percentage from your MySQL result.]

---

### 3. Salary and Attrition

Employees were divided into four monthly income groups using SQL CASE statements:

* Low — Under 3,000
* Mid — 3,000 to 6,000
* Upper Mid — 6,000 to 12,000
* High — Above 12,000

The attrition rate for each salary group was calculated to examine the relationship between employee income and attrition.

**Key Finding:**
[Add the salary band with the highest attrition rate and its percentage.]

---

### 4. Overtime and Attrition

Employees were grouped according to whether they worked overtime.

The attrition rate of employees working overtime was compared with employees who did not work overtime.

**Key Finding:**
Employees working overtime had an attrition rate of **[XX%]**, compared with **[XX%]** among employees who did not work overtime.

This indicates whether overtime is strongly associated with employee attrition in this dataset.

---

### 5. Job Satisfaction and Attrition

Job satisfaction was analyzed using the four satisfaction levels available in the dataset:

| Rating | Satisfaction Level |
| ------ | ------------------ |
| 1      | Low                |
| 2      | Medium             |
| 3      | High               |
| 4      | Very High          |

Attrition rates were calculated for each satisfaction level.

**Key Finding:**
[Add the satisfaction category with the highest attrition rate and the result.]

---

### 6. Work-Life Balance and Attrition

Work-life balance was analyzed across four categories:

| Rating | Work-Life Balance |
| ------ | ----------------- |
| 1      | Bad               |
| 2      | Good              |
| 3      | Better            |
| 4      | Best              |

The analysis was performed to understand whether differences in work-life balance were associated with employee attrition.

**Key Finding:**
[Add your MySQL result here.]

---

### 7. Age Group Analysis

Employees were divided into age groups:

* Under 25
* 25–35
* 36–45
* Over 45

For each group, the analysis calculated:

* Number of employees
* Attrition rate
* Average monthly income

**Key Finding:**
[Add the age group with the highest attrition rate and its percentage.]

---

### 8. Promotion Gap Analysis

Employees were categorized based on the number of years since their last promotion:

* Just promoted
* 1–2 years
* 3–5 years
* Over 5 years

The analysis examined whether longer periods without promotion were associated with higher attrition.

**Key Finding:**
[Add your result here.]

---

### 9. High-Attrition Employee Profiles

A combined analysis was performed using:

* Department
* Job Role
* Overtime
* Average Monthly Income
* Average Years Since Last Promotion
* Attrition Rate

Groups containing fewer than 10 employees were excluded to reduce the influence of very small groups.

This analysis was designed to identify combinations of employee characteristics associated with particularly high attrition rates.

**Key Finding:**
[Add the highest-attrition employee profile from your Q8 result.]

---

## 🧠 Advanced SQL Analysis

In addition to standard aggregation queries, the project uses advanced SQL techniques.

### Window Functions

A Common Table Expression (CTE) and the `RANK()` window function were used to rank departments according to their attrition rates.

This demonstrates the use of:

`RANK() OVER (ORDER BY attrition_rate DESC)`

### Subqueries

A subquery was used to compare average employee income at the department level with the overall company average income.

This made it possible to analyze department-level compensation in the context of the organization as a whole.

---

## 💡 Key Business Insights

Based on the analysis:

* The company's overall employee attrition rate is **16.12%**.
* **[Department]** recorded the highest department-level attrition rate.
* The **[Salary Band]** income group recorded the highest attrition rate.
* Employees working overtime had an attrition rate of **[XX%]**, compared with **[XX%]** for employees not working overtime.
* **[Age Group]** employees recorded the highest attrition rate among the analyzed age groups.
* Job satisfaction and work-life balance showed different attrition patterns across their respective categories.
* The combined employee-profile analysis identified specific combinations of department, job role, overtime, salary, and promotion history associated with higher attrition.

These findings represent **associations within this dataset** and should not be interpreted as proof that any individual factor directly causes employees to leave.

---

## 💼 Business Recommendations

Based on the patterns identified in the analysis, HR teams could investigate high-attrition groups in greater detail and consider targeted retention initiatives.

Potential areas for further investigation include:

* Reviewing overtime workload in groups with elevated attrition.
* Examining compensation differences across high-attrition employee groups.
* Monitoring employee satisfaction and work-life balance indicators.
* Reviewing career development and promotion opportunities.
* Conducting targeted employee surveys or exit-interview analysis to understand the reasons behind the observed SQL patterns.

These actions should be validated using additional employee feedback and HR data before making policy decisions.

---

## 📁 Project Structure

```text
IBM-HR-Employee-Attrition-Analysis/
│
├── README.md
├── ibm_hr_attrition_analysis.sql
│
└── dataset/
    └── WA_Fn-UseC_-HR-Employee-Attrition.csv
```

---

## 📚 Skills Demonstrated

This project demonstrates practical experience in:

* SQL-based data analysis
* HR analytics
* CASE statements
* Data aggregation
* GROUP BY and HAVING
* Subqueries
* Common Table Expressions
* Window functions
* Business problem solving
* Data interpretation
* Translating SQL results into business insights

---

## 🚀 Conclusion

This project demonstrates how SQL can be used to analyze employee attrition and transform raw HR data into actionable business information.

By examining department, compensation, overtime, satisfaction, work-life balance, age, and promotion history, the analysis identifies employee groups with different attrition patterns.

The project also demonstrates intermediate SQL skills through the use of **CASE statements, advanced aggregations, subqueries, CTEs, and window functions**, while connecting technical analysis with a real-world HR business problem.
