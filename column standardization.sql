-- Standardize the columns

-- Remove spaces from company
UPDATE layoff_staging2
SET company = TRIM(company);

-- Remove '.' From United States
SELECT DISTINCT country
FROM layoff_staging2
ORDER BY 1;

UPDATE layoff_staging2
SET  country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- Update date column to date format (datatype is still string)
UPDATE layoff_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

-- Update date colmn to date datatype
ALTER TABLE layoff_staging2
MODIFY COLUMN `date` date