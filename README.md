# LSVT-classification
  Speech disorders such as dysphonia and dysarthria represent an early and common manifestation of Parkinson’s
disease. Class prediction is an essential task in automatic speech treatment, particularly in Parkinson’s disease cases. Many
classification experiments have been performed which focus on the automatic detection of Parkinson’s disease patients from
healthy speakers but results are still not very optimistic. Our aim in this study is to build a Lee Silverman Voice Treatment
(LSVT) system for assessing the vocal performance of the patients as acceptable or unacceptable, 
using Naive Bayes classifier and Sequential Forward Selection (SFS), we were able to reduce the features from f=310, to f=6 and 
obtained an accuracy of 94.62%, a specificity of 97.26%, and a sensitivity of 94.25%.
  
  The 'main' code runs the algorithm 100 times each time picking different trainning and test sets
    according to kfold crossValidation with k = 10 and gets max average acc, sen, spec for diff features
                        selection (SFS, corr) and classification algorithms (NB, KNN)
