SELECT * FROM layoffs;


CREATE TABLE layoffs_stagging
LIKE layoffs;

INSERT layoffs_stagging
SELECT * FROM layoffs;

SELECT * FROM layoffs_stagging
order by company ;



SELECT  DISTINCT company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions
FROM layoffs_stagging
order by company;

SELECT DISTINCT 
    TRIM('&'FROM TRIM('#' FROM company)) AS company,
    TRIM(location) AS location,
    TRIM(industry) AS industry,
    total_laid_off,          
    percentage_laid_off,     
    `date`,                  
    TRIM(stage) AS stage,
    TRIM(TRAILING '.' FROM country) AS country,
    funds_raised_millions    
FROM layoffs_stagging
ORDER BY 1;

UPDATE layoffs_stagging
SET company= TRIM('&'FROM TRIM('#' FROM company));


select  *
from layoffs_stagging
order by 1;


UPDATE  layoffs_stagging
SET industry ='Crpyto'
WHERE industry like 'Crypto%';

SELECT `date`,STR_TO_DATE(`date`,'%m/%d/%Y') 
FROM  layoffs_stagging;

UPDATE layoffs_stagging
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

SELECT * 
FROM layoffs_stagging
ORDER BY 1;

ALTER TABLE layoffs_stagging
MODIFY COLUMN `date` DATE;

SELECT * 
FROM layoffs_stagging
ORDER BY 1;

SELECT * 
FROM layoffs_stagging
WHERE company is NULL AND company is NULL;


UPDATE layoffs_stagging
SET industry=NULL
WHERE industry = '';


SELECT t1.industry,t2.industry
FROM layoffs_stagging t1
JOIN layoffs_stagging t2
    ON t1.company= t2.company
WHERE (t1.industry IS NULL OR t1.industry='')
AND  t2.industry IS NOT NULL;


UPDATE layoffs_stagging t1
JOIN layoffs_stagging t2
    ON t1.company= t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry='')
AND  t2.industry IS NOT NULL;


SELECT * FROM layoffs_stagging
WHERE company = 'Airbnb';


SELECT *
FROM layoffs_stagging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE 
FROM layoffs_stagging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


SELECT * FROM layoffs_stagging;

