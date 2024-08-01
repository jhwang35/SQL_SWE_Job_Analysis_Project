/*
Question: What skills are required for the top-paying software engineer jobs?
- Use the top 10 highest-paying Software Engineer jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

-- can use subquery or CTE
-- connecting skills_job_dim table and skills_dim table for skill id and skill name

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Software Engineer' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*, --selects all columns from top_paying_jobs table
    skills -- from skills dim table
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id -- joins the job id's together 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id -- allows us to access skill name and type
ORDER BY
    salary_year_avg DESC; 
