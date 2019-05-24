for j =1:10
ncol=3; r=ran(output1,ncol);
three_stocks=table2array(r);
half=three_stocks(1:380,:);
[ExpReturn, ExpCovariance] = ewstats(half);
halfend=three_stocks(380:759,:);
Returns = tick2ret(half);
Returns1 = tick2ret(halfend);
% Riskless = mean(Returns(:,3))
v=1;sigma=0.7;
Riskless=0.00002;
II=eye(3,3);
Cov_enhance=v.*ExpReturn*ExpReturn.'+sigma.*II;
p = Portfolio('AssetMean',ExpReturn, 'AssetCovar',Cov_enhance);
p = setDefaultConstraints(p);
weights = estimateMaxSharpeRatio(p);
p1 = Portfolio('AssetMean',ExpReturn, 'AssetCovar', ExpCovariance);
p1= setDefaultConstraints(p1);
weights1 = estimateMaxSharpeRatio(p1);
Sharpe_mv = sharpe(Returns1*weights1, Riskless);
Sharpe_enhancement = sharpe(Returns1*weights, Riskless);
Sharpe_naive = sharpe(Returns1*[1/3 ;1/3 ;1/3], Riskless);
I=ones(3,1);
sharp_mv(j)=Sharpe_mv;
sharp_enhancement(j)=Sharpe_enhancement;
sharp_naive(j)=Sharpe_naive;
end
sharp_mv;
sharp_enhancement;

sharp_naive;
plot(sharp_mv)
hold on
plot(sharp_enhancement)
hold on
plot(sharp_naive)
legend({'MV portfolio','1/N portfolio','MV-enhancement'},'Location','Southeast')
xlabel('3 assets combinations')
xlim([1 10])
ylabel('sharpe ratio')