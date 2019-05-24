T = length(c2925);
data = p2925(:,:);
S = data(:,3);
P = data(:,2);
K = 2925;
r=0.06;
startT = round(T/4)+1;
s = S(startT);
p = P(startT);

AmPutLattice(S(1),K,r,T/365,0.3,50);