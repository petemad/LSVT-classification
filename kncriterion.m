function [acc]=kncriterion(Xtrain,Ytrain,Xtest,Ytest)
%Calculates the criterion for nearest k neighbors classifier, criterion is accuracy
%of prediction
k=cvpartition(126,'kfold',10);

acc=[];



    mdl=fitcknn(Xtrain,Ytrain,'NumNeighbors',7,'Distance','euclidean');
    mdlres = mdl.predict(Xtest);
    tru = Ytest;
    acci = mdlres~=tru;
    acci =find(acci==1);
    acci = size(acci,1);
    acc=[acc;acci];     

acc = mean(acc);
end

