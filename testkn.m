function [acc sen spec]=testkn(X,Y)

k=cvpartition(126,'kfold',10);

acc=[];
spec=[];
sen=[];

for i=1:10

    mdl=fitcknn(X(k.training(i),:),Y(k.training(i)),'NumNeighbors',7);
    mdlres = mdl.predict(X(k.test(i),:));
    tru = Y(k.test(i));
    acci = mdlres==tru;
    acci =find(acci==1);
    acci = size(acci,1)/size(mdlres,1);
    acc=[acc;acci];
    P = find(mdlres==1);
    P = size(P,1);
    N = find(mdlres==2);
    N = size(N,1);
    TP = (mdlres==tru.* (tru==1));
    TN = (mdlres==tru.* (tru==2));
    TP = find(TP==1);
    TP = size(TP,1);
    TN = find(TN==1);
    TN = size(TN,1);
    seni = TP/P;
    speci =TN/N;
    spec=[spec;speci];
    
    sen=[sen;seni];
    
    
end

acc=mean(acc);
spec=mean(spec);
sen=mean(sen);

end