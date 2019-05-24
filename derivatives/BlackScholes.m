function [pred sigs] = BlackScholes( K, S, T, r, type )

startT = round(T/4)+1;
pred = zeros(T-startT, 1);
sigs = zeros(T-startT, 1);
    for t=startT:T-1
        tau = (T-t)/252;
        thisS = S(t-round(T/4):t);   
        sig = std(log(thisS))*sqrt(length(thisS));
        sigs(t-round(T/4)) = sig;

        d1 = (log((thisS(end)/K))+( r+(sig^2)/2)*(tau))/ (sig*sqrt(tau));
        d2 = ((log((thisS(end)/K))+( r+(sig^2)/2)*(tau))/ (sig*sqrt(tau))) - (sig*sqrt(tau));
        
        if strcmp(type,'call')
            pred(t-round(T/4))= (thisS(end)*normcdf(d1)) - (K*exp(-r*(tau))*normcdf(d2));
            %pred(t-round(T/4)) = call;
        else
            pred(t-round(T/4))= (K*exp(-r*(tau))*normcdf(-d2)) - (thisS(end)*normcdf(-d1))  ;
            %pred(t-round(T/4)) = put;
        end
    end

end

