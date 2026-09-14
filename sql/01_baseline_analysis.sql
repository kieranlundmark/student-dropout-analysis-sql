-- Student Academic Success & Dropout Analysis
-- 01: Baseline outcome distribution :)

SELECT
    target,
    COUNT(*) AS student_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM students
GROUP BY target
ORDER BY student_count DESC;
