-- Removing duplicate rows

-- Create table layoff_staging2 same as layoff_staging1 but with one extra column Row_num so that we can use it to delete the duplicates
CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `Row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copy contents of layoff_staging1 into layoff_staging2
INSERT INTO layoff_staging2
SELECT *,
	ROW_NUMBER() OVER (Partition BY company, 
    location, industry, total_laid_off, 
    percentage_laid_off, `date`, stage, 
    country, funds_raised_millions)
    AS Row_num
	FROM layoff_staging;
 
 -- Checking for duplicates
SELECT * FROM layoff_staging2
WHERE Row_num > 1;

-- Delete duplicates
DELETE FROM layoff_staging2
WHERE Row_num > 1

