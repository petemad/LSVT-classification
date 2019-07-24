function [MaxAcc, MaxSen, MaxSpec] = maxParam(X,Y,fun)
%Calculates maximum average accuracy senstivity and specificity
MaxAcc = 0; 
MaxSpec = 0;
MaxSen = 0;
for i=1:100
  [acci, seni, speci]=fun(X,Y);  %function holder either testnb or testkn
  if acci>MaxAcc
      MaxAcc = acci;
  end
  if seni>MaxSen
      MaxSen = seni;
  end
  if speci>MaxSpec
      MaxSpec = speci;
  end
end
end


