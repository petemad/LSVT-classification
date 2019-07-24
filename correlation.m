function [corr] = correlation(X,Y)
%calculates the correlation coefficient for each feature with Y
corr = [];
for i = 1:size(X')
    mat = corrcoef(X(:,i),Y);
    corri = mat(2,1);
    corr = [ corr ; corri ];
end
end
%[B I] = maxk(abs(r),5);
