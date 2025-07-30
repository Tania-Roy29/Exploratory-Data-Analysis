-- Exploratory Data Analysis (EDA)
-- Checking the total number of employees laid off by the companies over the years between 2020 to 2023
SELECT company, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company
ORDER BY 2 DESC;

 -- Checking the total number of employees laid off industry wise over the years between 2020 to 2023
SELECT industry, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- Checking which year had the highest layoffs
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoff_staging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;


-- Getting the Rolling total for month-year
WITH year_month_cte AS 
(
	SELECT SUBSTRING(`date`,1,7) AS `Year_month`, SUM(total_laid_off) AS total_laid
	FROM  layoff_staging2
	WHERE SUBSTRING(`date`,1,7) IS NOT NULL
	GROUP BY `Year_month`
	ORDER BY 1
)
SELECT 
`Year_month`,
total_laid,
SUM(total_laid) OVER ( ORDER BY `Year_month`) AS cumilative_total
FROM year_month_cte;


-- This shows the top 5 companies which had lay offs year wise
WITH Company_year AS
(
SELECT company, 
YEAR(`date`) As Years, 
SUM(total_laid_off) AS Total_laid_off
FROM layoff_staging2
GROUP BY company, YEAR(`date`)
),
Company_year_ranking AS
(
SELECT *,
DENSE_RANK() OVER (PARTITION BY Years ORDER BY Total_laid_off DESC) AS Ranking
FROM Company_year
WHERE Years IS NOT NULL
)
SELECT *
FROM Company_year_ranking
WHERE Ranking <=5;

-- This shows the top 3 industries which had lay offs year wise
WITH Industry_year AS
(
SELECT industry, 
YEAR(`date`) As Years, 
SUM(total_laid_off) AS Total_laid_off
FROM layoff_staging2
GROUP BY industry, YEAR(`date`)
),
industry_year_ranking AS
(
SELECT *,
DENSE_RANK() OVER (PARTITION BY Years ORDER BY Total_laid_off DESC) AS Ranking
FROM Industry_year
WHERE Years IS NOT NULL
)
SELECT *
FROM industry_year_ranking
WHERE Ranking <=3;

