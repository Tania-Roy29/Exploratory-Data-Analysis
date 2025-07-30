-- Dealing with Null and blank values
-- Setting blank to null since no operation can be performed on blank
UPDATE layoff_staging2
SET industry = NULL
WHERE industry = '';

-- Checking fields on whch the Null filing operation will be performed
SELECT t1.industry, t2.industry
FROM layoff_staging2 t1
JOIN layoff_staging2 t2
ON t1.company = t2.company AND t1.company = t2.company
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

-- Update Null with values. Same companies should belong to the same industry. Example: Airbnb should always be travel so filling all blank industries for airbnb with travel
UPDATE layoff_staging2 t1
JOIN layoff_staging2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL;

-- We are not updating the total laid off or percentage laid off since it is not possible to calculate without details about the total employees in the company