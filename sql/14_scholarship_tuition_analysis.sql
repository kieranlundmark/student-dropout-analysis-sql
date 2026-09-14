-- Student Academic Success & Dropout Analysis
-- 14: Scholarship status and tuition status :)

SELECT
    CASE
        WHEN scholarship_holder = 1
            THEN 'Scholarship Holder'
        ELSE 'Not Scholarship Holder'
    END AS scholarship_status,
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
GROUP BY scholarship_status, tuition_status
ORDER BY
    scholarship_status,
    tuition_status;
