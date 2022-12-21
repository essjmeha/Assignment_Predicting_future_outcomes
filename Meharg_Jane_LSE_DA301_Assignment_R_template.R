## LSE Data Analytics Online Career Accelerator 

# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Assignment template

## Scenario
## You are a data analyst working for Turtle Games, a game manufacturer and 
## retailer. They manufacture and sell their own products, along with sourcing
## and selling products manufactured by other companies. Their product range 
## includes books, board games, video games and toys. They have a global 
## customer base and have a business objective of improving overall sales 
##performance by utilising customer trends. 

## In particular, Turtle Games wants to understand:
## - how customers accumulate loyalty points (Week 1)
## - how useful are remuneration and spending scores data (Week 2)
## - can social data (e.g. customer reviews) be used in marketing 
##     campaigns (Week 3)
## - what is the impact on sales per product (Week 4)
## - the reliability of the data (e.g. normal distribution, Skewness, Kurtosis)
##     (Week 5)
## - if there is any possible relationship(s) in sales between North America,
##     Europe, and global sales (Week 6).

################################################################################

# Week 4 assignment: EDA using R

## The sales department of Turtle games prefers R to Python. As you can perform
## data analysis in R, you will explore and prepare the data set for analysis by
## utilising basic statistics and plots. Note that you will use this data set 
## in future modules as well and it is, therefore, strongly encouraged to first
## clean the data as per provided guidelines and then save a copy of the clean 
## data for future use.

# Instructions
# 1. Load and explore the data.
##  - Remove redundant columns (Ranking, Year, Genre, Publisher) by creating 
##      a subset of the data frame.
##  - Create a summary of the new data frame.
# 2. Create plots to review and determine insights into data set.
##  - Create scatterplots, histograms and boxplots to gain insights into
##      the Sales data.
##  - Note your observations and diagrams that could be used to provide
##      insights to the business.
# 3. Include your insights and observations.

###############################################################################

# 1. Load and explore the data

# Install and import Tidyverse.
library(tidyverse)

# Import the data set.
data <- read.csv(file.choose(), header=T)
data <- read.csv('turle_sales.csv', header=TRUE)
# Print the data frame.
print(data)

# Create a new data frame from a subset of the sales data frame.
# Remove unnecessary columns. 
data2 <- select(data, -Ranking, -Year, -Genre, -Publisher)

# View the data frame.
print(data2)

# View the descriptive statistics.
summary(data2)

################################################################################

# 2. Review plots to determine insights into the data set.

## 2a) Scatterplots
# Create scatterplots.
qplot(Platform, Global_Sales, data=data2)
qplot(Platform, NA_Sales, data=data2)
qplot(Platform, EU_Sales, data=data2)


## 2b) Histograms
# Create histograms.
plot(hist(data2$Global_Sales))
plot(hist(data2$NA_Sales))
plot(hist(data2$EU_Sales))

qplot(Global_Sales, bins=15, data=data2)

## 2c) Boxplots
# Create boxplots.
qplot(Platform, Global_Sales, data=data2, geom='boxplot')
qplot(Platform, NA_Sales, data=data2, geom='boxplot')
qplot(Platform, EU_Sales, data=data2, geom='boxplot')
###############################################################################

# 3. Observations and insights

## Observations and insights
# The histogram showed that class shape of sales you expect in retail.  
# Globally, over 200 lines did up to £5m.  
# With a rapid decline in the number of items achieving £10m incremented sales.
# The outlier of one line selling £70m!  
# 200+ lines that sold up to £5m.  

# boxplot, on global sales you can see a number of outliers near the 0 lines
# that should potentially be discontinued. 

# The 2600 game sells well in the US but is one of the worst selling games in EU
# Potentially remove all games for PSV.  

# Wii game selling nearly £70m globally!  
# Nearly twice as much as the next best seller.
# box plot show a number of other outiers of best sellers. More in the US and EU.


# Boxplot and scatterplot show games perform differently in different regions 
# e.g 2600 game shood out as its the only game for that console.  

# Removing worst selling games free up cash for better selling and/or new games.
# The outliers for best selling games need to be further investigated.  
# Are these games available on other consols? 
# Is there potential to develop other merchandise base on these games?
# Is there a reason for the high sales? Were they on promotion/sale? 
# Did they receive extra marketing or listed in a premium location of the site?
# Is this the reason some games sold better in America than EU?
# Before investing more stock in these ranges you need to be sure WHY they sold.
# If US did more marketing activity can these be applied to the EU?
# Having access to the margins would help me identify these answers. 





###############################################################################
###############################################################################


# Week 5 assignment: Cleaning and maniulating data using R

## Utilising R, you will explore, prepare and explain the normality of the data
## set based on plots, Skewness, Kurtosis, and a Shapiro-Wilk test. Note that
## you will use this data set in future modules as well and it is, therefore, 
## strongly encouraged to first clean the data as per provided guidelines and 
## then save a copy of the clean data for future use.

## Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 4 assignment. 
##  - View the data frame to sense-check the data set.
##  - Determine the `min`, `max` and `mean` values of all the sales data.
##  - Create a summary of the data frame.
# 2. Determine the impact on sales per product_id.
##  - Use the group_by and aggregate functions to sum the values grouped by
##      product.
##  - Create a summary of the new data frame.
# 3. Create plots to review and determine insights into the data set.
##  - Create scatterplots, histograms, and boxplots to gain insights into 
##     the Sales data.
##  - Note your observations and diagrams that could be used to provide 
##     insights to the business.
# 4. Determine the normality of the data set.
##  - Create and explore Q-Q plots for all sales data.
##  - Perform a Shapiro-Wilk test on all the sales data.
##  - Determine the Skewness and Kurtosis of all the sales data.
##  - Determine if there is any correlation between the sales data columns.
# 5. Create plots to gain insights into the sales data.
##  - Compare all the sales data (columns) for any correlation(s).
##  - Add a trend line to the plots for ease of interpretation.
# 6. Include your insights and observations.

################################################################################

# 1. Load and explore the data

# View data frame created in Week 4.
View(data2)


# Check output: Determine the min, max, and mean values.

# Min NA, EU and Global sales
min(data2$NA_Sales)  
min(data2$EU_Sales)
min(data2$Global_Sales)
   
# Max NA, EU and Global sales     
max(data2$NA_Sales)  
max(data2$EU_Sales)
max(data2$Global_Sales)

# Mean NA, EU and Global sales
mean(data2$NA_Sales)  
mean(data2$EU_Sales)
mean(data2$Global_Sales)

# View the descriptive statistics.
summary(data2)

# Create Data Profiling Report
DataExplorer::create_report(data2)



###############################################################################

# 2. Determine the impact on sales per product_id.

## 2a) Use the group_by and aggregate functions.
# Group data based on Product and determine the sum per Product.
product_global_sale <- aggregate(Global_Sales~Product, data2, sum)
product_NA_sale <- aggregate(NA_Sales~Product, data2, sum)
product_EU_sale <- aggregate(EU_Sales~Product, data2, sum)

# View the data frame.
product_global_sale
product_NA_sale
product_EU_sale

# Explore the dataframe.
# Summary of each new dataframe
summary(product_global_sale)
summary(product_NA_sale)
summary(product_EU_sale)

# create report for each new dataframe
DataExplorer::create_report(product_global_sale)
DataExplorer::create_report(product_NA_sale)
DataExplorer::create_report(product_EU_sale)

## 2b) Determine which plot is the best to compare game sales.
# Create scatterplots.

qplot(Product, Global_Sales, data=product_global_sale)
qplot(Product, NA_Sales, data=product_NA_sale)
qplot(Product, EU_Sales, data=product_EU_sale)


# Create histograms.

plot(hist(product_global_sale$Global_Sales))
plot(hist(product_NA_sale$NA_Sales))
plot(hist(product_EU_sale$EU_Sales))




# Create boxplots.

qplot(Product, Global_Sales, data=product_global_sale, geom='boxplot')
qplot(Product, NA_Sales, data=product_NA_sale, geom='boxplot')
qplot(Product, EU_Sales, data=product_EU_sale, geom='boxplot')


###############################################################################


# 3. Determine the normality of the data set.

## 3a) Create Q-Q Plots
# Create Q-Q Plots.
qqnorm(product_global_sale$Global_Sales)
qqline(product_global_sale$Global_Sales)



## 3b) Perform Shapiro-Wilk test
# Install and import Moments.

install.packages('moments') 
library(moments)


# Perform Shapiro-Wilk test - Global Sales
shapiro.test(product_global_sale$Global_Sales)

# Perform Shapiro-Wilk test - EU Sales
shapiro.test(product_EU_sale$EU_Sales)

# Perform Shapiro-Wilk test - NA Sales
shapiro.test(product_NA_sale$NA_Sales)

## 3c) Determine Skewness and Kurtosis
# Skewness - Global Sales
skewness(product_global_sale$Global_Sales)

# Skewness - EU
skewness(product_EU_sale$EU_Sales)

# Skewness - NA
skewness(product_NA_sale$NA_Sales)

# Kurtosis - Global Sales
kurtosis(product_global_sale$Global_Sales)

# Kurtosis - EU
kurtosis(product_EU_sale$EU_Sales)

# Kurtosis - NA
kurtosis(product_NA_sale$NA_Sales)

## 3d) Determine correlation

# Determine correlation - Global Sales
cor(product_global_sale$Global_Sales, product_global_sale$Product)

# Determine correlation - EU Sales
cor(product_EU_sale$EU_Sales, product_EU_sale$Product)

# Determine correlation - NA Sales
cor(product_NA_sale$NA_Sales, product_NA_sale$Product)

###############################################################################

# 4. Plot the data
# Create plots to gain insights into data.
# Choose the type of plot you think best suits the data set and what you want 
# to investigate. Explain your answer in your report.


# Scatterplot to indicate relation between global sales and product.
ggplot(data = product_global_sale,
       mapping = aes(x = Product, y = Global_Sales)) +
  geom_point(color = 'red', alpha = 0.5, size = 1.5) +
  
  # Add the line-of-best-fit to the plot.
  geom_smooth(method = 'lm')


# Scatterplot to indicate relation between global sales and product
# without outliers.

# Create a new dataframe without  outliers
new_data <- filter(product_global_sale, Global_Sales<25)

# Scatterplot new dataframe
ggplot(data = new_data,
       mapping = aes(x = Product, y = Global_Sales)) +
  geom_point(color = 'red', alpha = 0.5, size = 1.5) +
  
  # Add the line-of-best-fit to the plot.
  geom_smooth(method = 'lm')+
  
  # Add a title
  labs(title="Relationship between Global sales and Product ID")


# Scatterplot compare EU and NA sales by platform without outiers
data3 <- filter(data, Global_Sales<25)


ggplot(data3,
       mapping=aes(x=NA_Sales, y=EU_Sales)) +
  geom_point(color='red',
             alpha=0.75,
             size=2.5) +
  scale_x_continuous("NA Sales") +
  scale_y_continuous("EU Sales") +
  labs(title="Sales by region and Plaform") + 
  facet_wrap(~Platform)

# Scatterplot compare EU and NA sales by year without outiers
# check is older sames sold more/less
ggplot(data3,
       mapping=aes(x=NA_Sales, y=EU_Sales)) +
  geom_point(color='red',
             alpha=0.75,
             size=2.5) +
  scale_x_continuous("NA Sales") +
  scale_y_continuous("EU Sales") +
  labs(title="Sales by region and Plaform") + 
  facet_wrap(~Year)


# Scatterplot EU and NA sales (exuding outliers)
ggplot(data = data3,
       mapping = aes(x = NA_Sales, y = EU_Sales)) +
  geom_point(color = 'red', alpha = 0.5, size = 1.5) +
  
  # Add the line-of-best-fit to the plot.
  geom_smooth(method = 'lm')+
  
  # Add a title
  labs(title="Relationship between EU amd NA sales for each product 
       (excluding outliers)")

# percentage global sales by platform Bar chart 

ggplot(data=data2, aes(x=Platform, y=Global_Sales)) +
  geom_bar(stat='identity') +
  scale_y_continuous(labels = scales::percent)+
  labs(x = "Platform",
       y = "Global sales %",
       title = "Global Sales % by platform")+
  # Flip the x-axis and y-axis.
  coord_flip()



# percentage global sales by genre Bar chart 
ggplot(data=data, aes(x=Genre, y=Global_Sales)) +
  geom_bar(stat='identity') +
  scale_y_continuous(labels = scales::percent)+
  labs(x = "Genre",
       y = "Global sales %",
       title = "Global Sales % by Genre")+
  # Flip the x-axis and y-axis.
  coord_flip()

# percentage EU sales by genre Bar chart 
ggplot(data=data, aes(x=Genre, y=EU_Sales)) +
  geom_bar(stat='identity') +
  scale_y_continuous(labels = scales::percent)+
  labs(x = "Genre",
       y = "EU sales %",
       title = "EU Sales % by Genre")+
  # Flip the x-axis and y-axis.
  coord_flip()

# percentage NA sales by genre Bar chart 
ggplot(data=data, aes(x=Genre, y=NA_Sales)) +
  geom_bar(stat='identity') +
  scale_y_continuous(labels = scales::percent)+
  labs(x = "Genre",
       y = "NA sales %",
       title = "NA Sales % by Genre")+
  # Flip the x-axis and y-axis.
  coord_flip()

###############################################################################

# 5. Observations and insights
# Your observations and insights here...

# Not normally distributed.
# Heavy right tailed
# a negative correlation
# Assuming the lower the product number the older the product.
# The longer it has been on sale the higher the sales.  
# product that fall above the line would suggest these are worth investing in 
# a larger range (more consols, explansion packs, merchandise).
# To ensure the right level of stock investment you need to view recent sales.
# With the exception of sport,
# EU and NA follow similar sales mix across the genres


###############################################################################
###############################################################################

# Week 6 assignment: Making recommendations to the business using R

## The sales department wants to better understand if there is any relationship
## between North America, Europe, and global sales. Therefore, you need to
## investigate any possible relationship(s) in the sales data by creating a 
## simple and multiple linear regression model. Based on the models and your
## previous analysis (Weeks 1-5), you will then provide recommendations to 
## Turtle Games based on:
##   - Do you have confidence in the models based on goodness of fit and
##        accuracy of predictions?
##   - What would your suggestions and recommendations be to the business?
##   - If needed, how would you improve the model(s)?
##   - Explain your answers.

# Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 5 assignment. 
# 2. Create a simple linear regression model.
##  - Determine the correlation between the sales columns.
##  - View the output.
##  - Create plots to view the linear regression.
# 3. Create a multiple linear regression model
##  - Select only the numeric columns.
##  - Determine the correlation between the sales columns.
##  - View the output.
# 4. Predict global sales based on provided values. Compare your prediction to
#      the observed value(s).
##  - NA_Sales_sum of 34.02 and EU_Sales_sum of 23.80.
##  - NA_Sales_sum of 3.93 and EU_Sales_sum of 1.56.
##  - NA_Sales_sum of 2.73 and EU_Sales_sum of 0.65.
##  - NA_Sales_sum of 2.26 and EU_Sales_sum of 0.97.
##  - NA_Sales_sum of 22.08 and EU_Sales_sum of 0.52.
# 5. Include your insights and observations.

###############################################################################

# 1. Load and explore the data
# View data frame created in Week 5.

data3 <- select(data2, -Platform)
head(data3)

# Determine a summary of the data frame.
summary(data3)

###############################################################################

# 2. Create a simple linear regression model
## 2a) Determine the correlation between columns
# Create a linear regression model on the original data.

cor(data3)

# Visualised correlation
# Install the psych package.
install.packages('psych')

# Import the psych package.
library(psych)

corPlot(data3, cex=2)

## 2b) Create a plot (simple linear regression)
# remove outliers
data3 <- filter(data3, Global_Sales<25)

# Basic visualisation - model 1 _ NA.

plot(data3$Global_Sales , data3$NA_Sales)

model1 <- lm(NA_Sales~Global_Sales,
             data=data3)

# View
model1 

# Summary
summary(model1)

# Basic visualisation - model 2 EU_Sales.

plot(data3$Global_Sales , data3$EU_Sales)

model2 <- lm(EU_Sales~Global_Sales,
             data=data3)

model2

summary(model2)


###############################################################################

# 3. Create a multiple linear regression model
# Select only numeric columns from the original data frame.

head(data3)


# Multiple linear regression model.
# Model A
# x = EU_Sales and NA_Sales
# y = Global_sales

modela = lm(Global_Sales~EU_Sales+NA_Sales, data=data3)

# Print the summary statistics.
summary(modela)

# Model B
# x = EU_Sales and NA_Sales and Product
# y = Global_sales

modelb = lm(Global_Sales~EU_Sales+NA_Sales, Product, data=data3)

# Print the summary statistics.
summary(modelb)

###############################################################################

# 4. Predictions based on given values
# Compare with observed values for a number of records.

# Create a new dataframe with observed values
data_predict <- data.frame(NA_Sales=c(34.02, 3.93, 2.73, 2.26, 22.08),
                           EU_Sales=c(23.8, 1.56, 0.65, 0.97, 0.52))

# View the new dataframe

str(data_predict)

# Create a new object and specify the predict function.
predictTest = predict(modelb, newdata=data_predict,
                      interval='confidence')

# Print the object.
predictTest 



###############################################################################

# 5. Observations and insights
# Your observations and insights here...

# high positive correlations between NA_Sales and Global_Sales
# high positive correlations between EU_Sales and Global_Sales
# Correlation between product code and sales between -0.41 and -0.46.
# Linear regression models using NA sales to predict Global sales
# has Adjusted R Squared os 0.81.
# 81% of global sales could be predicted by NA sales.
# This is a good accuracy model.  
# With multiple linear regression (model B) produced an 
# Adjusted R Squared of 0.99
# Used NA Sales, EU Sales and product for max accurately.



###############################################################################
###############################################################################




