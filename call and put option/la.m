% cvx_begin
%        variable Wei(30,1);
%        variable tau(1);
%        distance = Ret_opt-Wei.' * ExpReturn_all.';
% 
%        minimize( distance*distance'+ tau*norm(Wei,1));
% %        n=nnz(Wei)
%        V=ones(1,30);
%        subject to
%             V*Wei==1;
% %             n == 6;
%     cvx_end
%    Wei;
%    tau;
% distance = Ret_opt-Wei.' * ExpReturn_all.';
%     Wei=(1/30).*ones(1,30);
%     [b,fitinfo] = lasso(Wei, distance*distance','CV',10);
%    lassoPlot(b,fitinfo,'PlotType','Lambda','XScale','log');
%     lam = fitinfo.Index1SE;
%     b(:,lam)
 V = ones(1, 759);
 V0 = zeros(30, 1);
 V1=ones(1, 30);
 tau=0.01;
 cvx_begin
    variable w(30);
    meanReturn = ExpReturn_30*w;
    minimize(square_pos(norm(meanReturn.*V-w.'*Returns_30.'))+ ... %linear
        +tau*norm(w.',1)); %regularizer
    subject to
           V0 <= w;
           w.'*V1.' == 1;
    
cvx_end
w.'