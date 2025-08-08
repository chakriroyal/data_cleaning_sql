# 🧹 Layoffs Data Cleaning Project (SQL)

This project focuses on cleaning and preparing a real-world layoff dataset for further analysis using **MySQL**. It includes identifying and removing duplicates, fixing null/missing values, standardizing inconsistent data formats, and handling string formatting issues.

## 🛠️ Technologies Used
- MySQL
- SQL Window Functions
- CTEs (Common Table Expressions)

## 📌 Key Tasks Performed
- Created staging tables and inserted raw data for transformation.
- Identified and removed duplicate rows using `ROW_NUMBER()` with partitioning.
- Trimmed whitespace and standardized text fields (e.g., `company`, `country`, `industry`).
- Converted date strings to proper `DATE` format using `STR_TO_DATE()`.
- Replaced inconsistent labels (e.g., all "Crypto..." variations standardized to "Crypto").
- Filled null `industry` values using self-joins based on matching `company` and `location`.
- Removed irrelevant rows with null values in key fields like `total_laid_off` and `percentage_laid_off`.

## 📁 File
- `data_cleaning_project.sql` – Contains all SQL queries used for cleaning and transforming the dataset.

## 📈 Outcome
The final cleaned dataset is ready for exploratory data analysis or visualization in tools like Power BI or Tableau.

