-- Student Academic Success & Dropout Analysis
-- 03: Tuition payment status and dropout :)

SELECT
    CASE
        WHEN tuition_fees_up_to_date = 1 THEN 'Tuition Up to Date'
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
GROUP BY tuition_status
ORDER BY dropout_rate DESC;
