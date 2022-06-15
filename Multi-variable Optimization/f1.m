function y = f1(X)
    y = 0;
    d = length(X);
    for i = 1:d
        y = y + i*X(i)^2;
    end
end