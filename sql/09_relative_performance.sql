-- Student Academic Success & Dropout Analysis
-- 09: First-semester performance relative to program average :)

WITH student_performance AS (
    SELECT
        course,
        target,
        curricular_units_1st_sem_grade,
        AVG(curricular_units_1st_sem_grade)
            OVER (PARTITION BY course) AS program_avg_grade
    FROM students
    WHERE curricular_units_1st_sem_grade > 0
)

SELECT
    CASE
        WHEN curricular_units_1st_sem_grade - program_avg_grade <= -2
            THEN '2+ Below Program Average'
        WHEN curricular_units_1st_sem_grade - program_avg_grade < -1
            THEN '1 to 2 Below Program Average'
        WHEN curricular_units_1st_sem_grade - program_avg_grade < 0
            THEN 'Less Than 1 Below Average'
        WHEN curricular_units_1st_sem_grade - program_avg_grade < 1
            THEN 'Less Than 1 Above Average'
        WHEN curricular_units_1st_sem_grade - program_avg_grade <= 2
            THEN '1 to 2 Above Program Average'
        ELSE '2+ Above Program Average'
    END AS relative_performance,
    COUNT(*) AS student_count,
    SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) AS dropout_count,
    ROUND(
        SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS dropout_rate
FROM student_performance
GROUP BY relative_performance
ORDER BY dropout_rate DESC;
