# College Access and Outcomes Analysis

## Overview

This repository contains the files and scripts used to analyze the relationship between college characteristics, access to higher education, and upward mobility outcomes. The analysis focuses on exploring how institutional features, such as instructional expenditures and faculty salaries, relate to mobility rates, while leveraging advanced statistical and visualization techniques to uncover actionable insights for policymakers and educators.

---

## File Structure

### 1. **Data Folder**
The `data` folder includes the following datasets used in the analysis:
- **`College Level Characteristics.csv`:** Contains detailed institutional data, including enrollment, tuition, faculty salary, and instructional expenditures.
- **`Preferred Estimates of Access and Outcomes.csv`:** Includes key access and outcome metrics such as upward mobility rates and socio-economic mobility.

### 2. **Scripts Folder**
The `scripts` folder contains the R script used for data processing, analysis, and visualization:
- **`College Analysis_Coding Sample.R`:** This R script performs:
  - Data merging and cleaning to integrate multiple datasets.
  - Regression analysis of mobility outcomes on college characteristics.
  - Binned scatter plots and other visualizations to highlight key trends and relationships.
  - Detailed tabular summaries of statistical findings.

### 3. **README.md**
This README file explains the purpose, structure, and usage of the repository.

---

## Analysis Details

### Data Preparation
- **Data Integration:** Merged the college characteristics and mobility datasets based on a common identifier (`super_opeid`) to ensure a cohesive dataset for analysis.
- **Feature Engineering:** Created derived variables, such as the natural log of instructional expenditures (`exp_instr_pc_2013_log`), to capture non-linear relationships.
- **Filtering:** Focused on specific institution categories, such as Ivy Plus and highly selective colleges, to provide targeted insights.

### Key Analyses
1. **Regression Analysis:**
   - Modeled mobility outcomes (`mr_kq5_pq1`) as a function of instructional expenditures and faculty salaries.
   - Evaluated the explanatory power of the model using R² and significance levels.

2. **Binned Scatter Plots:**
   - Visualized the relationship between instructional expenditures and mobility rates across deciles to uncover trends and non-linear effects.

4. **Access and Outcomes:**
   - Assessed disparities in access and outcomes across different institution types to inform equity-focused policy decisions.

---

## Instructions for Running the Analysis

### 1. Set Up Your Working Environment
- Set your working directory to the location of this repository.
- Ensure all file paths in `College Analysis_Coding Sample.R` match the file structure.

### 2. Install Required Libraries
The following R packages are necessary:
- `tidyverse` (data manipulation and visualization)
- `ggplot2` (visualization)
- `stargazer` (regression table generation)
- `knitr` (reporting and summaries)

Install these packages by running:
```R
install.packages(c("tidyverse", "ggplot2", "stargazer", "knitr"))
```

### 3. Run the Script
- Execute `College Analysis_Coding Sample.R` in R or RStudio.
- The script is modular, allowing you to run individual sections independently if desired.

---

## Outputs

The analysis produces the following results:
1. **Regression Results:**
   - A summary table evaluating the relationship between mobility outcomes and college characteristics.
2. **Visualizations:**
   - Scatter plots and histograms illustrating key trends, such as the impact of instructional expenditures on mobility rates.
3. **Processed Datasets:**
   - Cleaned and merged datasets ready for further analysis.
4. **Summaries:**
   - Tables and metrics providing insights into college-level access and outcomes.

---

## Contact

For questions, feedback, or collaboration opportunities, please contact:

**Gabriel Solis**  
Email: [solisgab@usc.edu](mailto:solisgab@usc.edu)
