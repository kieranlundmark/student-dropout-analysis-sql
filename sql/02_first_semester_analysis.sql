-- Student Academic Success & Dropout Analysis
-- 02: First-semester academic completion and dropout :)

SELECT
    CASE
        WHEN curricular_units_1st_sem_approved <= 2 THEN '0-2'
        WHEN curricular_units_1st_sem_approved BETWEEN 3 AND 4 THEN '3-4'
        WHEN curricular_units_1st_sem_approved = 5 THEN '5'
        WHEN curricular_units_1st_sem_approved = 6 THEN '6'
        ELSE '7+'
    END AS approved_units_group,
    COUNT(*) AS student_count,
    SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) AS dropout_count,
    ROUND(
        SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS dropout_rate
FROM students
WHERE curricular_units_1st_sem_enrolled > 0
GROUP BY approved_units_group
ORDER BY
    CASE approved_units_group
        WHEN '0-2' THEN 1
        WHEN '3-4' THEN 2
        WHEN '5' THEN 3
        WHEN '6' THEN 4
        WHEN '7+' THEN 5
    END;
