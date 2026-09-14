-- Student Academic Success & Dropout Analysis
-- 07: Program of study and dropout :)

SELECT
    CASE course
        WHEN 33 THEN 'Biofuel Production Technologies'
        WHEN 171 THEN 'Animation and Multimedia Design'
        WHEN 8014 THEN 'Social Service - Evening'
        WHEN 9003 THEN 'Agronomy'
        WHEN 9070 THEN 'Communication Design'
        WHEN 9085 THEN 'Veterinary Nursing'
        WHEN 9119 THEN 'Informatics Engineering'
        WHEN 9130 THEN 'Equinculture'
        WHEN 9147 THEN 'Management'
        WHEN 9238 THEN 'Social Service'
        WHEN 9254 THEN 'Tourism'
        WHEN 9500 THEN 'Nursing'
        WHEN 9556 THEN 'Oral Hygiene'
        WHEN 9670 THEN 'Advertising and Marketing Management'
        WHEN 9773 THEN 'Journalism and Communication'
        WHEN 9853 THEN 'Basic Education'
        WHEN 9991 THEN 'Management - Evening'
    END AS program,
    COUNT(*) AS student_count,
    SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) AS dropout_count,
    ROUND(
        SUM(CASE WHEN target = 'Dropout' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS dropout_rate
FROM students
GROUP BY course
HAVING COUNT(*) >= 100
ORDER BY dropout_rate DESC;
