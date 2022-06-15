function y = f2(X)
    y = 0;
    d = length(X);
    for i = 1:d-1
        y = y + 100*(X(i+1)-X(i)^2)^2 + (X(i)-1)^2;
    end
end