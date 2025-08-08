select * from layoffs;

create table layoffs_stagging like layoffs;

select * from layoffs_stagging;

insert layoffs_stagging
select * from layoffs;


select *, 
row_number() over(partition by company,location,
industry,total_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_stagging;

with duplicate_cte as (
select *, 
row_number() over(partition by company,location,
industry,total_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_stagging
)
select * from duplicate_cte where row_num=2;


CREATE TABLE `layoffs_stagging2` (
  `company` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `industry` text DEFAULT NULL,
  `total_laid_off` int(11) DEFAULT NULL,
  `percentage_laid_off` text DEFAULT NULL,
  `date` text DEFAULT NULL,
  `stage` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `funds_raised_millions` int(11) DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

select * from layoffs_stagging2;

insert into layoffs_stagging2
select *, 
row_number() over(partition by company,location,
industry,total_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_stagging
;

select * from layoffs_stagging2 where row_num > 1;

delete from layoffs_stagging2 where row_num > 1;

update layoffs_stagging2
set company = trim(company);

select distinct industry from layoffs_stagging2 order by 1;

select * from layoffs_stagging2 where industry like 'Crypto%';

update layoffs_stagging2
set industry = 'Crypto'
where industry like 'Crypto%';

select * from layoffs_stagging2
where industry = '' or industry is null;

select distinct country from layoffs_stagging2;

select country,trim(trailing '.' from country) from layoffs_stagging2;

update layoffs_stagging2
set country = trim(trailing '.' from country);

select `date`,str_to_date(`date`,'%m/%d/%Y') from layoffs_stagging2;

update layoffs_stagging2 
set `date` = str_to_date(`date`,'%m/%d/%Y');

select `date` from layoffs_stagging2;

alter table layoffs_stlayoffs_stagging2agging2
modify column `date` date;

select * from layoffs_stagging2 t1 join layoffs_stagging2 t2
 on t1.company = t2.company and t1.location = t2. location
 where (t1.industry is null or t1.industry = '')
 and t2.industry is not null and t2.industry != '';


select * from layoffs_stagging2 where industry = '' or industry is null;

update layoffs_stagging2 t1 join layoffs_stagging2 t2
 on t1.company = t2.company and t1.location = t2. location
 set t1.industry = t2.industry
 where (t1.industry is null or t1.industry = '')
 and t2.industry is not null and t2.industry != '';

select * from layoffs_stagging2
where total_laid_off is null and percentage_laid_off is null;

delete from layoffs_stagging2
where total_laid_off is null and percentage_laid_off is null;

alter table layoffs_stagging2
drop column row_num;