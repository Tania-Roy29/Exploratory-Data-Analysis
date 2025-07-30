
-- checking for duplicates
WITH duplicate_cte AS
(
	SELECT *,
	ROW_NUMBER() OVER (Partition BY company, 
    location, industry, total_laid_off, 
    percentage_laid_off, `date`, stage, 
    country, funds_raised_millions)
    AS Row_num
	FROM layoff_staging
) 
SELECT * FROM duplicate_cte
WHERE Row_num > 1;


