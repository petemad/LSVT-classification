function [acc sen spec]=testnb(X,Y)

k=cvpartition(126,'kfold',10);

acc=[];
sen=[];
spec=[];

for i=1:10

    [acci seni speci reti] = accuracynb(X(k.training(i),:),Y(k.training(i)),X(k.test(i),:),Y(k.test(i)));
    acc=[acc; acci];
    sen=[sen; seni];
    spec=[spec; speci];
end

acc=mean(acc);
sen=mean(sen);
spec=mean(spec);


end