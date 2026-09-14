-- Student Academic Success & Dropout Analysis
-- 11: First-semester to second-semester academic persistence

WITH semester_groups AS (
    SELECT
        CASE
            WHEN curricular_units_1st_sem_approved <= 2 THEN '0-2'
            WHEN curricular_units_1st_sem_approved BETWEEN 3 AND 4 THEN '3-4'
            WHEN curricular_units_1st_sem_approved = 5 THEN '5'
            WHEN curricular_units_1st_sem_approved = 6 THEN '6'
            ELSE '7+'
        END AS first_sem_group,
        CASE
            WHEN curricular_units_2nd_sem_approved <= 2 THEN '0-2'
            WHEN curricular_units_2nd_sem_approved BETWEEN 3 AND 4 THEN '3-4'
            WHEN curricular_units_2nd_sem_approved = 5 THEN '5'
            WHEN curricular_units_2nd_sem_approved = 6 THEN '6'
            ELSE '7+'
        END AS second_sem_group
    FROM students
    WHERE curricular_units_1st_sem_enrolled > 0
)

SELECT
    first_sem_group,
    second_sem_group,
    COUNT(*) AS student_count
FROM semester_groups
GROUP BY first_sem_group, second_sem_group
ORDER BY first_sem_group, second_sem_group;
