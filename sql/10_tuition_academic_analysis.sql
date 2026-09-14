-- Student Academic Success & Dropout Analysis
-- 10: Tuition status and first-semester academic performance

SELECT
    CASE
        WHEN curricular_units_1st_sem_grade < 10
             AND curricular_units_1st_sem_approved <= 2
            THEN 'Low Performance'
        ELSE 'Higher Performance'
    END AS academic_performance,
    CASE
        WHEN tuition_fees_up_to_date = 1
            THEN 'Tuition Up to Date'
        ELSE 'Tuition Not Up to Date'
    END AS tuition_status,
    COUNT(*) AS student_count,
    SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) AS dropout_count,
    ROUND(
        SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS dropout_rate
FROM students
WHERE curricular_units_1st_sem_grade > 0
GROUP BY academic_performance, tuition_status
ORDER BY academic_performance, tuition_status;
