SELECT 
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY 
   skills_dim.skills
ORDER BY
    avg_salary DESC
LIMIT 30;

/*
Insights from the Top 30 Highest-Paying Data Analyst Skills
1. Big Data & Cloud Skills Dominate High Salaries
PySpark ($208K), Databricks ($141K), Hadoop ($113K) – Spark and Hadoop are key technologies for handling large-scale data processing, making them highly valuable.
GCP ($122K), Kubernetes ($132K), Linux ($136K) – Cloud computing and containerization skills are essential for modern data analytics workflows.
2. Machine Learning & AI-Related Skills Pay Well
Watson ($160K), DataRobot ($155K), Scikit-Learn ($125K), Airflow ($126K) – AI, machine learning, and automated data pipelines drive higher salaries.
3. Version Control & DevOps Have Strong Demand
Bitbucket ($189K), GitLab ($154K), Jenkins ($125K) – These skills highlight the growing intersection of data analytics and software engineering.
4. Programming Languages & Data Manipulation are Key
Pandas ($151K), Numpy ($143K), Scala ($124K), Golang ($145K) – Expertise in Python libraries and functional programming languages is highly valued.
5. Niche Database & Visualization Tools Pay More
Couchbase ($160K), PostgreSQL ($123K), DB2 ($114K) – Specialized databases command high salaries.
MicroStrategy ($121K), Crystal Reports ($120K) – Premium salaries for less common BI tools.
Takeaways for High-Paying Data Analyst Roles
Data engineers with cloud & big data skills (PySpark, Databricks, Hadoop) tend to earn the highest salaries.
Machine learning & automation tools (Watson, Airflow, Scikit-Learn) provide a strong edge.
Advanced programming & DevOps skills (GitLab, Bitbucket, Kubernetes) are becoming increasingly relevant.
*/