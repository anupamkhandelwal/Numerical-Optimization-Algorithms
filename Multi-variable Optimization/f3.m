function y = f3(X)
    y = 0;
    d = length(X);
    for i = 2:d
        y = y + i*((2*(X(i)^2))-X(i-1))^2;
    end
    y = y + (X(1)-1)^2;
end