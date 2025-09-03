/*
Question: What are the top skills based on salary? 
- Look at the average salary associated with each skill for Data Analyst positions
- Focus on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analists and
    helps identitfy the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25

/*
1. Big Data & Advanced Analytics Drive the Top Salaries
- PySpark ($208k) and Databricks ($141k) dominate the list, showing that analysts who can handle big data pipelines earn far more.
- Airflow ($126k) and Kubernetes ($132k) reinforce this — analysts who can automate workflows and deploy at scale are very valuable.

2. Cross-Over into Data Engineering & DevOps
- Tools like Bitbucket ($189k), GitLab ($154k), Jenkins ($125k), and Linux ($136k) are not traditional analyst skills — they’re engineering and DevOps tools.
- This shows that the highest-paying analyst roles are hybrid analyst–engineer jobs.

3. Data Science & Machine Learning Skills Add a Premium
- Pandas ($151k), NumPy ($144k), Scikit-learn ($126k), and Jupyter ($153k) push analysts closer to data science territory.
- Employers pay more for analysts who can build models or use ML frameworks instead of just reporting.

4. Cloud and Databases Are Key
- Couchbase ($160k), PostgreSQL ($124k), and GCP ($122k) highlight the shift to cloud-first, scalable systems.
- Companies want analysts who can query and manage modern DBs directly rather than depend on engineers.

5. Niche or Emerging Tools Pay Well:
- Watson ($160k) and DataRobot ($155k) show strong value for AI/automation tools.
- Swift ($153k) and Twilio ($127k) suggest high-paying but niche roles, likely at companies needing analysts to work closely with mobile or communication platforms.
- Notion ($125k) and Atlassian ($131k) stand out as collaboration/productivity tools being monetized in analyst workflows.

Takeaway:
The best-paying Data Analyst jobs in 2023 aren’t “traditional” analyst roles anymore. They blend big data, machine learning, DevOps, and cloud engineering skills with analytics. The closer you get to data engineering or applied ML, the bigger the paycheck.

*/