# Bike Rental Prediction

*Bike rental prediction* at its core represents an advanced application of predictive analytics and machine learning, employing a robust **Random Forest model** to forecast bicycle rental demand with unparalleled precision. This sophisticated model goes beyond traditional approaches by meticulously analyzing an array of factors, including seasonal patterns, weather conditions, and temporal trends, to provide nuanced insights into user behavior and rental dynamics.

By harnessing the power of the *Random Forest algorithm*, known for its ensemble of decision trees and enhanced accuracy, the predictive model enables rental service providers to make data-driven decisions. This includes optimizing inventory levels, tailoring pricing strategies, and streamlining operational processes. The *Random Forest model* excels at capturing complex relationships within the data, ensuring a more accurate prediction of bike rental counts.

This predictive tool serves as a strategic asset, not only anticipating demand fluctuations but also acting as a catalyst for informed decision-making. It empowers businesses to proactively adapt to changing market conditions, enhance resource allocation, and deliver an exceptional and responsive rental experience.

In summary, the *bike rental prediction model*, driven by the *Random Forest algorithm*, is a powerful and sophisticated solution that transforms data into actionable insights, fostering operational efficiency and elevating customer satisfaction in the dynamic landscape of bike rentals.

![Bike rental prediction project img](https://github.com/Anamicca23/Bike-Rental-Prediction/assets/99593529/73391e21-fb83-4ea3-a617-1da408b3646d)

## 🎯 Objectives

- Perform exploratory data analysis and visualize the data to understand the environmental and seasonal settings.
- Predict bike rental counts based on environmental and seasonal settings with the help of a machine learning algorithm.

## 🚀 Prerequisites
1. **Exploratory data analysis**
2. **Data Manipulation**
3. **Data visualization**
4. **R programming**
5. **Machine Learning**

### Industry Relevance
This project covers the following key areas:
- **Exploratory Data Analysis (EDA):** Finds trends, patterns, or checks assumptions by analyzing data with visual tools.
- **Data Manipulation:** Organizes and changes information to make it more understandable.
- **Data Visualization:** Represents data with common graphs, plots, or charts.
- **R Programming:** Used for statistical analysis, graphics representation, and reporting.
- **Machine Learning:** Enhances software accuracy in predicting outcomes without explicit programming.


# Table of Contents

<details>
<summary><strong>Section 1</strong></summary>

- [Loading Relevant Libraries](#1-loading-relevant-libraries)
- [Addition of File to R Program/R Studio](#2-addition-of-file-to-r-programr-studio)
- [Exploration of Dataset](#3-exploration-of-dataset)

</details>

<details>
<summary><strong>Section 2: EDA - Exploratory Data Analysis</strong></summary>

1. [Renaming and Type Conversion of Attributes](#1-renaming-and-type-conversion-of-attributes)
2. [Typecasting Datetime and Numerical Attributes to Category](#2-typecasting-datetime-and-numerical-attributes-to-category)
3. [Missing Value Analysis](#3-missing-value-analysis)
4. [Visualization of Numerical Variables through Pairplot](#4-visualization-of-numerical-variables-through-pairplot)
5. [Exploring Bike Rental Distribution Using Histogram](#5-exploring-bike-rental-distribution-using-histogram)
6. [Histogram of Target Variable - "Bike Rental Count"](#6-histogram-of-target-variable---bike-rental-count)
7. [Log Transformation of Bike Rentals and Visualization Using Histogram and Density Plot](#7-log-transformation-of-bike-rentals-and-visualization-using-histogram-and-density-plot)
8. [Correlogram of All Variables Using ggpairs](#8-correlogram-of-all-variables-using-ggpairs)
9. [Analysis of Dataset Focusing on Bike Rental Count Using 'explore' Package](#9-analysis-of-dataset-focusing-on-bike-rental-count-using-explore-package)
10. [Monthly Distribution of Bike Rental Counts](#10-monthly-distribution-of-bike-rental-counts)
    - [Season-wise Monthly Distribution of Bike Rental Counts](#a-season-wise-monthly-distribution-of-bike-rental-counts)
    - [Weekday-wise Monthly Distribution of Bike Rental Counts](#b-weekday-wise-monthly-distribution-of-bike-rental-counts)
11. [Bike Rentals Counts by Seasonly Distribution](#11-bike-rentals-counts-by-seasonly-distribution)
    - [Boxplot to Visualize Bike Rentals by Season](#a-boxplot-to-visualize-bike-rentals-by-season)
    - [Violin Plot for Yearly Distribution of Counts](#b-violin-plot-for-yearly-distribution-of-counts)
12. [Exploring Bike Rentals During Holidays](#12-exploring-bike-rentals-during-holidays)
    - [Boxplot for Rentals by Holiday Status](#a-boxplot-for-rentals-by-holiday-status)
    - [Histogram for Distribution of Rentals on Non-Holidays and On Holidays](#b-histogram-for-distribution-of-rentals-on-non-holidays-and-on-holidays)
    - [Column Plot for Holiday-wise Distribution of Counts](#c-column-plot-for-holiday-wise-distribution-of-counts)
13. [Exploration of Working Day-wise Distribution of Counts](#13-exploration-of-working-day-wise-distribution-of-counts)
    - [Column Plot for Working Day-wise Distribution of Counts](#a-column-plot-for-working-day-wise-distribution-of-counts)
14. [Impact of Weather Conditions on Bike Rentals](#14-impact-of-weather-conditions-on-bike-rentals)
    - [Column Plot for Weather Condition-wise Distribution of Counts](#a-column-plot-for-weather-condition-wise-distribution-of-counts)
15. [Temperature Analysis](#15-temperature-analysis)
    - [Combined Temperature Analysis for Temperature and Apparent Temperature](#a-combined-temperature-analysis-for-temperature-and-apparent-temperature)
    - [Scatter Plot for Bike Rentals Against Temperature and Apparent Temperature in Celsius](#b-scatter-plot-for-bike-rentals-against-temperature-and-apparent-temperature-in-celsius)

</details>

<details>
<summary><strong>Section 3: Outlier Analysis</strong></summary>

1. [Boxplot for Bike Rental Count with Outliers](#1-boxplot-for-bike-rental-count-with-outliers)
2. [Boxplots for Outliers in Temperature, Feel-like Temperature, Humidity, and Windspeed](#2-boxplots-for-outliers-in-temperature-feel-like-temperature-humidity-and-windspeed)
3. [Outlier Replacement and Imputation](#3-outlier-replacement-and-imputation)
    - [Replacing and Imputing Outliers in Humidity and Windspeed](#a-replacing-and-imputing-outliers-in-humidity-and-windspeed)
    - [Impute Missing Values Using Mean Imputation Method](#b-impute-missing-values-using-mean-imputation-method)
4. [Combining the Imputed Dataset and Original Dataset](#4-combining-the-imputed-dataset-and-original-dataset)
5. [Exploring Numerical Column for Combined Dataset](#5-exploring-numerical-column-for-combined-dataset)
6. [Correlation Analysis of Combined Dataset](#6-correlation-analysis-of-combined-dataset)

</details>

<details>
<summary><strong>Section 4: Training and Testing Dataset</strong></summary>

1. [Splitting Dataset for Training and Testing](#1-splitting-dataset-for-training-and-testing)
2. [Creating Subsets for Training and Testing Respectively](#2-creating-subsets-for-training-and-testing-respectively)

</details>

<details>
<summary><strong>Section 5: Feature Engineering</strong></summary>

1. [Encoding Categorical Features for Training Dataset](#1-encoding-categorical-features-for-training-dataset)
2. [Encoding Categorical Features (Test Dataset)](#2-encoding-categorical-features-test-dataset)

</details>

<details>
<summary><strong>Section 6: Linear Regression Model</strong></summary>

1. [Modelling the Training Dataset for LRM](#1-modelling-the-training-dataset-for-lrm)
2. [Cross Validation Prediction for LRM](#2-cross-validation-prediction-for-lrm)
3. [Cross Validation Prediction Plot for LRM](#3-cross-validation-prediction-plot-for-lrm)
4. [Model Performance on Test Dataset for LRM](#4-model-performance-on-test-dataset-for-lrm)
5. [Prediction Analysis of Models on Test Dataset for LRM](#5-prediction-analysis-of-models-on-test-dataset-for-lrm)
6. [Model Evaluation Metrics for LRM](#6-model-evaluation-metrics-for-lrm)
7. [Residual Analysis for LRM](#7-residual-analysis-for-lrm)

</details>

<details>
<summary><strong>Section 7: Decision Tree Regressor</strong></summary>

1. [Modelling the Training Dataset for DTR](#1-modelling-the-training-dataset-for-dtr)
2. [Cross Validation Prediction for DTR](#2-cross-validation-prediction-for-dtr)
3. [Cross Validation Prediction Plot for DTR](#3-cross-validation-prediction-plot-for-dtr)
4. [Model Performance on Test Dataset for DTR](#4-model-performance-on-test-dataset-for-dtr)
5. [Prediction Analysis of Models on Test Dataset for DTR](#5-prediction-analysis-of-models-on-test-dataset-for-dtr)
6. [Model Evaluation Metrics for DTR](#6-model-evaluation-metrics-for-dtr)
7. [Residual Analysis and Plot for DTR](#7-residual-analysis-and-plot-for-dtr)

</details>

<details>
<summary><strong>Section 10: Random Forest Model</strong></summary>

1. [Modelling the Training Dataset for RFM](#1-modelling-the-training-dataset-for-rfm)
2. [Cross Validation Prediction for RFM](#2-cross-validation-prediction-for-rfm)
3. [Cross Validation Prediction Plot for RFM](#3-cross-validation-prediction-plot-for-rfm)
4. [Model Performance on Test Dataset for RFM](#4-model-performance-on-test-dataset-for-rfm)
5. [Prediction Analysis of Models on Test Dataset for RFM](#5-prediction-analysis-of-models-on-test-dataset-for-rfm)
6. [Model Evaluation Metrics for RFM](#6-model-evaluation-metrics-for-rfm)
7. [Residual Analysis and Plot for RFM](#7-residual-analysis-and-plot-for-rfm)

</details>

<details>
<summary><strong>Section 11: Selecting Best Model in All Three for Further Prediction</strong></summary>

1. [Calculate RMSE and MAE for Each Model](#1-calculate-rmse-and-mae-for-each-model)
2. [Analyzing Accuracy for Each Model](#2-analyzing-accuracy-for-each-model)
3. [Selecting Best Model](#3-selecting-best-model)

</details>

<details>
<summary><strong>Section 12: Selecting Final Model as Random Forest Regressor for Prediction of Bike Rental Count</strong></summary>

1. [Combine Observed and Predicted Values](#1-combine-observed-and-predicted-values)
2. [Write Predictions to a CSV File](#2-write-predictions-to-a-csv-file)
3. [Display the Predictions](#3-display-the-predictions)

</details>

<details>
<summary><strong>Section 13: Conclusion</strong></summary>
</details>


# Installation Requirements

<details>
<summary><span style="color: #880000;"><strong>1. R Version</strong></span></summary>

- R version 4.3.1 or higher is recommended.
- R version used to build project - (4.3.2).

</details>

<details>
<summary><span style="color: #880000;"><strong>2. Packages and Libraries</strong></span></summary>

- Ensure that the following R packages are installed:
  - readxl
  - ggplot2
  - tidyverse
  - dplyr
  - car
  - explore
  - lubridate
  - DataExplorer
  - GGally
  - viridis
  - ggridges
  - Metrics
  - MASS
  - caret
  - InformationValue
  - randomForest
  - corrplot
  - corrgram
  - DMwR2
  - purrr
  - rpart
  - rpart.plot
  - ranger

</details>

<details>
<summary><span style="color: #880000;"><strong>3. Dataset</strong></span></summary>

- The dataset used for bike rental prediction should be available in the specified path.

</details>

<details>
<summary><span style="color: #880000;"><strong>4. System Compatibility</strong></span></summary>

- The R program is designed to run on Windows, macOS, or Linux systems.

</details>

<details>
<summary><span style="color: #880000;"><strong>5. Hardware Requirements</strong></span></summary>

- The program should be run on a system with sufficient memory and processing power for model training and evaluation.

</details>

<details>
<summary><span style="color: #880000;"><strong>6. Running the Program</strong></span></summary>

- Execute the R scripts in a compatible R environment (RStudio or command-line R) by following the provided structure in the project.

</details>

<details>
<summary><span style="color: #880000;"><strong>7. Output</strong></span></summary>

- The program generates various plots, analyses, and predictions, which are displayed in the R environment or saved in relevant files.

</details>

<details>
<summary><span style="color: #880000;"><strong>8. Additional Notes</strong></span></summary>

- Refer to the comments and documentation within the R script files for detailed information on each section and step of the project.

</details>



## 📊 Key Components and Considerations in Bike Rental Prediction:

# Dataset Description:

<details>
<summary><span style="color: blue;"><strong>Variables</strong></span></summary>

| Variable    | Description                                               |
|-------------|-----------------------------------------------------------|
| instant     | Record index                                              |
| dteday      | Date                                                      |
| season      | Season (1: springer, 2: summer, 3: fall, 4: winter)       |
| yr          | Year (0: 2011, 1: 2012)                                   |
| mnth        | Month (1 to 12)                                           |
| holiday     | Weather day is a holiday or not                           |
| weekday     | Day of the week                                           |
| workingday  | Working day (1: neither weekend nor holiday, 0: other days) |
| weathersit  | 1: Clear, few clouds, partly cloudy                       |
|             | 2: Mist + cloudy, mist + broken clouds, mist + few clouds, mist |
|             | 3: Light snow, light rain + thunderstorm + scattered clouds, light rain + scattered clouds |
|             | 4: Heavy rain + ice pallets                                |
| temp        | Normalized temperature in Celsius; The values are divided into 41(max) |
| atemp       | Normalized feeling temperature in Celsius; The values are divided into 50(max) |
| hum         | Normalized humidity; The values are divided into 100(max) |
| windspeed   | Normalized wind speed; The values are divided into 67(max) |
| casual      | Count of casual users                                     |
| registerd   | Count of registered users                                 |
| cnt         | Count of total rental bikes, including both casual and registered |

</details>

<details>
<summary><span style="color: #880000;"><strong>Data Collection</strong></span></summary>

| Data Type                 | Description                                           |
|---------------------------|-------------------------------------------------------|
| Historical Rental Data    | Comprehensive dataset of past bike rental transactions, including timestamps, rental durations, and user-specific details. |
| Weather Data              | Incorporates weather conditions such as temperature, precipitation, and wind speed, influencing bike rental demand. |
| Time and Day Patterns     | Uncovering insights related to the time of day, day of the week, and seasonal fluctuations pivotal in predicting demand. |

</details>

<details>
<summary><span style="color: #880000;"><strong>Feature Engineering</strong></span></summary>

| Feature Type              | Description                                           |
|---------------------------|-------------------------------------------------------|
| Time-Related Features     | Extraction of pertinent time-related features like the hour of the day and day of the week. |
| Holidays and Events       | Ingeniously combining and preprocessing data to craft meaningful variables enhancing predictive prowess. |
| Encoding Categorical Features | Encoding Categorical Features for Train Dataset and Test Dataset  | 

</details>

<details>
<summary><span style="color: #880000;"><strong>Machine Learning Model</strong></span></summary>

| Algorithm Selection       | Description                                           |
|---------------------------|-------------------------------------------------------|
| Linear Regression Model   | Choose this ML algorithm based on the complexity and nature of the data. |
| Decision Tree Model       | Methodically train the model with historical data to discern intricate patterns and relationships. |
| Random Forest Model       | Utilize an ensemble of decision trees for improved accuracy and robustness. |

</details>

<details>
<summary><span style="color: #880000;"><strong>Evaluation</strong></span></summary>

| Metrics                   | Description                                           |
|---------------------------|-------------------------------------------------------|
| Mean Absolute Error (MAE) | A robust measure of the average magnitude of errors between predicted and observed values, providing insight into prediction accuracy. |
| Root Mean Squared Error (RMSE) | A comprehensive evaluation metric that measures the average magnitude of the model's errors, giving higher weight to large errors. It provides a good understanding of the overall model performance. |
| R-squared                 | A statistical measure that indicates the proportion of the variance in the dependent variable (bike rental count) that is predictable from the independent variables (features). It ranges from 0 to 1, with 1 indicating perfect prediction. |

</details>

<details>
<summary><span style="color: #880000;"><strong>Deployment</strong></span></summary>

| Integration               | Description                                           |
|---------------------------|-------------------------------------------------------|
| Real-time Predictions     | Seamless integration into the bike rental platform to furnish real-time predictions. |
| Continuous Monitoring     | Recognizing the need for continuous monitoring and updates to ensure adaptability. |

</details>

<details>
<summary><span style="color: #880000;"><strong>Optimization</strong></span></summary>

| Utilization Strategies    | Description                                           |
|---------------------------|-------------------------------------------------------|
| Inventory Management      | Leveraging predictions to optimize bike inventory.    |
| Pricing Strategies        | Fine-tuning pricing strategies based on predictions.   |
| Promotional Campaigns     | Orchestrating campaigns based on anticipated demand.   |

</details>

<details>
<summary><span style="color: #880000;"><strong>User Interface</strong></span></summary>

| Interface Design          | Description                                           |
|---------------------------|-------------------------------------------------------|
| User-Friendly Experience  | Crafting an intuitive interface to present predictions and insights to rental service providers. |

</details>


|    **✔ Tasks Completed**                           |
|----------------------------------------------------|
| **1. Exploratory Data Analysis:**                  |
|                                                    |
|   [![✔](https://via.placeholder.com/15/00FF00/000000?text=+)](✔) Load the dataset and relevant libraries.    |
|   [![green tick](https://via.placeholder.com/15/00FF00/000000?text=+)](✔) Perform data type conversion of the attributes. |
|   [![green tick](https://via.placeholder.com/15/00FF00/000000?text=+)](✔) Conduct missing value analysis.             |
|                                                    |
|**2. Attributes Distribution and Trends:**          |
|                                                    |
|   [![green tick](https://via.placeholder.com/15/00FF00/000000?text=+)](✔) Plot monthly distribution of the total number of bikes rented. |
|   [![green tick](https://via.placeholder.com/15/00FF00/000000?text=+)](✔) Plot yearly distribution of the total number of bikes rented.  |
|   [![green tick](https://via.placeholder.com/15/00FF00/000000?text=+)](✔) Plot boxplot for outliers' analysis.         |
|                                                    |
| **3. Split the Dataset:**                          |
|                                                    |
|   [![green tick](https://via.placeholder.com/15/00FF00/000000?text=+)](✔) Split the dataset into train and test datasets. |
|                                                    |
| **4. Create a Model:**                             |
|                                                    |
|   [![green tick](https://via.placeholder.com/15/00FF00/000000?text=+)](✔) Create a model using the random forest algorithm. |
|                                                    |
| **5. Predictions:**                                |
|                                                    |
|   [![green tick](https://via.placeholder.com/15/00FF00/000000?text=+)](✔) Predict the performance of the model on the test dataset. |




## 🏆 Project Outcome:

This project is designed to:
- Understand how to perform exploratory data analysis, plot graphs, and predict using a machine learning algorithm.
- Analyze the dataset for this project to create a report.
- Use a machine learning algorithm and predict the bikes rented daily.

In essence, bike rental prediction serves as a powerful catalyst, empowering businesses to elevate customer experiences, optimize resource utilization, and enhance overall operational efficiency within the dynamic and competitive bike-sharing industry.


## About Technology Stack Used:

<details>
<summary><strong>Programming Language:</strong></summary>

R: R is a programming language and environment designed for statistical computing and graphics. It is widely used in data analysis, data visualization, and statistical modeling.

</details>

<details>
<summary><strong>Libraries and Packages:</strong></summary>

tidyverse: A collection of R packages, including ggplot2, dplyr, tidyr, readr, and others, that work seamlessly together for data manipulation and visualization.

</details>

<details>
<summary><strong>Version Control:</strong></summary>

Git: Git is a distributed version control system used to track changes in the source code during software development. It allows collaborative development and version management.

</details>

<details>
<summary><strong>Repository Hosting:</strong></summary>

GitHub: GitHub is a web-based platform that provides hosting for software development version control using Git. The project code and resources are hosted on GitHub.

</details>

<details>
<summary><strong>Data Analysis and Visualization:</strong></summary>

RStudio: RStudio is an integrated development environment (IDE) for R, providing tools for coding, debugging, and visualization. It facilitates the interactive exploration of data and creation of visualizations.

</details>

<details>
<summary><strong>Machine Learning Algorithm:</strong></summary>

Random Forest: Random Forest is an ensemble learning method used for both classification and regression tasks. In this project, it is employed as a regression model for predicting bike rental counts.

</details>

<details>
<summary><strong>Text Editor (Optional):</strong></summary>

VSCode, Atom, or Other Text Editors: A text editor can be used for editing and viewing the R script files. While RStudio is the preferred IDE, some users may choose alternative text editors.

</details>

<details>
<summary><strong>Documentation:</strong></summary>

Markdown: Markdown is used for creating formatted text, including headings, lists, and links. The README file is written in Markdown to provide documentation.

</details>

<details>
<summary><strong>Collaboration and Communication:</strong></summary>

Communication Platforms: Collaboration and communication may occur via various platforms such as email, messaging, or project management tools, enabling effective teamwork.

</details>

<details>
<summary><strong>Project Structure and Organization:</strong></summary>

The project is organized into sections, and each section is implemented in a modular fashion within R scripts. A well-structured project organization ensures clarity and maintainability.

</details>

<details>
<summary><strong>Dependency Management (Optional):</strong></summary>

R Package Management: Dependency management can be handled using R package management tools to ensure that the required libraries and packages are installed.

</details>



## Installation

Follow these steps to set up the bike rental prediction project on your local machine:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/bike-rental-prediction.git
   ```

2. **Navigate to Project Directory:**
   ```bash
   cd bike-rental-prediction
   ```

3. **Install Required Packages:**
   ```bash
   # Install R packages using the provided script or manually
   Rscript install_packages.R
   ```

4. **Download Dataset:**
   - Download the bike rental dataset and place it in the specified path or adjust the data loading path in the R scripts accordingly.

5. **Run the R Scripts:**
   - Execute the R scripts in a compatible R environment (RStudio or command-line R).
   - Follow the structure of the project, starting from data exploration to model evaluation.

6. **Output:**
   - Check the generated plots, analyses, and predictions within the R environment or saved files.

7. **Additional Notes:**
   - Read the comments and documentation within the R script files for detailed information on each section and step of the project.

Enjoy exploring and predicting bike rentals with the R program!



