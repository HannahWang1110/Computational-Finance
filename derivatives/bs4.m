% T = length(c2925);
% data = c2925(:,:);
% S = data(:,3);
% P = data(:,2);
% K = 2925;
r=0.06;
startT = round(T/4)+1;
s = S(startT);
% p = P(startT);

%tauRange = linspace(0,1,501);
tau = 0.7;
sigma = 0.4;
N=200;
bsPrices = zeros(N, 1);
blPrices = zeros(N, 1);
for n=1:N
    [price, lattice] = LatticeEurCall(s,K,r,tau,sigma,n);
    [ pred, vega ] = BlackScholes_Step(K, s, tau, r, sigma, 'call');
    bsPrices(n) = pred;
    blPrices(n) = price;
end


figure(1), hold on
plot(linspace(1,N,N), bsPrices);
plot(linspace(1,N,N), blPrices);
ylabel('Price')
xlabel('N')


figure(2),
plot(T./linspace(1,N,N), abs(bsPrices - blPrices));
ylabel('Absolute Difference')
xlabel('delta')