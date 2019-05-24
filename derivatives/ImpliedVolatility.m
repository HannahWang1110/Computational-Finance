function sigma = ImpliedVolatility( K, s, T, r, p, type, iterations )
    precision = 1.0e-5;
    sigma = sqrt((2*pi)/T)*(p(1)/s(1));
    for i=1:iterations
        [pred, vega] = BlackScholes_Step(K, s, T, r, sigma, type);
        
        diff = p - pred;
        if (abs(diff) < precision)
            return 
        end
        sigma = sigma + (diff/ vega);
    end

end

