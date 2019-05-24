N=30;
flag = 'call';
T = length(p3125);
data = c3025(:,:);
S = data(:,3);
P = data(:,2);
K = 3025;
r=0.06;
startT = round(T/4)+1;

% tChoice = 63;
tChoice = randi([startT, T-N]);
s = S(tChoice:tChoice+N-1);
p = P(tChoice:tChoice+N-1);

sig = zeros(N,1);
for n=1:N
   sig(n) = blsimpv(s(n),K,0.06,(T-tChoice-n+1)/365,p(n), 10, 0, 1e-6, {flag});
   %sig(n) = ImpliedVolatility(K, s(n), (T-tChoice-n+1)/365, r, p(n), flag, 100);
%    sig(n) = ImpliedVolatilityBisectionMethod(s(n), K, p(n), r, (T-tChoice-n+1)/365, flag);
end

[pred2, dataSig] = BlackScholes(K, S, T, r, flag);
plot(dataSig(tChoice-startT:tChoice-startT+N-1), sig, 'x');
title('Implied vs Historical Volatility')
xlabel('Historical Volatility')
ylabel('Implied Volatility')

if strcmp(flag, 'put')
    strike = linspace(0, 3000, 101);
else
    strike = linspace(K, 4500, 101);
end
vSmile = zeros(length(strike),1);
for i=1:length(strike)
     %vSmile(i) = blsimpv(s(1),strike(i),0.06,(T-tChoice)/365,p(1), 10, 0, 1e-6, {flag});
    %vSmile(i) = ImpliedVolatility(strike(i), s(1), (T-tChoice)/365, r, p(1), flag, 100);
    vSmile(i) = ImpliedVolatilityBisectionMethod(s(1), strike(i), p(1), r, (T-tChoice)/365, flag);
end

figure(2),
plot(strike, vSmile);
xlabel('Strike Price')
ylabel('Implied Volatility')
title('Volatility Smile')