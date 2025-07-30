-- Removing unnecessay rows and columns
-- Deleting rows where both total laid off and percentage laid off are NULL because that data is not useful
SELECT * 
FROM layoff_staging2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

DELETE FROM layoff_staging2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

-- Dropping column Row_num since it is not needed anymore
ALTER TABLE  layoff_staging2
DROP COLUMN Row_num

