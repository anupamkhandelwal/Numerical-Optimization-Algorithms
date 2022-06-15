function y = f5(X)
    y = 0;
    y1 = 0;
    d = length(X);
    
    for p = 1:d
        y1 = y1+ 0.5*p*X(p);
    end
    
    for i = 1:d
        y = y + X(i)^2;
    end
    y = y + y1^2 + y1^4;
end