-- Student Academic Success & Dropout Analysis
-- 08: Investigation of zero first-semester grades

SELECT
    curricular_units_1st_sem_grade AS first_sem_grade,
    curricular_units_1st_sem_approved AS approved_units,
    curricular_units_1st_sem_enrolled AS enrolled_units,
    curricular_units_1st_sem_evaluations AS evaluations,
    target,
    COUNT(*) AS student_count
FROM students
WHERE curricular_units_1st_sem_grade = 0
GROUP BY
    curricular_units_1st_sem_grade,
    curricular_units_1st_sem_approved,
    curricular_units_1st_sem_enrolled,
    curricular_units_1st_sem_evaluations,
    target
ORDER BY student_count DESC;
