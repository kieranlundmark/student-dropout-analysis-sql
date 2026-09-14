-- Student Academic Success & Dropout Analysis
-- 06: Gender and dropout

SELECT
    CASE
        WHEN gender = 1 THEN 'Male'
        ELSE 'Female'
    END AS gender,
    COUNT(*) AS student_count,
    SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) AS dropout_count,
    ROUND(
        SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS dropout_rate
FROM students
GROUP BY gender
ORDER BY dropout_rate DESC;
