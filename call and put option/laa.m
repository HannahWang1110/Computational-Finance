    Wei=(1/30).*ones(30,1);
    V = ones(1, 759);
    V0 = zeros(30, 1);
    V1=ones(1, 30);
    tau=1;
    meanReturn = ExpReturn_30*Wei;
    distance = meanReturn.*V-Wei.'*Returns_30.'+tau*norm(Wei.',1)
    

    [b,fitinfo] = lasso(Wei, distance,'CV',10);
    lassoPlot(b,fitinfo,'PlotType','Lambda','XScale','log');
    lam = fitinfo.Index1SE;
    b(:,lam)