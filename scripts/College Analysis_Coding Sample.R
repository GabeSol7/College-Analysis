########################################################
# Title: Analysis of College Characteristics and Student Mobility
# Date Created: October 17th, 2024
#
# Purpose: This script analyzes relationships between institutional 
# characteristics and student outcomes in higher education,
# specifically focusing on how instructional expenditures 
# relate to student mobility rates. The analysis includes:
# 1. Data preprocessing and merging of institutional datasets
# 2. Regression analysis of mobility rates on expenditures
# 3. Visualization of relationships using binned scatter plots
#
# Author: Gabriel Solis (solisgab@usc.edu)
########################################################

# Setting working directory
setwd("/Users/gabrielsolis/Desktop/SolisGabriel_OI_Data Task")

# Loading necessary libraries
library(tidyverse)
library(readr)
library(stargazer)
library(jtools)
library(ggthemes)

# Loading the datasets
# Dataset 1: Contains student mobility metrics by institution
# Dataset 2: Contains institutional characteristics and financial data
mobility_data <- read.csv("Data/Preferred Estimates of Access and Mobility Rates by College.csv")
college_data <- read.csv("Data/College Level Characteristics.csv")

##------------------------ Data Preparation ------------------------##

# 1. Merging datasets based on institution identifier
merged_data <- mobility_data %>%
  left_join(college_data, by = 'super_opeid')

# 2. Removing specific institutions based on data quality concerns
merged_data <- merged_data %>%
  filter(!super_opeid %in% c(1585, 1426))

# 3. Filtering for specific institutional categories
merged_data <- merged_data %>%
  filter(tier %in% c('Highly selective public',
                     'Highly selective private',
                     'Other elite schools (public and private)',
                     'Ivy Plus',
                     'Selective private',
                     'Selective public'))

# 4. Creating log-transformed expenditure variable
merged_data <- merged_data %>%
  mutate(exp_instr_pc_2013_log = log(exp_instr_pc_2013))

##------------------------ Regression Analysis ------------------------##

# Analyzing relationship between mobility rates and expenditures
# Controlling for faculty salary to account for institutional resources
mobility_model <- lm(mr_kq5_pq1 ~ exp_instr_pc_2013_log + avgfacsal_2013, 
                     data = merged_data)

# Displaying detailed model results
summ(mobility_model, digits = 3)

# Generating publication-ready regression table
stargazer(mobility_model, 
          type = "latex",
          title = "Impact of Institutional Expenditures on Student Mobility",
          digits = 3,
          single.row = TRUE,
          no.space = TRUE,
          header = FALSE
)

##------------------------ Visualization ------------------------##

# Creating binned scatter plot to visualize relationship
# 1. Dividing data into deciles based on expenditure
merged_data <- merged_data %>%
  mutate(decile = ntile(exp_instr_pc_2013_log, 10))

# 2. Computing mean values for each decile
decile_means <- merged_data %>%
  group_by(decile) %>%
  summarise(mean_mobility = round(mean(mr_kq5_pq1, na.rm = TRUE), 3),
            mean_expenditure = round(mean(exp_instr_pc_2013_log, na.rm = TRUE), 3))

# 3. Creating the visualization
ggplot(decile_means, aes(x = mean_expenditure, y = mean_mobility)) +
  geom_line(size = 1, color = "black") +
  geom_point(size = 2, shape = 21, fill = "white",
             color = 'black') + 
  labs(x = "\nLog Instructional Expenditure per Student (2013)",
       y = "Student Mobility Rate\n",
       title = "Relationship Between Institutional Spending and Student Mobility",
       subtitle = "Analysis by Expenditure Deciles") +
  theme_minimal() +
  theme_set(theme_bw()) +
  theme_update(text = element_text(size=12),
               panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               strip.background = element_blank())

# Saving the plot
ggsave("expenditure_mobility_relationship.png", width = 8, height = 6)

# Summary statistics for specific deciles
decile_stats <- decile_means %>%
  filter(decile == 8) %>%
  select(mean_mobility) %>%
  print()
