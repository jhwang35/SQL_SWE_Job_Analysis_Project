/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Software Engineer positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Software Engineers and 
    helps identify the most financially rewarding skills to acquire or improve
- Need skills from skills_dim and salary
*/

SELECT 
    skills, 
    ROUND(AVG(salary_year_avg), 0) AS avg_salary -- 0 indicates how many decimal places we round to 
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id -- joins the job id's together 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id -- allows us to access skill name and type
WHERE 
    job_title_short = 'Software Engineer' 
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25
/*
Insights:
NoSQL Databases: Skills in NoSQL databases such as Cassandra, Couchbase, and DynamoDB are highly valued, reflecting the industry's shift towards flexible, scalable data management solutions.
Cloud and DevOps: Skills related to cloud platforms and services (Aurora, AWS, Atlassian) indicate a strong demand for professionals who can manage and deploy applications in the cloud.
Programming Languages: Traditional languages like C and Assembly remain valuable for system-level programming, while modern languages like Go, Julia, and Clojure are gaining traction for their performance and simplicity.
Web Development: Frameworks and tools for web development (ASP.NET Core, Ruby on Rails, Node.js, Next.js, Express) continue to offer competitive salaries, underscoring the ongoing need for web-based applications and services.
Data Analytics and Visualization: Skills in data analytics and visualization tools (Matplotlib, Alteryx, Looker) highlight the importance of data-driven decision-making in businesses.
These insights can help software engineers target their learning and career development efforts towards high-paying skills that are in demand.
*/