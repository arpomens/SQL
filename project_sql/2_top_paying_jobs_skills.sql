/*
Question: What are the top paying data analyst jobs?
- Identify the top 10 highest paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        -- job_location,
        -- job_schedule_type,
        salary_year_avg,
        -- job_posted_date,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        -- job_location = 'Anywhere' OR
        job_location = 'Canada' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC

/* The top-paying data analyst jobs in your dataset consistently favor:
SQL + Python + Big Data technologies (Spark/Hadoop)
The market appears to be shifting away from analysts who only create reports toward analysts who can:
Query data (SQL)
Automate analysis (Python)
Work with large datasets (Spark/Hadoop)
Build dashboards (Tableau/Power BI)
Operate in cloud environments (Azure/Databricks) 

[
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "sql"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "python"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "spark"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "hadoop"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "sql"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "python"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "spark"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "hadoop"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "sql"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "python"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "vba"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "excel"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "tableau"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "salary_year_avg": "108415.5",
    "company_name": "Swiss Re",
    "skills": "python"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "salary_year_avg": "108415.5",
    "company_name": "Swiss Re",
    "skills": "typescript"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "salary_year_avg": "108415.5",
    "company_name": "Swiss Re",
    "skills": "spark"
  },
  {
    "job_id": 1232872,
    "job_title": "Analytics Lab Architect",
    "salary_year_avg": "101014.0",
    "company_name": "Swiss Re",
    "skills": "azure"
  },
  {
    "job_id": 1232872,
    "job_title": "Analytics Lab Architect",
    "salary_year_avg": "101014.0",
    "company_name": "Swiss Re",
    "skills": "databricks"
  },
  {
    "job_id": 973984,
    "job_title": "Data Analyst - HoYolab and Content Creator",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "sql"
  },
  {
    "job_id": 973984,
    "job_title": "Data Analyst - HoYolab and Content Creator",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "excel"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "sql"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "python"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "sas"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "excel"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "sas"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "spss"
  },
  {
    "job_id": 1201997,
    "job_title": "Data Strategy Product Manager",
    "salary_year_avg": "99150.0",
    "company_name": "Kinaxis",
    "skills": "sap"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "sql"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "python"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "spark"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "hadoop"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "express"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "tableau"
  }
]

*/