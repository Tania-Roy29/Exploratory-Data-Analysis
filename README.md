Exploratory Data Analysis on Layoff Data (2020–2023)
This project contains a SQL-based exploratory analysis of layoff trends across companies and industries between 2020 and 2023. The goal is to uncover insights such as which industries were most affected, which companies had the highest layoffs, and how layoffs changed over time.

Data Cleaning:
Before diving into analysis, the dataset was cleaned and pre-processed using the following techniques:
- Removed rows with missing or invalid values (especially in date, company, and total_laid_off)
- Standardized inconsistent entries (e.g., company names and industry labels)
- Converted date values to consistent formats for time-based aggregation
- Removed duplicates
- Handled nulls in key columns

Key SQL Queries and Insights:
- Total layoffs by company: Identified which companies laid off the most employees across the 4-year span.
- Total layoffs by industry: Highlighted industries most impacted by layoffs.
- Layoffs by year: Found which year experienced the highest number of layoffs.
- Rolling layoffs over time: Tracked cumulative layoffs month by month to identify peaks and trends.
- Top 5 companies by layoffs per year: Ranked companies by total layoffs on a yearly basis.
- Top 3 industries by layoffs per year: Ranked industries by total layoffs annually.

Visualization:
-  Built an interactive Power BI dashboard showcasing layoffs by sector, geography, and time period, enabling stakeholders to track macroeconomic workforce patterns.

Tools Used:
- SQL (MySQL/PostgreSQL syntax)
- Power BI
- Git for version control
- GitHub for hosting and documentation

