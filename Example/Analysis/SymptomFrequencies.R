library(dplyr)

dataset = read.csv('Example/Inputs/example_dataset_1.csv')

# drop the index column
dataset = dataset[,-1]

symptom_proportions = apply(dataset, 2, mean)

write.csv(symptom_proportions, file = 'Example/Outputs/symptom_proportions.csv')
