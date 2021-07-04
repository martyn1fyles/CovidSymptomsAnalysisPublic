# CovidSymptomsAnalysisPublic

# Overview
Released datasets and code to support paper "Diversity of symptom phenotypes in SARS-CoV-2 community infections" by Fyles et al. 

# Layout
Data:
Contains the outputs of analyses performed on various different symptom datasets. Each subfolder contains: Jaccard distance matrix, UMAP embeddings, LPCA outputs and model selection data, and additional descriptive statistics. There is also a Lookup folder which contains several config files that are used to map the raw symptom names to more readable outputs. For confidentiality reasons, we are unable to release the raw data we used.

Visualisation:
Contains several R Markdown notebooks that are used to create various visualisation of the analysis outputs. These include the plots in the main body and supplementary materials of the paper, however there are several additional plot variations produced here.

Figures:
Outputted visualisations of the analyss results. Contains all the plots used in the original paper. Several of the visualation notebooks that offer variations on the plots in the paper will write to the same filename, which results in some overwriting.

CodeForReproducibility:
Script and notebook files that were used to perform the analysis in the various computing environments. These files will likely not work outside of their original computing environments, however they demonstrate our analysis workflow and the code can be reused elsewhere.

Example:
We have generated a fake dataset upon which all the analyses can be performed.
