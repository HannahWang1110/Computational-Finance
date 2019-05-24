function B = lasso_generic(X,Y,iFold_cross_validation)
[B FitInfo] = lasso(X,Y,'CV',iFold_cross_validation)
% lassoPlot(B, FitInfo, 'PlotType', 'CV')
lassoPlot(B, FitInfo, 'PlotType', 'Lambda','XScale','log')

lassoPlot(B)
FitInfo.Lambda1SE
FitInfo.LambdaMinMSE
% V = ones(1, 759)
% Wei = randn(1,30)
% target = norm((Wei*ExpReturn_30.').*V-Wei*Returns_30.',2)
% iFold_cross_validation = 10; % do 10 fold cross validation
% B = lasso_generic(Wei,target,iFold_cross_validation)
