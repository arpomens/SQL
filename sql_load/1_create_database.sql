-- CREATE DATABASE sql_course;

-- DROP DATABASE IF EXISTS sql_course;

SELECT
    COUNT(job_id) AS job_count,
    job_title_short,
    job_location,
    CASE   
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
GROUP BY job_count;