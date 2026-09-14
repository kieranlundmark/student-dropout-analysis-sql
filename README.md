# Student Academic Success & Dropout Analysis Using SQL

## Overview

In this personal project I analyzed student academic success and dropout patterns using SQL and data from the public UCI Machine Learning Repository.

My goal was to investigate which demographic, academic, financial, and enrollment-related characteristics are associated with student dropout, with particular attention to whether meaningful differences can be observed from students' early academic performance.

The analysis was conducted using **PostgreSQL** and includes data cleaning, conditional aggregation, common table expressions (CTEs), window functions, and multi-variable stratification.

---

## Research Question

> **What student characteristics and early academic indicators are associated with student dropout?**

---

## Dataset

The analysis uses the **Predict Students' Dropout and Academic Success** dataset from the UCI Machine Learning Repository.

* **4,424 student records**
* **36 predictor variables**
* **3 outcome categories:** Dropout, Enrolled, Graduate
* Academic, demographic, financial, and socioeconomic information
* First- and second-semester academic performance data

### Outcome Distribution

| Outcome  | Students | Percentage |
| -------- | -------: | ---------: |
| Graduate |    2,209 |      49.9% |
| Dropout  |    1,421 |      32.1% |
| Enrolled |      794 |      18.0% |

The overall observed dropout rate of **32.1%** serves as a baseline for comparisons throughout the analysis.

---

## Key Findings

### 1. First-Semester Academic Completion

First-semester course completion showed the strongest early relationship with eventual dropout in the analysis.

| Approved Units | Students | Dropout Rate |
| -------------- | -------: | -----------: |
| 0–2            |    1,005 |   **77.11%** |
| 3–4            |      702 |   **42.31%** |
| 5              |      723 |   **20.06%** |
| 6              |    1,171 |    **9.99%** |
| 7+             |      823 |   **10.57%** |

Students who approved 0–2 courses during their first semester had a substantially higher observed dropout rate than students who approved 5 or more courses.

This relationship suggests that differences in academic progress may be observable relatively early in a student's enrollment.

---

### 2. Tuition Payment Status

Tuition status was also strongly associated with student outcome.

| Tuition Status | Students | Dropout Rate |
| -------------- | -------: | -----------: |
| Not Up to Date |      528 |   **86.55%** |
| Up to Date     |    3,896 |   **24.74%** |

The observed difference between the two groups was **61.81 percentage points**.

Further stratification showed that the relationship between tuition status and dropout remained substantial across different age groups and academic-performance groups.

---

### 3. Age at Enrollment

Dropout rates increased substantially across older age groups.

| Age Group | Students | Dropout Rate |
| --------- | -------: | -----------: |
| Under 21  |    2,551 |   **21.25%** |
| 21–24     |      735 |   **33.74%** |
| 25–29     |      427 |   **57.61%** |
| 30+       |      711 |   **54.15%** |

Age was also useful for evaluating other relationships because some variables that initially appeared important became weaker after accounting for differences in age composition.

---

### 4. Scholarship Status

Scholarship status showed a meaningful difference in observed dropout rates.

| Scholarship Status     | Students | Dropout Rate |
| ---------------------- | -------: | -----------: |
| Not Scholarship Holder |    3,325 |   **38.71%** |
| Scholarship Holder     |    1,099 |   **12.19%** |

The difference was **26.52 percentage points**.

The relationship remained present when examining scholarship status alongside age and tuition status, although some smaller subgroups contained relatively few observations.

---

### 5. Gender

The dataset also showed a substantial difference in dropout rates by gender.

| Gender | Students | Dropout Rate |
| ------ | -------: | -----------: |
| Male   |    1,556 |   **45.05%** |
| Female |    2,868 |   **25.10%** |

The difference was approximately **19.95 percentage points**.

Importantly, the difference remained observable after stratifying students by both age and first-semester academic completion.

---

### 6. Program of Study

Dropout rates varied considerably across academic programs.

Among programs with at least 100 students, observed dropout rates ranged from approximately **55% to 15%**.

Some of the highest observed rates occurred in:

* Equinculture
* Informatics Engineering
* Management — Evening

Some of the lowest occurred in:

* Nursing
* Social Service
* Communication Design

Program differences were interpreted alongside other characteristics, particularly age, rather than being treated as isolated effects.

---

## Multi-Variable Analysis

Rather than relying exclusively on one-variable comparisons, the analysis used stratification to investigate whether relationships persisted after considering other factors.

Examples include:

* **Age × Tuition Status**
* **Gender × First-Semester Completion**
* **Scholarship × Tuition Status**
* **Tuition × Academic Performance**

These analyses helped distinguish relationships that remained relatively consistent from those that appeared to be driven partly by another variable.

---

## Data Quality Investigation

An important part of the analysis involved investigating zero values in the semester-grade variables.

The dataset contained:

* **718 students with a first-semester grade of 0**
* **870 students with a second-semester grade of 0**

These zero values were not automatically treated as ordinary academic grades. Investigation of related coursework variables showed that zero-grade records could contain students with enrolled courses and evaluations, indicating that the value required additional interpretation.

For analyses treating grades as numerical academic performance, zero-grade observations were therefore excluded rather than interpreted as conventional grades.

The students themselves were **not removed from the overall dataset**.

---

## SQL Techniques Demonstrated

This project uses a range of SQL techniques, including:

* `SELECT`, `WHERE`, `GROUP BY`, and `ORDER BY`
* `CASE` expressions for categorical transformations
* Conditional aggregation
* Aggregate functions such as `COUNT`, `SUM`, and `AVG`
* Common Table Expressions (`WITH`)
* Window functions
* `PARTITION BY`
* Multi-variable stratification
* Data-quality investigation
* Filtering and grouping of analytical populations

A particularly useful application of window functions was comparing each student's first-semester grade with the average grade within their academic program.

---

## Project Structure

```text
student-dropout-analysis-sql/
│
├── README.md
│
└── sql/
    ├── 01_baseline_analysis.sql
    ├── 02_first_semester_analysis.sql
    ├── 03_tuition_analysis.sql
    ├── 04_age_analysis.sql
    ├── 05_scholarship_analysis.sql
    ├── 06_gender_analysis.sql
    ├── 07_program_analysis.sql
    ├── 08_data_quality_analysis.sql
    ├── 09_relative_performance.sql
    ├── 10_tuition_academic_analysis.sql
    ├── 11_semester_persistence.sql
    ├── 12_age_tuition_analysis.sql
    ├── 13_gender_academic_analysis.sql
    └── 14_scholarship_tuition_analysis.sql
```

---

## Limitations

This project identifies **associations**, not causal relationships.

For example, the strong relationship between tuition status and dropout does not establish that being behind on tuition directly causes a student to drop out. Similarly, differences between demographic groups should not be interpreted as causal effects.

The project also does not build or validate a predictive machine-learning model. The findings are descriptive and exploratory.

Future analysis could extend this work using statistical modeling to evaluate the independent contribution of different variables and assess predictive performance.

---

## Data Source

**UCI Machine Learning Repository — Predict Students' Dropout and Academic Success**

Dataset developed from student records containing demographic, academic, socioeconomic, and enrollment information.

Source: https://archive.ics.uci.edu/dataset/697/predict+students+dropout+and+academic+success
