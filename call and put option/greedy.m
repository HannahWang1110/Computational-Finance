Returns_30 = tick2ret(output2);
Sharpe_30 = sharpe(Returns_30, Riskless);
maximum = max(Sharpe_30);
[x,y]=find(Sharpe_30==maximum);
N=30;
vec=zeros(1,N);
positions=[y];
vec(positions)=1;
ini_stock=Returns_30*vec';
Y(1)=y;
for j=2:6
 for i =1:30
     if i~=Y
         stock2=Returns_30(:,i)
         two=horzcat(ini_stock,stock2);
         [ExpReturn_two, ExpCovariance_two] = ewstats(two);
         [PRisk, PRoR, PWts] = NaiveMV_CVX(ExpReturn_two, ExpCovariance_two, 1);
         maximum_two = max(PRisk./PRoR);
         [x1,y1]=find(PRisk./PRoR==maximum_two);
         Sharpe_new(i) = sharpe(PWts(x1,:)*two.');
     end
 end
 Sharpe_new(Y)=0;
 maximum1 = max(Sharpe_new);
 [x2,y2]=find(Sharpe_new==maximum1);
 
  
  Y(j)=[y2];
%   Y=[Y,y2];
 ini_stock=Returns_30(:,Y);
 end
% p_all = Portfolio('AssetMean',ExpReturn, 'AssetCovar',ExpCovariance);
% p_all = setDefaultConstraints(p_all);
% weights_all = estimateMaxSharpeRatio(p_all);