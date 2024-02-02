# Bike Rental Prediction

Bike rental prediction epitomizes the strategic application of cutting-edge predictive analytics and machine learning algorithms to anticipate the demand for bicycle rentals within a specific locale across a defined timeframe. This sophisticated predictive model meticulously factors in a myriad of influencers, enabling rental service providers to impeccably fine-tune their inventory management, pricing structures, and operational tactics.

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

### Table Of Contents:


| **Table of Contents**                             |
|--------------------------------------------------|
| **1. Section 1:**                                |
|    - 1. Loading Relevant Libraries               |
|    - 2. Addition of File to R Program/R Studio   |
|    - 3. Exploration of Dataset                   |
| **2. Section 2: EDA: Exploratory Data Analysis** |
|    - 1. Renaming and Type Conversion of Attributes|
|    - 2. Typecasting Datetime and Numerical Attributes to Category|
|    - 3. Missing Value Analysis                    |
|    - 4. Visualization of Numerical Variables through Pairplot|
|    - 5. Exploring Bike Rental Distribution Using Histogram|
|    - 6. Histogram of Target Variable - "Bike Rental Count"|
|    - 7. Log Transformation of Bike Rentals and Visualization Using Histogram and Density Plot|
|    - 8. Correlogram of All Variables Using ggpairs|
|    - 9. Analysis of Dataset Focusing on Bike Rental Count Using 'explore' Package|
|    - 10. Monthly Distribution of Bike Rental Counts|
|        - a. Season-wise Monthly Distribution of Bike Rental Counts|
|        - b. Weekday-wise Monthly Distribution of Bike Rental Counts|
|    - 11. Bike Rentals Counts by Seasonly Distribution|
|        - a. Boxplot to Visualize Bike Rentals by Season|
|        - b. Violin Plot for Yearly Distribution of Counts|
|    - 12. Exploring Bike Rentals During Holidays|
|        - a. Boxplot for Rentals by Holiday Status|
|        - b. Histogram for Distribution of Rentals on Non-Holidays and On Holidays|
|        - c. Column Plot for Holiday-wise Distribution of Counts|
|    - 13. Exploration of Working Day-wise Distribution of Counts|
|        - a. Column Plot for Working Day-wise Distribution of Counts|
|    - 14. Impact of Weather Conditions on Bike Rentals|
|        - a. Column Plot for Weather Condition-wise Distribution of Counts|
|    - 15. Temperature Analysis|
|        - a. Combined Temperature Analysis for Temperature and Apparent Temperature|
|        - b. Scatter Plot for Bike Rentals Against Temperature and Apparent Temperature in Celsius|
| **3. Section 3: Outlier Analysis**               |
|    - 1. Boxplot for Bike Rental Count with Outliers|
|    - 2. Boxplots for Outliers in Temperature, Feel-like Temperature, Humidity, and Windspeed|
|    - 3. Outlier Replacement and Imputation       |
|        - a. Replacing and Imputing Outliers in Humidity and Windspeed|
|        - b. Impute Missing Values Using Mean Imputation Method|
|    - 4. Combining the Imputed Dataset and Original Dataset|
|    - 5. Exploring Numerical Column for Combined Dataset|
|    - 6. Correlation Analysis of Combined Dataset  |
| **4. Section 4: Training and Testing Dataset**   |
|    - 1. Splitting Dataset for Training and Testing|
|    - 2. Creating Subsets for Training and Testing Respectively|
| **5. Section 5: Feature Engineering**            |
|    - 1. Encoding Categorical Features for Training Dataset|
|    - 2. Encoding Categorical Features (Test Dataset)|
| **6. Section 6: Linear Regression Model**       |
|    - 1. Modelling the Training Dataset for LRM  |
|    - 2. Cross Validation Prediction for LRM      |
|    - 3. Cross Validation Prediction Plot for LRM|
|    - 4. Model Performance on Test Dataset for LRM|
|    - 5. Prediction Analysis of Models on Test Dataset for LRM|
|    - 6. Model Evaluation Metrics for LRM        |
|    - 7. Residual Analysis for LRM               |
| **7. Section 7: Decision Tree Regressor**       |
|    - 1. Modelling the Training Dataset for DTR  |
|    - 2. Cross Validation Prediction for DTR     |
|    - 3. Cross Validation Prediction Plot for DTR|
|    - 4. Model Performance on Test Dataset for DTR|
|    - 5. Prediction Analysis of Models on Test Dataset for DTR|
|    - 6. Model Evaluation Metrics for DTR        |
|    - 7. Residual Analysis and Plot for DTR      |
| **10. Section 10: Random Forest Model**         |
|    - 1. Modelling the Training Dataset for RFM  |
|    - 2. Cross Validation Prediction for RFM     |
|    - 3. Cross Validation Prediction Plot for RFM|
|    - 4. Model Performance on Test Dataset for RFM|
|    - 5. Prediction Analysis of Models on Test Dataset for RFM|
|    - 6. Model Evaluation Metrics for RFM        |
|    - 7. Residual Analysis and Plot for RFM      |
| **11. Section 11: Selecting Best Model in All Three for Further Prediction**|
|    - 1. Calculate RMSE and MAE for Each Model   |
|    - 2. Analyzing Accuracy for Each Model       |
|    - 3. Selecting Best Model                    |
| **12. Section 12: Selecting Final Model as Random Forest Regressor for Prediction of Bike Rental Count**|
|    - 1. Combine Observed and Predicted Values   |
|    - 2. Write Predictions to a CSV File        |
|    - 3. Display the Predictions                 |
| **13. Section 13: Conclusion**                  |


### Requirement to Run R Program:

1. **R Version:**
   - R version 4.0.0 or higher is recommended.

2. **Packages and Libraries:**
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

3. **Dataset:**
   - The dataset used for bike rental prediction should be available in the specified path.

4. **System Compatibility:**
   - The R program is designed to run on Windows, macOS, or Linux systems.

5. **Hardware Requirements:**
   - The program should be run on a system with sufficient memory and processing power for model training and evaluation.

6. **Running the Program:**
   - Execute the R scripts in a compatible R environment (RStudio or command-line R) by following the provided structure in the project.

7. **Output:**
   - The program generates various plots, analyses, and predictions, which are displayed in the R environment or saved in relevant files.

8. **Additional Notes:**
   - Refer to the comments and documentation within the R script files for detailed information on each section and step of the project.


## 📊 Key Components and Considerations in Bike Rental Prediction:

### Dataset Description:

#### Variables:

| Variable    | Description                                               |
|-------------|-----------------------------------------------------------|
| instant     | Record index                                              |
| dteday      | Date                                                      |
| season      | Season (1: springer, 2: summer, 3: fall, 4: winter)       |
| yr          | Year (0: 2011, 1: 2012)                                   |
| mnth        | Month (1 to 12)                                           |
| holiday     | Weather day is a holiday or not                           |
| weekday     | Day of the week                                           |
| workingday  | Working day (1:neither weekend nor holiday, 0:other days) |
| weathersit  | 1:Clear,few clouds, partly cloudy                         |
|             | 2:Mist + cloudy,mist + broken clouds, mist + few clouds,mist|
|             | 3:Light snow, light rain + thunderstorm + scattered clouds, light rain + scattered clouds |
|             | 4:Heavy rain + ice pallets                                |
| temp        | Normalized temperature in celsius; The values are divided into 41(max) |
| atemp       | Normalized feeling temperature in Celsius; The values are divided into 50(max) |
| hum         | Normalized humidity; The values are divided into 100(max) |
| windspeed   | Normalized wind speed; The values are divided into 67(max) |
| casual      | Count of casual users                                     |
| registerd   | Count of registered users                                 |
| cnt         | Count of total rental bikes including both casual and registered |

### Data Collection:

| Data Type                 | Description                                           |
|---------------------------|-------------------------------------------------------|
| Historical Rental Data    | Comprehensive dataset of past bike rental transactions, including timestamps, rental durations, and user-specific details. |
| Weather Data              | Incorporates weather conditions such as temperature, precipitation, and wind speed, influencing bike rental demand. |
| Time and Day Patterns     | Uncovering insights related to the time of day, day of the week, and seasonal fluctuations pivotal in predicting demand. |

### Feature Engineering:

| Feature Type              | Description                                           |
|---------------------------|-------------------------------------------------------|
| Time-Related Features     | Extraction of pertinent time-related features like the hour of the day and day of the week. |
| Holidays and Events       | Ingeniously combining and preprocessing data to craft meaningful variables enhancing predictive prowess. |
| Encoding Categorical Features |Encoding Categorical Features for Train Dataset and Test Dataset  | 

### Machine Learning Model:

| Algorithm Selection       | Description                                           |
|---------------------------|-------------------------------------------------------|
| Linear Regression Model   | Choose this ML algorithm based on the complexity and nature of the data. |
| Decision Tree Model       | Methodically train the model with historical data to discern intricate patterns and relationships. |
| Random Forest Model       | Utilize an ensemble of decision trees for improved accuracy and robustness. |


### Evaluation:

| Metrics                   | Description                                           |
|---------------------------|-------------------------------------------------------|
| Mean Absolute Error (MAE) | A robust measure of the average magnitude of errors between predicted and observed values, providing insight into prediction accuracy. |
| Root Mean Squared Error (RMSE) | A comprehensive evaluation metric that measures the average magnitude of the model's errors, giving higher weight to large errors. It provides a good understanding of the overall model performance. |
| R-squared                 | A statistical measure that indicates the proportion of the variance in the dependent variable (bike rental count) that is predictable from the independent variables (features). It ranges from 0 to 1, with 1 indicating perfect prediction. |

### Deployment:

| Integration               | Description                                           |
|---------------------------|-------------------------------------------------------|
| Real-time Predictions     | Seamless integration into the bike rental platform to furnish real-time predictions. |
| Continuous Monitoring     | Recognizing the need for continuous monitoring and updates to ensure adaptability. |

### Optimization:

| Utilization Strategies    | Description                                           |
|---------------------------|-------------------------------------------------------|
| Inventory Management      | Leveraging predictions to optimize bike inventory.    |
| Pricing Strategies        | Fine-tuning pricing strategies based on predictions.   |
| Promotional Campaigns     | Orchestrating campaigns based on anticipated demand.   |

### User Interface:

| Interface Design          | Description                                           |
|---------------------------|-------------------------------------------------------|
| User-Friendly Experience  | Crafting an intuitive interface to present predictions and insights to rental service providers. |


## ✔ Tasks Completed

### 1. Exploratory Data Analysis:

- Load the dataset and relevant libraries.
- Perform data type conversion of the attributes.
- Conduct missing value analysis.

### 2. Attributes Distribution and Trends:

- Plot monthly distribution of the total number of bikes rented.
- Plot yearly distribution of the total number of bikes rented.
- Plot boxplot for outliers' analysis.

### 3. Split the Dataset

Split the dataset into train and test datasets.

### 4. Create a Model

Create a model using the random forest algorithm.

### 5. Predictions

Predict the performance of the model on the test dataset.

## 🏆 Project Outcome

This project is designed to:
- Understand how to perform exploratory data analysis, plot graphs, and predict using a machine learning algorithm.
- Analyze the dataset for this project to create a report.
- Use a machine learning algorithm and predict the bikes rented daily.

In essence, bike rental prediction serves as a powerful catalyst, empowering businesses to elevate customer experiences, optimize resource utilization, and enhance overall operational efficiency within the dynamic and competitive bike-sharing industry.


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



