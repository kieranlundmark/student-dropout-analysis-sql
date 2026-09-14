-- Student Academic Success & Dropout Analysis
-- 12: Age and tuition status in relation to dropout :)

SELECT
    CASE
        WHEN age_at_enrollment < 21 THEN 'Under 21'
        WHEN age_at_enrollment BETWEEN 21 AND 24 THEN '21-24'
        WHEN age_at_enrollment BETWEEN 25 AND 29 THEN '25-29'
        ELSE '30+'
    END AS age_group,
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
GROUP BY age_group, tuition_status
ORDER BY
    CASE age_group
        WHEN 'Under 21' THEN 1
        WHEN '21-24' THEN 2
        WHEN '25-29' THEN 3
        WHEN '30+' THEN 4
    END,
    tuition_status;
