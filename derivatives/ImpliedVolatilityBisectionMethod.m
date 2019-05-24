function sigma = ImpliedVolatilityBisectionMethod( s, K, p, r, tau, type )
    
    threshold = 0.01;

    sig1 = 0;
    sig2 = 1;
    
    go = true;
    while go
        
        midSig = (sig1 + sig2)/2;
        if BlackScholes_Step( K, s, tau, r, midSig, type) > p
           sig2 = midSig;
        else
           sig1 = midSig;
        end

        if abs(sig1-sig2) < threshold
           go = false; 
        end
        
    end
    
    sigma = sig1;
    
end

