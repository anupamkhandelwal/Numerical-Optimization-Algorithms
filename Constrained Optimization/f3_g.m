function gx = f3_g(X)

gx = 0;
gx1 = -(-1 + 0.0025*(X(4) + X(6)));
if gx1 > 0
    gx1 = 0;
end
gx2 = -(-1 + 0.0025*(-X(4) + X(5) + X(7)));
if gx2 > 0
    gx2 = 0;
end
gx3 = -(-1 + 0.01*(-X(6) + X(8)));
if gx3 > 0
    gx3 = 0;
end
gx4 = -(100*X(1) - X(1)*X(6) + 833.33252*X(4) - 83333.333);
if gx4 > 0
    gx4 = 0;
end
gx5 = -(X(2)*X(4) - X(2)*X(7) - 1250*X(4) + 1250*X(5));
if gx5 > 0
    gx5 = 0;
end
gx6 = -(X(3)*X(5) - X(3)*X(8) - 2500*X(5) + 1250000);
if gx5 > 0
    gx5 = 0;
end
if X(1)<100
    gx = gx + (X(1)-100)^2;
end
if X(1) > 10000
    gx = gx + (X(1)-10000)^2;
end
if X(2) < 1000
    gx = gx + (X(2)-1000)^2;
end
if X(2) > 10000
    gx = gx + (X(2)-10000)^2;
end
if X(3) < 1000
    gx = gx + (X(3)-1000)^2;
end
if X(3) > 10000
    gx = gx + (X(3)-10000)^2;
end
if X(4) < 10
    gx = gx + (X(4)-10)^2;
end
if X(4) > 1000
    gx = gx + (X(4)-1000)^2;
end
if X(5) < 10
    gx = gx + (X(5)-10)^2;
end
if X(5) > 1000
    gx = gx + (X(5)-1000)^2;
end
if X(6) < 10
    gx = gx + (X(6)-10)^2;
end
if X(6) > 1000
    gx = gx + (X(6)-1000)^2;
end
if X(7) < 10
    gx = gx + (X(7)-10)^2;
end
if X(7) > 1000
    gx = gx + (X(7)-1000)^2;
end
if X(8) < 10
    gx = gx + (X(8)-10)^2;
end
if X(8) > 1000
    gx = gx + (X(8)-1000)^2;
end
gx = gx + gx1^2 + gx2^2+ gx3^2 + gx4^2+ gx5^2 + gx6^2 ;
end