
###Bike Rental Prediction - Project###


# Section: Loading Packages and Libraries for Visualizing Dataset and Performing ML Analysis

## Loading Important Libraries

#Before proceeding, ensure to install all the packages listed inside the `library()` function.
# Install ranger package if not already installed
# install.packages("ranger")

# ggplot2: A powerful and flexible plotting system for creating visualizations in R.
library(ggplot2)

# tidyverse: A collection of packages (including ggplot2) that provide a consistent and efficient data manipulation workflow.
library(tidyverse)

# explore: A package for exploratory data analysis, offering various visualizations and summary statistics.
library(explore)

# GGally: Extension to ggplot2, designed for creating ggplot2 visualizations with multiple plots.
library(GGally)

# ggridges: Creates ridge plots for visualizing the distribution of a numeric value by one or more categorical factors.
library(ggridges)

# Metrics: Provides various metrics for evaluating machine learning models, including RMSE and MAE.
library(Metrics)

# car: Companion to Applied Regression package, offering various regression-related functions.
library(car)

# corrgram: Package for creating correlograms to visualize correlation matrices.
library(corrgram)

# corrplot: Package for creating correlation plots.
library(corrplot)

# caret: Classification and Regression Training package, a comprehensive framework for building predictive models.
library(caret)

# randomForest: Implements random forest algorithms for classification and regression.
library(randomForest)

# ranger: Another implementation of random forest algorithms for faster performance.
library(ranger)

# DMwR2: Data Mining with R, provides functions and data sets for teaching data mining.
library(DMwR2)

# ipred: Improved Predictors package, provides bagging and bootstrapping algorithms for predictive modeling.
library(ipred)

# caTools: Provides various tools for data splitting and manipulation, often used in predictive modeling.
library(caTools)

# viridis: A colorblind-friendly color palette for data visualizations.
library(viridis)

# lubridate: Simplifies date and time handling in R.
library(lubridate)

# readxl: Package for reading Excel files.
library(readxl)


#Section: Adding File into R Programe

# Install and load the readxl package
install.packages("readxl")
library(readxl)

# Provide the correct path to your Excel file
file_path <- "C:/Users/anami/OneDrive/Desktop/bike rental dataset/Dataset/1657875746_day.xlsx"

# Read the Excel file into a data frame
bike_df <- read_excel(file_path)


#Section : Exploring Dataset Given

# Print the first few rows of the data frame using the `head` function
head(bike_df)

# Alternatively, you can use `head.matrix` to print the first few rows
head.matrix(bike_df)

# Explanation: 
# The `head` function is commonly used to display the first few rows of a data frame.
# It helps to quickly inspect the structure and contents of the dataset.

# Print the last few rows of the data frame using the `tail` function
tail(bike_df)

# Alternatively, you can use `tail.matrix` to print the last few rows
tail.matrix(bike_df)

# Explanation:
# The `tail` function is commonly used to display the last few rows of a data frame.
# It helps to check the end of the dataset and ensures data has been read correctly.


# Using the paste function to concatenate strings and print information about the dataset dimensions
# dim(bikes_df) returns a vector with the number of rows and columns in the dataset
# The concatenated string includes "Dimension of dataset: " followed by the number of rows and columns
paste("Dimension of dataset: ", dim(bike_df))

#Section:Performing EDA: Exploratory Data Analysis

#Rename the columns
names(bike_df)<-c('record_id','datetime','season','year','month','holiday','weekday','workingday','weather_condition','temp','atemp','humidity','windspeed','casual_users','registerd_users','count')

head(bike_df)

#Section : Descriptive Analysis

# Summary of the dataset using the summary() function to get a quick overview of key statistics.
summary(bike_df)

#section: Date type conversion of attributes 

# Display the structure of the dataset using the str() function to understand variable types and their distribution.
str(bike_df)

#Typecasting the datetime and numerical attributes to category

# Convert 'datetime' to Date format
bike_df$datetime<- as.Date(bike_df$datetime)
bike_df$year<-as.factor(bike_df$year)
bike_df$month<-as.factor(bike_df$month)
bike_df$season <- as.factor(bike_df$season)
bike_df$holiday<- as.factor(bike_df$holiday)
bike_df$weekday<- as.factor(bike_df$weekday)
bike_df$workingday<- as.factor(bike_df$workingday)
bike_df$weather_condition<- as.factor(bike_df$weather_condition)

# Display the structure of the dataset using the str() function to understand variable types and their distribution.
str(bike_df)

#Section: Missing Value ANalysis:

#Missing values in dataset
missing_val<-data.frame(apply(bike_df,2,function(x){sum(is.na(x))}))
names(missing_val)[1]='missing_val'
missing_val

# Section: Visualization of Numerical Variables

# Visualize the relationships and distributions of key numerical variables using a pairs plot.
# This plot includes temperature ('temp'), "feels-like" temperature ('atemp'), humidity ('hum'),
# windspeed ('windspeed'), casual rentals ('casual'), registered rentals ('registered'),
# and the total number of rentals ('cnt'). The plot helps identify potential patterns, correlations,
# and outliers among these variables.

# Reduce the outer margins to avoid "figure margins too large" error
par(mar = c(0.1, 0.1, 0.1, 0.1))

num_vars <- c("temp", "atemp", "humidity", "windspeed", "casual_users", "registerd_users", "count")
pairs(bike_df[, num_vars], 
      main = "Pairs Plot of Numerical Variables",
      col = bike_df$season, # Color points based on the season for additional insights
      pch = 16)  # Use filled circles for better visibility

# Adding custom titles for each panel of the pairs plot.
for (i in 1:length(num_vars)) {
  for (j in 1:length(num_vars)) {
    panel_var1 <- num_vars[i]
    panel_var2 <- num_vars[j]
    panel_title <- paste("Relationship between", panel_var1, "and", panel_var2)
    panel_subtitle <- ifelse(i == j, "Distribution", paste("Colored by Season:", unique(bike_df$season)))
    title(panel_title, line = 2.5, cex.main = 0.8)
    title(panel_subtitle, line = 4, cex.sub = 0.6)
  }
}

# Reset the outer margins to default after creating the plot
par(mar = c(5, 4, 4, 2) + 0.1)

# Section: Exploring Bike Rentals Distribution

# Explore the distribution of bike rentals using a histogram.
# This plot provides an overview of the distribution of total bike rentals ('cnt') per observation.
# Plotting the histogram to visualize the distribution of bike rentals.
hist(bike_df$count,
     main = "Distribution of Bike Rentals",
     xlab = "Number of Rentals",
     col = "#75AADB",  # Custom color for better visibility
     border = "#333333",  # Border color
     breaks = 30,  # Adjust the number of bins
     xlim = c(0, max(bike_df$count) + 50),  # Set x-axis limits for better readability
     las = 1,  # Keep axis labels horizontal
     cex.main = 1.5,  # Increase main title size
     cex.lab = 1.2,  # Increase axis label size
     cex.axis = 1.2)  # Increase axis tick label size

# Adding informative elements to the plot.
abline(v = mean(bike_df$count), col = "red", lwd = 2, lty = 2)  # Add a vertical line for mean
text(mean(bike_df$count) + 10, 250, "Mean", col = "red", font = 2, cex = 1.2)  # Label for the mean

# Adding additional information inside the plot
mtext(" The distribution is slightly right-skewed.", side = 1, line = 2, cex = 1.1)
mtext("The mean number of rentals is marked by a red dashed line.", side = 3, line = 3, cex = 1.1)

# Section:Histogram of Target Variable- "count"

# Load the required library for data visualization
library(ggplot2)


# Create a histogram to explore the distribution of the target variable 'count'.
ggplot(bike_df, aes(x = count)) +  
  geom_histogram(bins = 30, colour = "black", fill = "#56B4E9") +
  ggtitle("Distribution of Bike Rentals ('count')") +
  xlab("Count Variable") + ylab("Density of the Sample") + 
  theme( 
    plot.title = element_text(color = "blue", size = 18, face = "bold"),
    axis.title.x = element_text(color = "blue", size = 14),
    axis.title.y = element_text(color = "blue", size = 14)
  ) +
  # Adding informative elements on the plot
  geom_vline(aes(xintercept = mean(bike_df$count)),
             color = "red", linetype = "dashed", linewidth = 1.2) +
  annotate("text", x = mean(bike_df$cnt) + 10, y = 30,
           label = "Mean", color = "red", size = 5)

# Section: Log Transformation of Bike Rentals

# Create a histogram and density plot after applying log transformation to 'count'
ggplot(bike_df, aes(x = log(count))) + 
  geom_histogram(aes(y = after_stat(density)), bins = 30, colour = "black", fill = "grey") +
  geom_density(alpha = 0.2, fill = "cyan") +
  ggtitle("Distribution of Log-Transformed Bike Rentals ('count')") +
  xlab("Log-Transformed Count Variable") + ylab("Density of the Sample") + 
  theme( 
    plot.title = element_text(color = "black", size = 18, face = "bold"),
    axis.title.x = element_text(color = "blue", size = 14),
    axis.title.y = element_text(color = "blue", size = 14)
  ) +
  # Adding additional information on the plot
  geom_vline(aes(xintercept = mean(log(bike_df$count))),
             color = "red", linetype = "dashed", linewidth = 1.2) +
  annotate("text", x = mean(log(bike_df$count)) + 0.1, y = 0.2,
           label = "Mean (log-transformed)", color = "red", size = 4) +
  geom_vline(aes(xintercept = median(log(bike_df$count))),
             color = "green", linetype = "dashed", linewidth = 1.2) +
  annotate("text", x = median(log(bike_df$count)) + 0.1, y = 0.4,
           label = "Median (log-transformed)", color = "green", size = 4) +
  # Adding insights on the plot
  annotate("text", x = 6, y = 0.6,
           label = "Insights:", color = "red", size = 4, fontface = "bold") +
  annotate("text", x = 6, y = 0.55,
           label = "1. Applying a log transformation has helped in reducing skewness.", color = "red", size = 2) +
  annotate("text", x = 6, y = 0.5,
           label = "2. The mean and median values are marked for reference.", color = "red", size = 2)

# Section: Creating Correlogram with ggpairs

# Create a new plotting device
dev.new()

# Load necessary libraries
library(GGally)
library(viridis)

# Create a correlogram with ggpairs
ggpairs(bike_df, title = "Correlogram with ggpairs()")

ggcorr(bike_df, method = c("everything", "pearson"), label=TRUE) +
  ggtitle("Plot of correlation variables") + 
  theme(plot.title = element_text(color="blue", size=18, face="bold"))
cat("With the correlation plot, we can see how the variables that most interfere/correlate with the target are temperature, apparent temperature (atemp), weather, year, season, and finally, wind.\n")

# Section: Exploring Data with 'explore' Package

# Load required packages
library(explore)
library(lubridate)


# Extract the year from the 'datetime' variable
bike_df$year_from_date <- year(bike_df$datetime)

# Set display format to show full numeric values
options(scipen = 999)

# Use 'explore' to analyze the dataset, focusing on the 'cnt' variable with the extracted 'year_from_date' as the target
explore(bike_df, count, target = year_from_date)

# Section: Exploring Correlation Among Numerical Variables

# Explore the correlation matrix for numerical variables.
# The matrix and the subsequent heatmap help identify strong correlations among variables.

# Calculate the correlation matrix
cor_matrix <- cor(bike_df[, c("temp", "atemp", "humidity", "windspeed", "casual_users", "registerd_users", "count")])

# Display the correlation matrix
cat("Correlation Matrix:\n")
print(cor_matrix)

# Create a correlation heatmap for a visual representation of variable relationships.
# Strong positive or negative correlations are visually highlighted.
library(corrplot)
# Customize the correlation plot
corrplot(
  cor_matrix,
  method = "color",
  font = 4,
  col = colorRampPalette(c("#4575b4", "#91bfdb", "#e0f3f8", "#fee090", "#d73027"))(100),  # Attractive color scheme
  tl.col = "black",
  tl.srt = 40,
  addCoef.col = "black",
  order = "hclust",
  addrect = 3  # Highlight cells with correlations above a certain threshold
)

# Add informative elements to the plot
title("Correlation heatmap", line = 0.5, cex.main = 1.8)  # Lowercase title
mtext("Strong Positive Correlation", side = 3, line = 2, col = "#d73027", cex = 0.8)
mtext("Strong Negative Correlation", side = 1, line = 3, col = "#4575b4", cex = 0.8)


# Section: Season and Weekday Analysis

# Load the required library
library(dplyr)
# Plot season-wise monthly distribution of counts
season_month_plot <- ggplot(bike_df, aes(x = month, y = count, fill = season)) +
  theme_minimal() +
  geom_col(position = "dodge", color = "black", alpha = 0.8) +
  labs(x = 'Month', y = 'Total Count', 
       title = 'Season-wise Monthly Distribution of Counts',
       subtitle = 'Comparison of counts across different seasons',
       fill = 'Season') +
  scale_fill_manual(values = c('#E41A1C', '#377EB8', '#4DAF4A', '#FF7F00'))  # Custom colors

# Add data labels on top of each bar
season_month_plot <- season_month_plot +
  geom_text(aes(label = count), position = position_dodge(width = 0.9), vjust = -0.5, size = 3)

# Highlight the peak month for each season
peak_months <- bike_df %>%
  group_by(season) %>%
  slice(which.max(count))

season_month_plot <- season_month_plot +
  geom_point(data = peak_months, aes(x = month, y = count), color = "red", size = 3) +
  geom_text(data = peak_months, aes(x = month, y = count, label = paste("Peak\nMonth")), 
            vjust = -0.5, hjust = 1, color = "red", size = 3)

# Customize legend
season_month_plot <- season_month_plot +
  guides(fill = guide_legend(title = "Season"))

# Print the enhanced season-wise plot
print(season_month_plot)


# Plot weekday-wise monthly distribution of counts
weekday_month_plot <- ggplot(bike_df, aes(x = month, y = count, fill = factor(weekday))) +
  theme_minimal() +
  geom_col(position = "dodge", color = "white", alpha = 0.8) +
  labs(x = 'Month', y = 'Total Count', 
       title = 'Weekday-wise Monthly Distribution of Counts',
       subtitle = 'Comparison of counts across different weekdays',
       fill = 'Weekday') +
  scale_fill_discrete(name = 'Weekday', labels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")) +  # Customize weekday labels
  
  # Add data labels on top of each bar
  geom_text(aes(label = count), position = position_dodge(width = 0.9), vjust = -0.5, size = 3)

# Highlight the peak day of the week
peak_days <- bike_df %>%
  group_by(weekday) %>%
  slice_max(order_by = count)

# Customize legend
weekday_month_plot <- weekday_month_plot +
  guides(fill = guide_legend(title = "Weekday"))

# Print the enhanced weekday-wise plot
print(weekday_month_plot)


# Section: Bike Rentals by Season

# Explore the distribution of bike rentals based on the season using a boxplot.
# This boxplot shows how the total number of rentals ('cnt') varies across different seasons.

# Create a boxplot to visualize bike rentals by season
ggplot(bike_df, aes(x = season, y = count, fill = as.factor(season))) +
  geom_boxplot() +
  ggtitle("Bike Rentals by Season") +
  xlab("Season") + ylab("Number of Rentals") +
  scale_fill_manual(values = c("#FF6666", "#FFCC66", "#99FF99", "#6666FF"), name = "Season") +
  theme_minimal() +
  theme(
    plot.title = element_text(color = "blue", size = 18, face = "bold"),
    axis.title.x = element_text(color = "blue", size = 14),
    axis.title.y = element_text(color = "blue", size = 14),
    legend.position = "top",
    legend.title = element_text(color = "blue", size = 14)
  ) +
  # Adding additional information on the plot
  annotate("text", x = c(1, 2, 3, 4), y = 6000,
           label = c("Spring", "Summer", "Fall", "Winter"),
           color = "blue", size = 4, fontface = "bold") +
  annotate("text", x = 1, y = 7000, label = "Median", color = "red", size = 4) +
  annotate("text", x = 2, y = 7000, label = "Median", color = "red", size = 4) +
  annotate("text", x = 3, y = 7000, label = "Median", color = "red", size = 4) +
  annotate("text", x = 4, y = 7000, label = "Median", color = "red", size = 4) +
  geom_hline(yintercept = median(bike_df$count), linetype = "dashed", color = "red", linewidth = 1.2)

# Section: Violin Plot for Yearly Distribution of Counts
library(ggplot2)
# Violin plot for Yearly wise distribution of counts
yearly_violin_plot <- ggplot(bike_df, aes(x = year, y = count, fill = as.factor(year))) +
  geom_violin() +
  theme_bw() +
  labs(x = 'Year', y = 'Total Count', 
       title = 'Yearly Distribution of Counts',
       subtitle = 'Comparison of counts across different years',
       fill = 'Year') +
  
  # Add data points on top of the violin plot for better insight
  geom_jitter(aes(color = as.factor(year)), width = 0.2, alpha = 0.5) +
  
  # Customize legend
  scale_fill_manual(values = c('#1F78B4', '#33A02C'), name = 'Year') +
  scale_color_manual(values = c('#1F78B4', '#33A02C'), name = 'Year') +
  
  # Add a box plot inside the violin plot
  geom_boxplot(width = 0.1, fill = 'white', color = 'black', alpha = 0.7) +
  
  # Improve plot appearance
  theme(legend.position = 'top') +
  
  # Add informative annotations
  annotate('text', x = c(0.8, 1.2), y = c(6000, 6000), label = c('2011', '2012'), size = 4, color = 'black') +
  annotate('text', x = 1, y = 8000, label = 'Data Distribution', size = 6, color = 'black', fontface = 'bold') +
  annotate('text', x = 1, y = 7000, label = 'Comparison of counts across different years using violin plots and box plots.', size = 3, color = 'black') +
  annotate('text', x = 0.8, y = 6800, label = 'Data points are added for better insight.', size = 3, color = 'black')

# Print the Violin plot
print(yearly_violin_plot)
print("From the voilin plot, we can analysis that the bike rental count distribution is highest in year 2012 then the previous year.In the graph, year 0 represent 2011 and year 1 represent 2012 respectively\n")

# Section: Exploring Bike Rentals During Holidays

# Explore summary statistics for the 'count' variable based on the 'holiday' status.
# This analysis provides insights into whether there are notable differences in rentals during holidays.

# Use tapply to calculate summary statistics for 'count' grouped by 'holiday' status
cnt_summary_by_holiday <- tapply(bike_df$count, bike_df$holiday, summary)

# Display the summary statistics
cat("Summary Statistics for 'cnt' Variable Based on 'holiday' Status:\n")
print(cnt_summary_by_holiday)

# Create an analytical plot to visualize the distribution of rentals during holidays and non-holidays
par(mfrow = c(1, 3))  # Set up a 1x3 grid for side-by-side plots

# Boxplot for Rentals by Holiday Status
boxplot(bike_df$count ~ bike_df$holiday, main = "Boxplot of Rentals by Holiday Status", xlab = "Holiday", ylab = "Number of Rentals", col = "#75AADB")
# Add statistics on the boxplot
# Calculate boxplot statistics
stats <- boxplot.stats(bike_df$count[bike_df$holiday == 1])

stats_text <- paste("Median:", round(stats$stats[3], 2), "\nIQR:", round(IQR(bike_df$count[bike_df$holiday == 1]), 2))
mtext(stats_text, side = 3, line = 0.5, at = 1.8, adj = 0, font = 1, cex = 0.8)

# Histogram for Distribution of Rentals on Non-Holidays
hist(bike_df$count[bike_df$holiday == 0], main = "Distribution of Rentals on Non-Holidays", xlab = "Number of Rentals", col = "#75AADB", border = "#333333", xlim = c(0, max(bike_df$count) + 50))
# Add statistics on the histogram
hist_stats_text <- paste("Mean:", round(mean(bike_df$count[bike_df$holiday == 0]), 2), "\nSD:", round(sd(bike_df$count[bike_df$holiday == 0]), 2))
mtext(hist_stats_text, side = 3, line = 0.5, at = max(bike_df$count[bike_df$holiday == 0]) * 0.8, adj = 0, font = 1, cex = 0.8)
# Add mean and sd lines
abline(v = mean(bike_df$count[bike_df$holiday == 0]), col = "red", lty = 2, lwd = 2)
abline(v = mean(bike_df$count[bike_df$holiday == 0]) - sd(bike_df$count[bike_df$holiday == 0]), col = "purple", lty = 2, lwd = 2)
abline(v = mean(bike_df$count[bike_df$holiday == 0]) + sd(bike_df$count[bike_df$holiday == 0]), col = "purple", lty = 2, lwd = 2)
# Mark the observation points on the histogram
rug(bike_df$count[bike_df$holiday == 0], col = "blue", lwd = 1.5)

# Histogram for Distribution of Rentals on Holidays
hist(bike_df$count[bike_df$holiday == 1], main = "Distribution of Rentals on Holidays", xlab = "Number of Rentals", col = "#75AADB", border = "#333333", xlim = c(0, max(bike_df$count) + 50))
# Add statistics on the histogram
hist_stats_text_holiday <- paste("Mean:", round(mean(bike_df$count[bike_df$holiday == 1]), 2), "\nSD:", round(sd(bike_df$count[bike_df$holiday == 1]), 2))
mtext(hist_stats_text_holiday, side = 3, line = 0.5, at = max(bike_df$count[bike_df$holiday == 1]) * 0.8, adj = 0, font = 1, cex = 0.8)
# Add mean and sd lines
abline(v = mean(bike_df$count[bike_df$holiday == 1]), col = "red", lty = 2, lwd = 2)
abline(v = mean(bike_df$count[bike_df$holiday == 1]) - sd(bike_df$count[bike_df$holiday == 1]), col = "purple", lty = 2, lwd = 2)
abline(v = mean(bike_df$count[bike_df$holiday == 1]) + sd(bike_df$count[bike_df$holiday == 1]), col = "purple", lty = 2, lwd = 2)
# Mark the observation points on the histogram
rug(bike_df$count[bike_df$holiday == 1], col = "blue", lwd = 1.5)


# Section: Analyzing Bike Rentals on Holidays

# Column plot for holiday-wise distribution of counts
holiday_plot <- ggplot(bike_df, aes(x = factor(holiday), y = count, fill = season)) +
  geom_col(position = "dodge", color = "black", alpha = 0.8) +
  theme_minimal() +
  labs(
    x = 'Holiday',
    y = 'Total Count',
    title = 'Bike Rentals Analysis: Holidays vs. Non-Holidays',
    subtitle = 'Comparing counts on holidays and non-holidays across different seasons',
    fill = 'Season'
  ) +
  scale_fill_manual(values = c('#E41A1C', '#377EB8', '#4DAF4A', '#FF7F00')) +  # Custom colors +
  geom_text(aes(label = count), position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  scale_x_discrete(labels = c("Non-Holiday", "Holiday")) +  # Adding scale for 0 and 1 +
  theme(legend.position = "top") +
  guides(fill = guide_legend(title = "Season")) +
  annotate("text", x = 1.5, y = max(bike_df$count) * 1.2,
           label = "Insight: During non-holidays, bike rental counts are highest compared to holidays for different seasons.",
           color = "red", size = 3, fontface = "bold")

# Print the informative and analytical plot
print(holiday_plot)


# Section: Analyzing Bike Rentals on neiher weekend nor holiday vs other days

# Column plot for working day-wise distribution of counts
workingday_plot <- ggplot(bike_df, aes(x = factor(workingday), y = count, fill = season)) +
  geom_col(position = "dodge", color = "black", alpha = 0.8) +
  theme_minimal() +
  labs(
    x = 'Working Day',
    y = 'Total Count',
    title = 'Bike Rentals Analysis: neiher weekend nor holiday vs. other days',
    subtitle = 'Comparing counts on working days and non-working days across different seasons',
    fill = 'Season'
  ) +
  scale_fill_manual(values = c('#E41A1C', '#377EB8', '#4DAF4A', '#FF7F00')) +  # Custom colors +
  geom_text(aes(label = count), position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  scale_x_discrete(labels = c("neiher weekend nor holiday", "other days")) +  # Adding scale for 0 and 1 +
  theme(legend.position = "top") +
  guides(fill = guide_legend(title = "Season")) +
  annotate("text", x = 1.5, y = max(bike_df$count) * 1.1,
           label = "Insight: neiher weekend nor holiday - Bike rental count is higher.\n other day - Bike rental count is lower",
           color = "red", size = 3, fontface = "bold")
  

print(workingday_plot)


# Section: Impact of Weather Conditions on Bike Rentals

# Column plot for weather condition-wise distribution of counts
weather_condition_plot <- ggplot(bike_df, aes(x = factor(weather_condition), y = count, fill = season)) +
  geom_col(position = "dodge", color = "black", alpha = 1) +
  theme_minimal() +
  labs(
    x = 'Weather Condition',
    y = 'Total Count',
    title = 'Impact of Weather Conditions on Bike Rentals',
    subtitle = 'Comparing bike rental counts under different weather conditions across different seasons',
    fill = 'Season'
  ) +
  scale_fill_manual(values = c('#E41A1C', '#377EB8', '#4DAF4A', '#FF7F00')) +  # Custom colors +
  geom_text(aes(label = count), position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  scale_x_discrete(labels = c("Clear", "Mist + Cloudy", "Light Snow/Light Rain", "Heavy Rain")) +  # Adding scale +
  theme(legend.position = "top") +
  guides(fill = guide_legend(title = "Season")) +
  annotate(
    "text",
    x = 3.0,
    y = max(bike_df$count) * 1.1,
    label = "Insight: 1. Clear - Bike rental count is very high.\n 2. Mist + Cloudy - Bike rental count is second highest.\n 3. Light Snow/Light Rain - Bike rental count is third highest.\n 4. Heavy Rain - there is no data of Bike renting.",
    color = "red",
    size = 3,
    fontface = "bold"
  )

# Print plot
print(weather_condition_plot)


# Section: Temperature Analysis

# Convert temperature variables to Celsius
bike_df$temp_celsius <- bike_df$temp * 41  # Assuming temp is in normalized units, adjust accordingly
bike_df$atemp_celsius <- bike_df$atemp * 50  # Assuming atemp is in normalized units, adjust accordingly

# Section: Combined Temperature Analysis

# Convert temperature variables to Celsius
bike_df$temp_celsius <- bike_df$temp * 41  # Assuming temp is in normalized units, adjust accordingly
bike_df$atemp_celsius <- bike_df$atemp * 50  # Assuming atemp is in normalized units, adjust accordingly

# Scatter plot for bike rentals against temperature and apparent temperature in Celsius
combined_temp_plot <- ggplot(bike_df, aes(x = temp_celsius, y = count, color = "Temperature")) +
  geom_point() +
  geom_point(aes(x = atemp_celsius, color = "Apparent Temperature"), alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed", color = "black", 
              aes(group = 1), formula = y ~ x) +  # Add a linear trend line
  theme_minimal() +
  labs(
    x = 'Temperature (Celsius)',
    y = 'Total Count',
    title = 'Bike Rentals vs. Temperature and Apparent Temperature',
    subtitle = 'Scatter plot showing the relationship between bike rentals and temperature variables',
    color = 'Variable'
  ) +
  scale_color_manual(values = c("Temperature" = "blue", "Apparent Temperature" = "red")) +
  annotate("text", x = 25, y = 8000, label = "Trend Line: Linear Regression", color = "black", size = 4) +
  annotate("text", x = 5, y = 3000, label = "Temperature", color = "blue", size = 4) +
  annotate("text", x = 30, y = 6000, label = "Apparent Temperature", color = "red", size = 4)

# Print the combined temperature plot
print(combined_temp_plot)

#Outlier Analysis 
# Section: Boxplot for Bike Rental Count with Outliers

# Boxplot for bike rental count with outliers
boxplot(bike_df$count, main = 'Bike Rental Count', sub = ifelse(length(boxplot.stats(bike_df$count)$out) == 0, "No Outliers", paste("Outliers: ", boxplot.stats(bike_df$count)$out)),
        ylab = 'Count', col = "cyan", border = "blue")

# Add statistical values
text(1, boxplot.stats(bike_df$count)$stats[1], paste("Min:", round(boxplot.stats(bike_df$count)$stats[1], 2)), pos = 4, cex = 1)
text(1, boxplot.stats(bike_df$count)$stats[2], paste("1st Quartile:", round(boxplot.stats(bike_df$count)$stats[2], 2)), pos = 4, cex = 1)
text(1, boxplot.stats(bike_df$count)$stats[3], paste("Median:", round(boxplot.stats(bike_df$count)$stats[3], 2)), pos = 4, cex = 1)
text(1, boxplot.stats(bike_df$count)$stats[4], paste("Mean:", round(mean(bike_df$count), 2)), pos = 4, cex = 1)
text(1, boxplot.stats(bike_df$count)$stats[5], paste("3rd Quartile:", round(boxplot.stats(bike_df$count)$stats[5], 2)), pos = 4, cex = 1)
text(1, boxplot.stats(bike_df$count)$stats[6], paste("Max:", round(boxplot.stats(bike_df$count)$stats[6], 2)), pos = 4, cex = 1)


# Section: Boxplots for Outliers in Temperature,feel-like temperature Humidity, and Windspeed

# Set up the layout for multiple boxplots
par(mfrow = c(2, 2))

# Box plot for temperature outliers
boxplot(bike_df$temp, main = "Temperature", sub = ifelse(length(boxplot.stats(bike_df$temp)$out) == 0, "No Outliers", paste("Outliers: ", boxplot.stats(bike_df$temp)$out)),
        col = "#FF6347", border = "#8B0000", notch = TRUE, outline = FALSE)

# Box plot for temperature outliers
boxplot(bike_df$atemp, main = "Feellike-Temperature", sub = ifelse(length(boxplot.stats(bike_df$atemp)$out) == 0, "No Outliers", paste("Outliers: ", boxplot.stats(bike_df$atemp)$out)),
        col = "pink", border = "red", notch = TRUE, outline = FALSE)

# Box plot for humidity outliers
boxplot(bike_df$humidity, main = "Humidity", sub = ifelse(length(boxplot.stats(bike_df$humidity)$out) == 0, "No Outliers", paste("Outliers: ", boxplot.stats(bike_df$humidity)$out)),
        col = "#87CEEB", border = "#1E90FF", notch = TRUE, outline = FALSE)

# Box plot for windspeed outliers
boxplot(bike_df$windspeed, main = "Windspeed", sub = ifelse(length(boxplot.stats(bike_df$windspeed)$out) == 0, "No Outliers", paste("Outliers: ", boxplot.stats(bike_df$windspeed)$out)),
        col = "#98FB98", border = "#008000", notch = TRUE, outline = FALSE)


# Outlier Replacement and Imputation
# Section: Replacing and Imputing Outliers in Humidity and Windspeed

# Install the dplyr package if not installed
install.packages("dplyr")

# Load the required libraries
library(DMwR2)
library(dplyr)

# Create a subset for windspeed and humidity variables
wind_hum <- subset(bike_df, select = c('windspeed', 'humidity'))

# Function to replace outliers with NA
replace_outliers <- function(x) {
  q <- quantile(x, c(0.25, 0.75))
  iqr <- q[2] - q[1]
  lower_bound <- q[1] - 1.5 * iqr
  upper_bound <- q[2] + 1.5 * iqr
  x[x < lower_bound | x > upper_bound] <- NA
  return(x)
}

# Apply the function to each column
wind_hum <- wind_hum %>% mutate(across(everything(), replace_outliers))
wind_hum

# Impute missing values using mean imputation method
wind_hum$windspeed[is.na(wind_hum$windspeed)] <- mean(wind_hum$windspeed, na.rm = TRUE)
wind_hum$humidity[is.na(wind_hum$humidity)] <- mean(wind_hum$humidity, na.rm = TRUE)

#Section : Combining the imputed dataset and original dataset
new_df <- subset(bike_df, select = -c(windspeed, humidity))  # Remove original windspeed and humidity
bike_df <- cbind(new_df, wind_hum)  # Combine new_df and wind_hum data frames

# Display the first 5 rows of the updated dataset
head(bike_df)

summary(bike_df)
#Section: plot for numerical variables in combined dataset

# Load the required libraries
library(car)
library(ggplot2)

# Select numerical columns for probability plots in combined dataset
numerical_columns <- sapply(bike_df, is.numeric)

for (column in names(bike_df[, numerical_columns])) {
  hist(bike_df[, column], main = paste("Histogram for", column),
       xlab = column, col = "skyblue", border = "black")
}

# Create normal probability plots for numerical variables in combined dataset
for (column in names(bike_df[, numerical_columns])) {
  qqnorm(bike_df[, column], main = paste("Normal Probability Plot for", column))
  qqline(bike_df[, column], col = 2)
  
  # Add insight annotation
  annotation <- "Some data points are deviating from normality in a good way."
  text(quantile(bike_df[, column], 1.0), quantile(bike_df[, column], 0.1), annotation, adj = c(0, 1), cex = 0.8, col = "darkgreen")
}


# Section: Correlation Analysis of in combined dataset

# Load the corrgram package for correlation analysis
library(corrgram)

# Identify numeric columns for correlation analysis
numeric_columns <- sapply(bike_df[, 8:19], is.numeric)

# Create a correlation plot
corrgram(bike_df[, 8:19][, numeric_columns], order = FALSE, upper.panel = panel.pie, text.panel = panel.txt, main = 'Correlation Plot')

# Add insight on positive and negative correlations
cat("Positive Correlations: temp, atemp, and year have positive correlations with the target variable.\n")
cat("Negative Correlations: weather_condition, humidity, and windspeed have negative correlations with the target variable.\n")

# Identify variables that may not be needed for further analysis based on correlation
cat("\nVariables with weak correlation (abs(correlation) <= 0.1) with the target variable:\n")
weak_corr_vars <- names(bike_df[, 8:19][, numeric_columns])[sapply(bike_df[, 8:19][, numeric_columns], function(x) abs(cor(x, bike_df$count)) <= 0.1)]
print(weak_corr_vars)


# Section: Splitting Dataset for Training and Testing

# Load the purrr library for functions and vectors
library(purrr)

# Split the dataset based on simple random resampling
train_index <- sample(1:nrow(bike_df), 0.7 * nrow(bike_df))
train_data <- bike_df[train_index,]
test_data <- bike_df[-train_index,]

# Display dimensions of the training and testing datasets
cat("Dimensions of Training Data:", dim(train_data), "\n")
cat("Dimensions of Testing Data:", dim(test_data), "\n")


#splitted data exploration
head(train_data)
head(test_data)

# Section: Creating Subsets for Training and Testing

# Create a new subset for train attributes
train <- subset(train_data, select = c('season', 'year', 'month', 'holiday', 'weekday', 'workingday', 'weather_condition', 'temp','atemp', 'humidity', 'windspeed', 'count'))

# Create a new subset for test attributes
test <- subset(test_data, select = c('season', 'year', 'month', 'holiday', 'weekday', 'workingday', 'weather_condition', 'temp', 'atemp','humidity', 'windspeed', 'count'))

# Display the first few rows of the training subset
cat("Training Subset:")
head(train)

# Display the first few rows of the testing subset
cat("\nTesting Subset:")
head(test)

# Section: Creating Subsets for Training and Testing

# Create a new subset for train categorical attributes
train_cat <- subset(train, select = c('season', 'holiday', 'workingday', 'weather_condition', 'year'))

# Create a new subset for test categorical attributes
test_cat <- subset(test, select = c('season', 'holiday', 'workingday', 'weather_condition', 'year'))

# Create a new subset for train numerical attributes
train_num <- subset(train, select = c('weekday', 'month', 'temp', 'atemp','humidity', 'windspeed', 'count'))

# Create a new subset for test numerical attributes
test_num <- subset(test, select = c('weekday', 'month', 'temp', 'atemp','humidity', 'windspeed', 'count'))

# Display the first few rows of the training categorical attributes subset
cat("Training Categorical Attributes Subset:")
head(train_cat)

# Display the first few rows of the testing categorical attributes subset
cat("\nTesting Categorical Attributes Subset:")
head(test_cat)

# Display the first few rows of the training numerical attributes subset
cat("\nTraining Numerical Attributes Subset:")
head(train_num)

# Display the first few rows of the testing numerical attributes subset
cat("\nTesting Numerical Attributes Subset:")
head(test_num)


# Section: Feature Engineering: Encoding Categorical Features

# Load the required libraries
library(caret)

# Define variables for dummy encoding
othervars <- c('month', 'weekday', 'temp', 'atemp', 'humidity', 'windspeed', 'count')
set.seed(2626)

# Identify categorical variables
vars <- setdiff(colnames(train), c(train$count, othervars))
vars
                                                                   
# Create a formula for encoding
f <- paste('~', paste(vars, collapse = ' + '))

# Use dummyVars to encode categorical variables
encoder <- dummyVars(as.formula(f), train)
encode_attributes <- predict(encoder, train)

# Combine numerical and encoded attributes
train_encoded_attributes <- cbind(train_num, encode_attributes)

# Display the head of the encoded dataset
head(train_encoded_attributes, 5)


# Section: Encoding Categorical Features (Test Dataset)

# Load the required libraries
library(caret)

# Define variables for dummy encoding
othervars <- c('month', 'weekday', 'temp', 'atemp', 'humidity', 'windspeed', 'count')
set.seed(5662)

# Identify categorical variables in the test dataset
vars <- setdiff(colnames(test), c(test$count, othervars))
vars
                                                                   
# Create a formula for encoding
f <- paste('~', paste(vars, collapse = ' + '))

# Use dummyVars to encode categorical variables
encoder <- dummyVars(as.formula(f), test)
encode_attributes <- predict(encoder, test)

# Combine numerical and encoded attributes for the test dataset
test_encoded_attributes <- cbind(test_num, encode_attributes)

# Display the head of the encoded test dataset
head(test_encoded_attributes, 5)


# Section: Modeling the Training Dataset with Linear Regression

# Set seed to reproduce the results of random sampling
set.seed(672)

# Train the Linear Regression model
lr_model <- lm(count ~ ., data = train_encoded_attributes[, -c(6)])

# Display the summary of the Linear Regression model
summary(lr_model)


# Section: Cross Validation Prediction with Linear Regression

# Ignore warning messages
options(warn = -1)

# Set seed to reproduce results of random sampling
set.seed(623)

# Cross validation resampling method
train_control <- trainControl(method = 'cv', number = 3)

# Cross validation prediction
CV_predict <- train(count ~ .,data = train_encoded_attributes[, -c(6)], 
                    method = 'lm', trControl = train_control)

# Display summary of cross validation prediction
summary(CV_predict)

# Observations from the output
cat("\n**Observations:**\n")
cat("- The model's residuals range from -3713.0 to 3165.0, indicating the prediction performance.\n")
cat("- Coefficients and p-values provide insights into variable significance.\n")
cat("- The adjusted R-squared (0.8316) indicates the model's goodness of fit.\n")
cat("- Variables with smaller p-values are considered statistically significant.\n")
cat("- Overall, the linear regression model captures relationships and offers insights into predictor importance and model fit.\n")

#Section: Cross Validation Prediction Plot with Linear Regression

# Increase the size of the plot
par(mfrow=c(1, 1), mar=c(5, 5, 2, 2))

# Cross-validation prediction plot
residuals <- resid(CV_predict)
y_train <- train_encoded_attributes$count

# Scatter plot with residuals
plot(y_train, residuals, ylab = 'Residuals', xlab = 'Observed', main = 'Cross Validation Prediction Plot', pch = 16, col = 'blue')

# Add a reference line at zero
abline(h = 0, col = 'red', lwd = 2)

# Observations from the plot
text(5000, -1500, 'Residuals spread around zero indicates a good model fit', col = 'darkgreen', cex = 0.8)
text(5000, -2500, 'Scatter points should be random and evenly distributed', col = 'darkgreen', cex = 0.8)


# Section: Model Performance on Test Data Analysis

# Set seed for reproducibility
set.seed(6872)

# Suppress warning messages
options(warn = -1)

# Predict using the lr_model on the test_encoded_attributes
lm_predictions <- predict(lr_model, test_encoded_attributes[, -c(6)])

# Display the first 10 predictions
head(lm_predictions, 10)

# Section: Model Performance Visualization using Linear Regressor Model 

# Extract actual and predicted values
actual_values <- test_encoded_attributes$count
predicted_values <- lm_predictions

# Plot past actual values and future 10 predicted values
plot(1:length(actual_values), actual_values, type = "l", col = "blue",
     xlab = "Sample Index", ylab = "Count", main = "Actual vs Future Predicted Values",
     xlim = c(1, length(actual_values) + 10), ylim = c(0, max(actual_values, predicted_values)))
lines(length(actual_values) + 1:length(predicted_values), predicted_values, col = "orange")

# Add lines for future predicted values
lines(length(actual_values) + 1:length(predicted_values), predicted_values, col = "orange")

# Add legend
legend("topright", legend = c("Actual", "Predicted"), col = c("blue", "orange"), lty = 1)

# Highlight the last observed data point
points(length(actual_values), actual_values[length(actual_values)], pch = 19, col = "red")

# Highlight the starting point of predicted values
points(length(actual_values) + 1, predicted_values[1], pch = 19, col = "green")


# Section: Model Evaluation Metrics on Rootmean squred error and mean abosolute error

# Set seed for reproducibility
set.seed(688)

# Root mean squared error (RMSE)
rmse <- RMSE(lm_predictions, test_encoded_attributes$count)
print(paste("Root Mean Squared Error (RMSE):", round(rmse, 2)))

# Mean absolute error (MAE)
mae <- MAE(lm_predictions, test_encoded_attributes$count)
print(paste("Mean Absolute Error (MAE):", round(mae, 2)))


# Section: Residual Analysis

# Set heading for the code block
cat("Residual Analysis:\n")

# Calculate residuals
y_test <- test_encoded_attributes$count
residuals_lm <- y_test - lm_predictions
residuals_lm
                                                                   
# Create an informative residual plot
plot(y_test, residuals_lm, xlab = 'Observed Count', ylab = 'Residuals', main = 'Residual Plot',
     col = ifelse(residuals >= 0, 'blue', 'red'), pch = 16, cex = 1.2)

# Add a reference line at y = 0
abline(h = 0, col = 'black', lty = 2, lw = 2)

# Add legend for positive and negative residuals
legend('topright', legend = c('Positive Residuals', 'Negative Residuals'), col = c('blue', 'red'), pch = 16)

# Interpretation:
cat("\nInterpretation:\n")
cat("The residual plot shows the difference between observed and predicted counts.\n")
cat("Positive residuals (in blue) indicate underpredictions, while negative residuals (in red) indicate overpredictions.\n")
cat("Overall, the model seems to perform well, with residuals centered around zero.\n")


# Section: Decision Tree Regressor

# Set heading for the code block
cat("Decision Tree Regressor:\n")

# Set seed for reproducibility
set.seed(568)

# Load the rpart library for decision trees
library(rpart)

# Set control parameters for rpart
rpart.control <- rpart.control(minbucket = 2, cp = 0.01, maxcompete = 3, maxsurrogate = 4,
                               usesurrogate = 2, xval = 3, surrogatestyle = 0, maxdepth = 10)

# Train the decision tree regressor model
dtr <- rpart(train_encoded_attributes$count ~ ., data = train_encoded_attributes[,-c(6)],
             control = rpart.control, method = 'anova', cp = 0.01)

# Display summary of the decision tree model
summary(dtr)

# Interpretation:
cat("\nInterpretation:\n")
cat("The decision tree regressor is trained with control parameters to control its performance.\n")
cat("The summary provides insights into the structure of the decision tree, including splits, terminal nodes, and node statistics.\n")


# Section: Visualizing Enhanced Decision Tree Model

# Set heading for the code block
cat("Visualizing Enhanced Decision Tree Model:\n")

# Load the rpart.plot library for plotting the learned decision tree model
library(rpart.plot)

# Set custom color palette for the decision tree plot
custom_palette <- c("#FF0000", "#FF6347", "#FFA500", "#008000", "#0000FF", "#4B0082")

# Plot the learned decision tree model with enhanced visualization
# Use 'col' parameter to set the color palette
rpart.plot(dtr, col = custom_palette, shadow.col = "blue", nn = TRUE, roundint = FALSE,
           main = "Enhanced Decision Tree Model", branch.lty = 3, under = TRUE, box.col = "lightblue",
           split.cex = 1.5, compress = TRUE, extra = 101, varlen = 0, tweak = 2.0)

# Interpretation:
cat("\nInterpretation:\n")
cat("The enhanced visualization of the learned decision tree model improves aesthetics and clarity.\n")
cat("Custom color palette and styling options are applied to make the plot more attractive.\n")
cat("Understanding the decision tree structure becomes more engaging and informative.\n")


# Section: Cross Validation Prediction for Decision Tree Regressor

# Set heading for the code block
cat("Cross Validation Prediction for Decision Tree Regressor:\n")

# Ignore warning messages during execution
options(warn = -1)

# Load the caret package
library(caret)

# Set seed for reproducibility of results
set.seed(5769)

# Define cross-validation resampling method
train.control <- trainControl(method = 'CV', number = 3)

# Perform cross-validation prediction using the decision tree regressor
dtr_CV_predict <- train(count ~ ., data = train_encoded_attributes, method = 'rpart', trControl = train.control)

# Display the cross-validation results
dtr_CV_predict



# Section: Cross-validation prediction plot for decision tree regression

# Create a new color palette for the plot
plot_colors <- c('skyblue', 'darkred')

# Extract predicted values from the list
predicted_counts <- as.numeric(dtr_CV_predict$pred)

# Calculate residuals
observed_counts <- as.numeric(train_encoded_attributes$count)
residuals_dr <- resid(dtr_CV_predict)
residuals_dr

# Cross-validation prediction plot
plot(observed_counts, residuals_dr, 
     xlab = 'Observed Counts', ylab = 'Residuals',
     main = 'Cross Validation Residual Plot', col = plot_colors[1], pch = 16)

# Add a horizontal line at y = 0 for reference
abline(h = 0, col = 'gray', lty = 2)

# Add a smooth line to visualize trends
lines(lowess(y_train, residuals), col = plot_colors[2], lwd = 2)

# Add informative labels
text(4000, 1200, 'Residuals should be randomly scattered around zero.',
     adj = c(0, 0), col = 'darkgreen', font = 1)
text(4000, -800, 'A clear pattern indicates a model misfit.',
     adj = c(0, 0), col = 'darkred', font = 1)
text(4000, 400, 'Lowess smoother line to identify trends.',
     adj = c(0, 0), col = plot_colors[2], font = 1)
text(4000, 200, 'Plot show some finite varience b/w them & for some not.',
     adj = c(0, 0), col = plot_colors[2], font = 1)
# Add legend
legend('topright', legend = c('Residuals', 'Lowess Smoother'),
       col = plot_colors, pch = 16, lwd = 2, cex = 0.8)


# Section: Model Performance on the Test Dataset

# Set seed for reproducibility
set.seed(7882)

# Predict using the trained decision tree regression model
dtr_predictions <- predict(dtr, test_encoded_attributes[,-c(6)])

# Display the first 10 predictions
head(dtr_predictions, 10)

# Section: Decision Tree Regressor - Model Performance Visualization

# Generate a random sample of 10 indices from the test dataset
sample_indices <- sample(1:nrow(test_encoded_attributes), 10)

# Extract the corresponding actual and predicted values for the sampled data
actual_values_dtr <- test_encoded_attributes$count
predicted_values_dtr <- dtr_predictions

# Plot all actual and predicted values using Decision Tree Regressor
plot(1:length(actual_values_dtr), actual_values_dtr, type = "l", col = "blue",
     xlab = "Sample Index", ylab = "Count", main = "Actual vs Predicted Values (Decision Tree Regressor)",
     xlim = c(1, length(actual_values_dtr) + 10), ylim = c(0, max(actual_values_dtr, predicted_values_dtr)))
lines(length(actual_values_dtr) + 1:length(predicted_values_dtr), predicted_values_dtr, col = "orange")

# Add legend
legend("topright", legend = c("Actual", "Predicted"), col = c("blue", "orange"), lty = 1)

# Highlight the last observed data point
points(length(actual_values_dtr), actual_values_dtr[length(actual_values_dtr)], pch = 19, col = "red")

# Highlight the starting point of predicted values
points(length(actual_values_dtr) + 1, predicted_values_dtr[1], pch = 19, col = "green")

# Add information
text(length(actual_values_dtr) + 5, max(actual_values_dtr, predicted_values_dtr)/2,
     "Actual values and Predicted values  using Decision Tree Regressor",
     pos = 1, col = "darkgreen", cex = 0.8)

#Section: Evaluation of Decision tree regressor on Root mean squared error and mean absolute error

set.seed(6889)
#Root mean squared error
rmse<-RMSE(y_test,dtr_predictions)
print(rmse)
#Mean absolute error
mae<-MAE(y_test,dtr_predictions)
print(mae)


# Section: Residual Plot for Decision Tree Regressor

# Calculate residuals for Decision Tree Regressor predictions
residuals_dtr <- y_test - dtr_predictions

# Plot the Residual plot
plot(y_test, residuals_dtr, xlab = 'Observed', ylab = 'Residuals', main = 'Residual Plot for Decision Tree Regressor', col = 'blue', pch = 16)
abline(0, 0, col = 'red', lwd = 2)

# Add informative text
text(2500, 800, "Some data points have the same finite variance between them,\nwhile for others, it may not hold true.", col = "red", cex = 0.8)

# Section: Random Forest Regression
library(randomForest)
# Set seed for reproducibility
set.seed(6788271)

# Load the randomForest library
library(randomForest)

# Train the Random Forest model
rf_model <- randomForest(count ~ ., data = train_encoded_attributes, importance = TRUE, ntree = 200)
rf_model


# Section: Cross Validation Prediction for Random Forest

# Ignore warning messages during execution
options(warn = -1)

# Set seed for reproducibility
set.seed(6772)

# Load the randomForest library
library(randomForest)

# Load the ranger library for Random Forest CV
library(ranger)

# Define cross-validation resampling method
train.control <- trainControl(method = 'CV', number = 3)

# Cross-validation prediction
rf_CV_predict <- train(count ~ ., data = train_encoded_attributes, method = 'ranger', trControl = train.control)
rf_CV_predict

cat("The Random Forest model was trained on 511 samples with 19 predictors. The training utilized cross-validated resampling with 3 folds, resulting in sample sizes of 340, 342, and 340 across the folds. The model was tuned with different values for the number of variables randomly sampled at each split (mtry) and the split rule. The final model, selected based on the smallest Root Mean Squared Error (RMSE), had the parameters mtry = 18, splitrule = extratrees, and min.node.size = 5. The performance metrics for the selected model were RMSE = 733.25, Rsquared = 0.8505, and MAE = 503.57, indicating a good fit to the data.\n")



# Section: Cross Validation Prediction Plot for Random Forest

# Extracting residuals from Random Forest cross-validation predictions
residuals <- resid(rf_CV_predict)

# Plotting the Cross Validation Prediction Plot
plot(y_train, residuals, xlab = 'Observed', ylab = 'Residuals', 
     main = 'Cross Validation Prediction Plot for Random Forest', col = 'blue', pch = 16, cex.main = 1.2)

# Adding a reference line at y = 0
abline(0, 0, col = 'red', lwd = 2)

# Adding informative labels and title
text(6000, 800, "Residuals from Random Forest cross-validation predictions", 
     col = "darkgreen", cex = 0.8)

# Adding grid lines for better readability
grid()

# Adding a legend
legend('topright', legend = 'Residuals', col = 'blue', pch = 16, cex = 0.8)

# Adding more context to the observation
text(5500, 500, "Observation: The residuals should be randomly scattered around the reference line at y = 0.", 
     col = "purple", cex = 0.8)
text(5500, 400, "Patterns or trends in the residuals may suggest areas where the model can be improved.", 
     col = "purple", cex = 0.8)

cat("Observation: The residuals should ideally be randomly scattered around the reference line at y = 0,\n")
cat("indicating unbiased predictions. Patterns or trends in the residuals may suggest areas where the model can be improved.\n")


# Section: Model Performance on Test Data for Random Forest

# Set seed for reproducibility
set.seed(7889)

# Predict the Random Forest model on the test dataset
rf_predictions <- predict(rf_model, test_encoded_attributes[,-c(7)])

# Display the first 10 predictions
head(rf_predictions, 10)


#Section: Model performation visualisation based on random forest regressor


# Generate a random sample of 10 indices from the test dataset
sample_indices <- sample(1:nrow(test_encoded_attributes), 10)

# Extract the corresponding actual and predicted values for the sampled data
actual_values_rf <- test_encoded_attributes$count
predicted_values_rf <- rf_predictions

# Plot all actual and predicted values using Random forest Regressor
plot(1:length(actual_values_rf), actual_values_rf, type = "l", col = "blue",
     xlab = "Sample Index", ylab = "Count", main = "Actual vs Predicted Values (Random forest Regressor)",
     xlim = c(1, length(actual_values_rf) + 10), ylim = c(0, max(actual_values_rf, predicted_values_rf)))
lines(length(actual_values_rf) + 1:length(predicted_values_rf), predicted_values_rf, col = "orange")

# Add legend
legend("topright", legend = c("Actual", "Predicted"), col = c("blue", "orange"), lty = 1)

# Highlight the last observed data point
points(length(actual_values_rf), actual_values_rf[length(actual_values_rf)], pch = 19, col = "red")

# Highlight the starting point of predicted values
points(length(actual_values_rf) + 1, predicted_values_rf[1], pch = 19, col = "green")

# Add information
text(length(actual_values_rf) + 5, max(actual_values_rf, predicted_values_rf)/2,
     "Actual values and Predicted values  using Random forest Regressor",
     pos = 1, col = "darkgreen", cex = 0.8)


# Section: Model Performance Evaluation of Random Forest regressor based on RMSE and MAE

# Set seed for reproducibility
set.seed(667)

# Root Mean Squared Error (RMSE) calculation
rmse <- RMSE(y_test, rf_predictions)
print(rmse)

# Mean Absolute Error (MAE) calculation
mae <- MAE(y_test, rf_predictions)
print(mae)


# Section: Residual Plot for Random Forest Regressor

# Calculate residuals for Random Forest predictions
residuals <- y_test - rf_predictions

# Plot the Residual Plot
plot(y_test, residuals, 
     xlab = 'Observed', ylab = 'Residuals', 
     main = 'Residual Plot for Random Forest Regressor', col = 'blue', pch = 16)

# Add a reference line at y = 0
abline(0, 0, col = 'red', lty = 2)

# Enhance plot aesthetics
grid(col = "lightgray")
title(main = "Residual Plot for Random Forest Regressor", col.main = "darkgreen", font.main = 2)
axis(side = 1, col = "darkblue", col.axis = "darkblue")
axis(side = 2, col = "darkblue", col.axis = "darkblue")

# Add informative labels
text(3000, 1000, "The plot shows the residuals from the Random Forest predictions.", 
     col = "red", cex = 0.8)

# Add observations
cat("Observation: In an ideal scenario, residuals should be randomly scattered around the reference line at y = 0.\n")
cat("Patterns or trends in the residuals may suggest areas where the model can be improved.\n")

#Section: Selecting best Model in all three for futher prediction

# Calculate RMSE and MAE for each model
lm_rmse <- RMSE(lm_predictions, test_encoded_attributes$count)
lm_mae <- MAE(lm_predictions, test_encoded_attributes$count)

dtr_rmse <- RMSE(dtr_predictions, test_encoded_attributes$count)
dtr_mae <- MAE(dtr_predictions, test_encoded_attributes$count)

rf_rmse <- RMSE(rf_predict, test_encoded_attributes$count)
rf_mae <- MAE(rf_predict, test_encoded_attributes$count)

# Create an accuracy table
accuracy_table <- data.frame(
  Model = c("Linear Regression", "Decision Tree Regressor", "Random Forest Regressor"),
  RMSE = c(lm_rmse, dtr_rmse, rf_rmse),
  MAE = c(lm_mae, dtr_mae, rf_mae)
)

# Find the best model based on the minimum RMSE and MAE
best_model <- accuracy_table[which.min(accuracy_table$RMSE + accuracy_table$MAE), ]

# Print the accuracy table
print(accuracy_table)

# Print the best model
print("Best Model:")
print(best_model)

# Section: Selecting Final Model as Random Forest Regressor for Prediction of Bike Rental Count

# Combine observed and predicted values
Bike_predictions <- data.frame(Observed = y_test, Predicted = rf_predict)

# Write predictions to a CSV file
write.csv(Bike_predictions, 'Bike_Renting_Predictions.csv', row.names = FALSE)

# Display the predictions
Bike_predictions

# Conclusion: Random Forest Model Outperforms
cat("When comparing RMSE and MAE of all 3 models, the random forest model shows the least errors.\n")
cat("Thus, the random forest model is considered the best for predicting daily bike rental counts.\n")
