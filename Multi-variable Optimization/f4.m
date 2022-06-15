function y = f4(X)
    y = 0;
    d = length(X);
    for i = 2:d
        y = y + (X(i)-1)^2 - X(i)*X(i-1);
    end
    y = y + (X(1)-1)^2;
end