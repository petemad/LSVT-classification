function [Icorr1] = maxCorr(corr,k)
B = sort(corr,'descend');
Icorr1=[];
for i = 1:k
It= find(corr==B(i));
Icorr1 = [It Icorr1];
end
end

