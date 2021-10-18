
# generates some example data from 3 distinct clusters.

n_obs_per_clust = 300

X = matrix(nrow = n_obs_per_clust * 3, ncol = 10)
X[1:n_obs_per_clust,1] =  rbinom(n_obs_per_clust, 1, 0.1) # low
X[1:n_obs_per_clust,2] =  rbinom(n_obs_per_clust, 1, 0.08)# low
X[1:n_obs_per_clust,3] =  rbinom(n_obs_per_clust, 1, 0.12)# low
X[1:n_obs_per_clust,4] =  rbinom(n_obs_per_clust, 1, 0.3) # med
X[1:n_obs_per_clust,5] =  rbinom(n_obs_per_clust, 1, 0.34)# med
X[1:n_obs_per_clust,6] =  rbinom(n_obs_per_clust, 1, 0.25)# med
X[1:n_obs_per_clust,7] =  rbinom(n_obs_per_clust, 1, 0.7) # high
X[1:n_obs_per_clust,8] =  rbinom(n_obs_per_clust, 1, 0.6) # high
X[1:n_obs_per_clust,9] =  rbinom(n_obs_per_clust, 1, 0.8) # high
X[1:n_obs_per_clust,10] =  rbinom(n_obs_per_clust, 1, 0.9)# high

X[(n_obs_per_clust + 1):(2*n_obs_per_clust),1] =  rbinom(n_obs_per_clust, 1, 0.68)# high
X[(n_obs_per_clust + 1):(2*n_obs_per_clust),2] =  rbinom(n_obs_per_clust, 1, 0.8) # high
X[(n_obs_per_clust + 1):(2*n_obs_per_clust),3] =  rbinom(n_obs_per_clust, 1, 0.8) # high
X[(n_obs_per_clust + 1):(2*n_obs_per_clust),4] =  rbinom(n_obs_per_clust, 1, 0.3) # med
X[(n_obs_per_clust + 1):(2*n_obs_per_clust),5] =  rbinom(n_obs_per_clust, 1, 0.34)# med
X[(n_obs_per_clust + 1):(2*n_obs_per_clust),6] =  rbinom(n_obs_per_clust, 1, 0.25)# med
X[(n_obs_per_clust + 1):(2*n_obs_per_clust),7] =  rbinom(n_obs_per_clust, 1, 0.02)# low
X[(n_obs_per_clust + 1):(2*n_obs_per_clust),8] =  rbinom(n_obs_per_clust, 1, 0.35)# low
X[(n_obs_per_clust + 1):(2*n_obs_per_clust),9] =  rbinom(n_obs_per_clust, 1, 0.25)# low
X[(n_obs_per_clust + 1):(2*n_obs_per_clust),10] =  rbinom(n_obs_per_clust, 1, 0.13)# low

X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),1] =  rbinom(n_obs_per_clust, 1, 0.11) # low
X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),2] =  rbinom(n_obs_per_clust, 1, 0.02) # low
X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),3] =  rbinom(n_obs_per_clust, 1, 0.2)  # low  
X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),4] =  rbinom(n_obs_per_clust, 1, 0.8)  # high
X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),5] =  rbinom(n_obs_per_clust, 1, 0.7)  # high
X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),6] =  rbinom(n_obs_per_clust, 1, 0.65) # high
X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),7] =  rbinom(n_obs_per_clust, 1, 0.1)  # low
X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),8] =  rbinom(n_obs_per_clust, 1, 0.2)  # low
X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),9] =  rbinom(n_obs_per_clust, 1, 0.15) # low
X[(2*n_obs_per_clust + 1):(3*n_obs_per_clust),10] =  rbinom(n_obs_per_clust, 1, 0.02)# low

colnames(X) = c(
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J'
)

write.csv(X, file = 'Example/Inputs/example_dataset_1.csv')
