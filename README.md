# Car Price Analysis: A Statistical Modeling Project

## Overview
This project presents a comprehensive statistical analysis of car pricing data using **R**. It applies various techniques including exploratory data analysis (EDA), hypothesis testing, linear regression, and ANOVA to uncover key factors influencing car prices and to build predictive models.

## Dataset
- **Source:** Car Prices Dataset – [Kaggle](https://www.kaggle.com/)
- **Size:** 1,436 observations × 10 variables  
- **Target Variable:** `Price`

### Variables Description

| Variable   | Type       | Description                                      |
|------------|------------|--------------------------------------------------|
| Price      | Continuous | Car price (target variable)                     |
| Age        | Continuous | Age of the car in months                        |
| KM         | Continuous | Kilometers driven                               |
| FuelType   | Categorical| Type of fuel (Diesel, Petrol, CNG)              |
| HP         | Continuous | Horsepower                                      |
| CC         | Continuous | Engine size in cubic centimeters                |
| Doors      | Discrete   | Number of doors                                 |
| Weight     | Continuous | Weight of the car                               |
| Automatic  | Binary     | Transmission type (0=Manual, 1=Automatic)       |
| MetColor   | Binary     | Metallic color (0=No, 1=Yes)                    |

## Project Structure
├── code.R # Main analysis script
├── Data.csv # Dataset
└── README.md # Project documentation



## Analysis Components

### 1. Exploratory Data Analysis
- Summary statistics for all variables  
- Histograms, boxplots for distributions  
- Missing data checks  
- Correlation matrix  

### 2. Data Visualization
- Univariate plots (histograms, bar charts)  
- Bivariate plots (scatter plots, box plots)  

### 3. Statistical Testing
- **Normality Tests:** Shapiro-Wilk, Kolmogorov-Smirnov  
- **Hypothesis Testing:**
  - T-tests (e.g., Age groups, Fuel types)
  - Correlation tests  
  - Kruskal-Wallis for non-parametric comparisons  
  - Chi-square tests for categorical relationships  

### 4. Regression Analysis
- Multiple linear regression for price prediction  
- Significance testing of predictors  
- Diagnostic plots for regression assumptions  

### 5. ANOVA
- One-way ANOVA for categorical features  
- Tukey HSD post-hoc tests  
- Multi-factor ANOVA analysis  

## Key Research Questions
- Does car age significantly affect its price?  
- Are fuel types associated with pricing differences?  
- Does transmission type (auto/manual) influence price?  
- How does mileage impact car value?

## Key Findings
- Car price declines with age and kilometers driven  
- Fuel type and transmission type significantly impact pricing  
- Multiple variables together provide strong price prediction capability  

## Technical Requirements

### R Packages Used

#### Data Manipulation
```r
library(dplyr)
library(readxl)
library(ggplot2)
library(GGally)
library(ggpubr)
library(ggstatsplot)
library(corrplot)
library(viridis)
```

#### Statistical Analysis
```r



library(pastecs)
library(moments)
library(scales)
```
#### Preprocessing
```r
library(superml)
library(caTools)
library(zoo)
library(imputeTS)
library(reshape2)
```
## How to Run
Clone the repository

- Place the Data.csv file in the root directory
- Install required packages
- Run the following command in your terminal:
```bash
    Rscript -e "install.packages(c('ggplot2', 'dplyr', 'pastecs', 'corrplot', 'GGally', 'ggpubr', 'scales', 'moments', 'ggstatsplot', 'superml', 'readxl', 'zoo', 'imputeTS', 'reshape2', 'viridis', 'caTools'))"

  ```

```bash
    Rscript code.R
```

## Results and Conclusions

Statistically validated relationships between car features and price
* Built a robust regression model for predicting price
* Identified most influential variables for pricing

## Future Improvements
* Feature engineering for model performance improvement
* Comparison with machine learning models
* Cross-validation and regularization techniques
* Addition of more detailed datasets
