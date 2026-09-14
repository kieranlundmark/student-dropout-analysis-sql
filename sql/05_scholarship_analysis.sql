-- Student Academic Success & Dropout Analysis
-- 05: Scholarship status and dropout :)

SELECT
    CASE
        WHEN scholarship_holder = 1 THEN 'Scholarship Holder'
        ELSE 'Not Scholarship Holder'
    END AS scholarship_status,
    COUNT(*) AS student_count,
    SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) AS dropout_count,
    ROUND(
        SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS dropout_rate
FROM students
GROUP BY scholarship_status
ORDER BY dropout_rate DESC;
