function newdata = getfourfeatures(originaldata)
%feature transformation
[samples features]=size(originaldata);
ot = originaldata';
ot = ot.^2;
energy = sum(ot);
energy=energy';
ot = ot.^2;
power = sum(ot);
power = power';
traini2 = originaldata(:,3:features);
traini = originaldata(:,1:features-2);
firstTerm = traini2.*traini;
firstTerm = firstTerm.*-1;
traini1 = originaldata(:,2:features-1);
traini1 = traini1.^2;
secondTerm = traini1;
nonlinearEnergy = firstTerm + secondTerm;
nonlinearEnergy=nonlinearEnergy';
nonlinearEnergy= sum(nonlinearEnergy);
nonlinearEnergy=nonlinearEnergy';
CfirstTerm=originaldata(:,2:310);
CsecondTerm=originaldata(:,1:309);
curveL=CfirstTerm-CsecondTerm;
curveLength=curveL';
curveLength=sum(curveLength);
curveLength=curveLength';

newdata = [ energy power nonlinearEnergy curveLength ];

end