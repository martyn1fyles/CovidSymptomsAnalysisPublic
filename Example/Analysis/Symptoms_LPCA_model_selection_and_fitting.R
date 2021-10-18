library(logisticPCA)

# Load data
# The data is extracted using the python notebook "population_level_statistics"
symptoms_data = read.csv("Example/Inputs/example_dataset_1.csv")

# drop the index column when plugging into the LPCA, we need it later
symptoms_data_bool = symptoms_data[-1]

# ~~~~~ Model selection ~~~~~
# For a given k, we choose m through cross validation
# We choose k through a scree plot showing the proportion of deviance explained
# by adding components to the model

# This unfortunately results in us doing cross validation for a large grid of
# values, and this can take some time for larger datasets.

# set up a grid of values to search over.
# you will need to increase m if it hits a boundary
m_range = 1:15
k_range = 1:10

# set up some lists to save useful values in
cv_results = list()
deviance_results = c()
optimal_m_results = c()

# Loop over all proposal k
for (k_in in k_range){
  cat('Performing CV for k = ', k_in)
  
  # perform the cross validation
  logpca_cv = cv.lpca(x = symptoms_data_bool, k = k_in, m = m_range)
  
  # save the output for later
  cv_results[[k_in]] = logpca_cv
  
  # find the optimal value of m
  optimal_m = which.min(logpca_cv)
  optimal_m_results = append(optimal_m_results, optimal_m)
  
  if (optimal_m == max(m_range)){
    print('Warning: Optimal m lies at upper boundary. Increase m search limit.')
  }
  
  if (optimal_m == min(m_range)){
    print('Warning: Optimal m lies at lower boundary. Decrease m seach limit.')
  }
  
  # fit a model using the optimal values of m
  logpca_model = logisticPCA(x = symptoms_data_bool, k = k_in, m = optimal_m)
  
  # save the estimate of the deviance
  deviance_results = append(deviance_results, logpca_model$prop_deviance_expl)
}


# Choosing k:
# We examine the proportion of the Bernoulli deviance explained by our low dim 
# representation. See Landgraf and Lee paper for details.
# The first plot is the total Bernoulli deviance explained by a model with k components
# The second plot is the marginal Bernoulli deviance explained by adding the kth component

# Plot the total Bernoulli deviance explained
plot(
  x = k_range,
  y = deviance_results,
  main = "Proportion of deviance explained",
  xlab = "Number of dimensions",
  ylab = "Proportion of deviance explained")

# We can see that nearly all of the bernoulli deviance is explained by 6-7 components.
# We should choose k less than 6 or 7, else we would be concerned about overfitting.

deviance_results

# the marginal bernoulli deviance for k=1 is simply the proportion of deviance explained
# by the model with only 1 component. For the other components, we simply need to difference.

marginal_deviance = diff(deviance_results)
marginal_deviance = append(deviance_results[1], marginal_deviance)

# plot the marginal Bernoulli deviance
plot(
  x = (min(k_range)):max(k_range),
  y = marginal_deviance,
  main = "Deviance explained by adding dimensions",
  xlab = "Dimension added",
  ylab = "Proportion of deviance explained by adding component")
# We observe that the marginal deviance explained by the first two components is
# higher than it is for all models with k > 2 components, which flatten out along a 'shelf'
# This suggests a model with two components is appropriate.

# Save the outputs, so that the model selection can be reproduced
write.csv(deviance_results, "Example/Outputs/LPCA_deviance.csv")

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Section 2: Model fitting
# Once you performed the model selection to choose the optimal k, run this section of code.

# Based on the number of components you have chosen, we have to perform cross validation
# again in order to find the optimal choice of m.
chosen_k = 2

logpca_cv = cv.lpca(x = symptoms_data_bool, k = chosen_k, m = m_range)
lpca_model = logisticPCA(x = symptoms_data_bool, k = chosen_k, m = which.min(logpca_cv))

U = lpca_model$U
row.names(U)<- colnames(symptoms_data_bool)

# save the outputs so that they can be visualized
write.csv(U, 'Example/Outputs/LPCA_SymptomLoadings.csv')
