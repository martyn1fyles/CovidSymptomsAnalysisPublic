# CovidSymptomsAnalysisPublic

# Overview
Released datasets and code to support paper "Diversity of symptom phenotypes in SARS-CoV-2 community infections" by Fyles et al.
The paper examines patterns of symptom co-occurrence in SARS-CoV-2 cases across a range of ages and datasets.

# Project Layout

AlignedUMAP:
Notebooks to reproduce the AlignedUMAP analyses, and some visualisation of the results.
 - AgeSliceAlignment subfolder contains code to run AlignedUMAP for the fine age strata (e.g 10 year slices of the data)
 - AgeStrataAlignment subfolder contains code to run AlignedUMAP for the large age strata (<18, 18-55, 55+)
 - Notebook for cross dataset alignment based upon symptoms shared across datasets

Data:
Folder where are read/writing of files occurs. For the most part, it contains the results of analyses that were run inside secure data heavens, e.g: estimated Jaccard matrices, LPCA loadings etc.
Additionally, it contains the results from the AlignedUMAP embeddings, and some lookup files.
Due to data privacy, we are unable to release the raw data used in these analyses.
 - Alignments folder contains the outputs of the Alignment notebooks
 - Slices subfolder contains the estimated Jaccard matrices for the finder age strata (10 year intervals)

Example:
We have generated a fake dataset upon which all the analyses can be performed.

Figures:
Outputted visualisations of the analyses results.
In particular, the Alignment3D folder contains interactive html visualisations of the 3D AlignedUMAP plots.

Visualisation:
Contains several R Markdown notebooks that are used to create various visualisations of the analysis outputs contained in the Data folder, with the exception of the 3D interactive AlignedUMAP embeddings.
These include the plots in the main body and supplementary materials of the paper.

# Requirements
We employ both R and Python when running analyses, depending upon the analysis (i.e: not switching between language mid analysis, rather LPCA is done using R, UMAP however uses Python).
All 2D visualisation is done using R, the 3D interactive html plots are produced using Python.

The required Python packages can be installed using:
TODO: Finish off this section
