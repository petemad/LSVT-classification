function [acc] = nbcriterion(train,trainresult,test,testresult)
%Calculates the criterion for naive bayes classifier, criterion is accuracy
%of prediction
ind2 = find(trainresult==2);
ind1 = find(trainresult==1);

class1 = train(ind1,:);
class2 = train(ind2,:);

mu1=mean(class1);
sigma1=std(class1);
ret =[];
mu2=mean(class2);
sigma2=std(class2);

pclass1 = size(class1,1)/size(train,1);
pclass2 = size(class2,1)/size(train,1);

for i=1:size(test,1)
prob1 = normpdf(test(i,:),mu1,sigma1);
prob2 = normpdf(test(i,:),mu2,sigma2);

prob1 = prod(prob1)*pclass1;
prob2 = prod(prob2)*pclass2;

reta = prob1<=prob2;
reta=reta+1;
ret=[ret; reta];
end
acc = ret~=testresult;
acc = find(acc==1);
acc = size(acc,1);
end
