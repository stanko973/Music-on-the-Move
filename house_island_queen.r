#1
library(tidyverse)

#2
#Import the data
data <- read.csv("music_data.csv", header = TRUE)

#3
# Create a scatterplot to visualize the relationship between 'Miles Traveled' and 'Music Sales'
# Format the data so it is easier to read
data_formatted <- data %>%
  select(Miles.Traveled, Music.Sales) %>%
  mutate(Miles.Traveled = as.integer(Miles.Traveled))

#4
# Generate the scatterplot
ggplot(data_formatted, aes(x= Miles.Traveled, y = Music.Sales)) +
  geom_point(colour = "red") +
  labs(title = "Music Sales vs. Miles Traveled", x ="Miles Traveled", y = "Music Sales")

#5
# Fit a linear regression model
lm_fit <- lm(data_formatted$Music.Sales ~ data_formatted$Miles.Traveled)

#6
# Calculate the regression coefficients, standard errors and p-values
reg_coeff <- summary(lm_fit)$coefficients
reg_se <- summary(lm_fit)$coefficients
reg_pval <- summary(lm_fit)$coefficients

#7
# Calculate the R-squared value
r2 <- summary(lm_fit)$r.squared

#8
# Compute the confident interval for the regression parameters
confint_lm <- confint(lm_fit)

#9
# Plot a linear regression line 
ggplot(data_formatted, aes(x= Miles.Traveled, y = Music.Sales)) +
  geom_point(colour = "red") +
  geom_smooth(method=lm) +
  labs(title = "Music Sales vs. Miles Traveled", x ="Miles Traveled", y = "Music Sales")

#10
# Output the regression results 
cat('\nRegression Results:\n')
cat('\nIntercept: ', round(coef(lm_fit)[1],2))
cat('\nSlope: ', round(coef(lm_fit)[2],2))
cat('\nStandard Error: ', round(reg_se[2,2],2))
cat('\np-value: ', round(reg_pval[2,4],2))
cat('\nR-squared: ', round(r2,2))
cat('\nConfident Interval: ', round(confint_lm,2))

#11
# Create a plot that compares the fitted model with the data points 
ggplot(data_formatted, aes(x= Miles.Traveled, y = Music.Sales)) +
  geom_point(colour = "red") +
  geom_line(aes(x=data_formatted$Miles.Traveled, y=predict(lm_fit)), color="blue") +
  labs(title = "Music Sales vs. Miles Traveled", x ="Miles Traveled", y = "Music Sales")

#12
# Predict the music sales when the miles traveled is 2000
cat('\nPrediction of the Music Sales when Miles Traveled is 2000: ', round(predict(lm_fit, data.frame(Miles.Traveled = 2000)),2))

#13
# Calculate the residuals
model_residuals <- resid(lm_fit)

#14
# Generate a scatterplot with the residuals
residual_plot <- ggplot(data_formatted, aes(x=data_formatted$Miles.Traveled, y=model_residuals)) +
    geom_point(colour="blue") +
    geom_hline(aes(yintercept=0)) +
    labs(title = "Residual Plot", x ="Miles Traveled", y = "Model Residuals")

#15
# Calculate the mean absolute error (MAE)
mae <- mean(abs(model_residuals))

#16
# Output the mean absolute error
cat('\nMean Absolute Error: ', round(mae,2))

#17
# Calculate the Root Mean Squared Error (RMSE)
rmse <- sqrt(mean(model_residuals^2))

#18
# Output the root mean squared error
cat('\nRoot Mean Squared Error: ', round(rmse,2))

#19
# Calculate the adjusted R-squared
adj_r2 <- 1 - (1-r2)*(nrow(data)-1)/(nrow(data)-ncol(data_formatted))

#20
# Output the adjusted R-squared
cat('\nAdjusted R-Squared: ', round(adj_r2,2))