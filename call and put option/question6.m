cvx_begin
       variable Wei(30);
       variable tau;
       distance = Ret_opt-Wei.' * ExpReturn_all.';

       minimize( distance*distance'+ tau*norm(Wei,1));
%        n=nnz(Wei)
       V=ones(1,30);
       subject to
            V*Wei==1;
%             n == 6;
    cvx_end
   Wei;
   tau;
   [b,fitinfo] = lasso(Wei, distance*distance','CV',10);
   lassoPlot(b,fitinfo,'PlotType','Lambda','XScale','log');
   lam = fitinfo.Index1SE;
   b(:,lam)

