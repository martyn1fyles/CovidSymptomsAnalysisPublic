probs_vec = seq(from = 0, to = 1, length.out = 11)
names(probs_vec) = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)

generate_binary_vec = function(p){
  X = matrix(nrow = 1, ncol = 10)
  for (i in 1:10){
    X[1,i] = rbinom(1, 1, p[i])
  }
  return(X)
}

get_age_dependent_symptoms_prob = function(age){
  # returns a vector of symptoms, where the probability of getting different
  # symptoms depends on the age of the individual. In particular, for small ages
  # we model a single, loose cluster of symptoms. As an individual gets older,
  # we model 2 distinct symptom clusters forming.
  
  in_loose_cluster = rbinom(1, 1, unname(probs_vec[age])) == 0
  
  if(in_loose_cluster){
    # generate loose clustering
    p = c(0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3)
  } else {
    
    # if not in the loose cluster, we model two distinct clusters. A case can
    # only belong to a single cluster, and this occurs with equal probability.
    cluster_A = rbinom(1, 1, 0.5) == 1
    
    if(cluster_A) {
      # first 5 symptoms with high probs, other symptoms low prob
      p = c(0.5, 0.5, 0.5, 0.5, 0.5, 0.1, 0.1, 0.1, 0.1, 0.1)
    } else {
      # last 5 symptoms with high probs, other symptoms low prob
      p = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.5, 0.5, 0.5, 0.5, 0.5)
    }
  }
  return(p)
}

get_age_dependent_symptoms = function(age, nreps){
  
  X = matrix(nrow = 0, ncol = 10)
  
  for (i in 1:nreps){
    p = get_age_dependent_symptoms_prob(age)
    symptoms = generate_binary_vec(p)
    X = rbind(X, symptoms)
  }
  return(X)
}

get_age_related_symptoms_df = function(nreps_per_age){
  
  X = matrix(nrow = 0, ncol = 11)
  
  for(age in c('0', '10', '20', '30', '40', '50', '60', '70', '80', '90', '100')) {
    symptoms = get_age_dependent_symptoms(age, nreps_per_age)
    age_with_symptoms = cbind(age, symptoms)
    X = rbind(X, age_with_symptoms)
  }
  
  
  X = data.frame(X)
  
  
  colnames(X) = c('Age', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j')
  
  return(X)
}

symptoms_df = get_age_related_symptoms_df(200)

write.csv(symptoms_df, file = 'Example/Inputs/SymptomsAgeData.csv')
