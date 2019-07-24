                                               %Main
    %This code runs the algorithm 100 times each time picking different trainning and test sets
    %according to kfold crossValidation with k = 10 and gets max average acc, sen, spec for diff features
                        %selection (SFS, corr) and classification algorithms (NB, KNN)
%%Read the data
X = xlsread('LSVT.xlsx');
Y = xlsread('LSVT.xlsx','Binary response' );
%%Get 4 features
fourfeatures = getfourfeatures(X);
%%Naive Bayes
    %%%Using Sequential Forward Selection
    criteria = @nbcriterion;
    [inmodel,history] = sequentialfs(criteria,X,Y);
    IsfNB= find(inmodel == 1);
    fun = @testnb;%function holder
    [accSFnb, senSFnb, specSFnb] = maxParam(X(:,IsfNB),Y, fun);
    %%%Using Correlation between each of 310 features and the response
    [corrNB] = correlation(X,Y);
    [B, Icorr] = maxk(abs(corrNB),5); % gets indices of 5 features with max corrCoeff
    [accCorNB, senCorNB, specCorNB] = maxParam(X(:,Icorr),Y, fun);
    %%%Using all 310 features
    [acc310NB, sen310NB, spec310NB] = maxParam(X,Y,fun);
    %%%Using 314 features
    [acc314NB, sen314NB, spec314NB] = maxParam([X, fourfeatures],Y,fun);
    %%%Using only 4 calculated features
    [acc4NB, sen4NB, spec4NB] = maxParam(fourfeatures,Y,fun);
%%K-Nearest Neighbours
    %%%Using Sequential Forward Selection
    criteria = @kncriterion;
    [inmodel,history] = sequentialfs(criteria,X,Y);
    IsfKN= find(inmodel == 1);
    fun = @testkn;%function holder
    [accSFkn, senSFkn, specSFkn] = maxParam(X(:,IsfKN),Y, fun);
    %%%Using Correlation between each of 310 features and the response
    [accCorKN, senCorKN, specCorKN] = maxParam(X(:,Icorr),Y, fun);
    %%%Using all 310 features
    [acc310KN, sen310KN, spec310KN] = maxParam(X,Y,fun);
    %%%Using 314 features
    [acc314KN, sen314KN, spec314KN] = maxParam([X, fourfeatures],Y,fun);
    %%%Using only 4 calculated features
    [acc4KN, sen4KN, spec4KN] = maxParam(fourfeatures,Y,fun);    
