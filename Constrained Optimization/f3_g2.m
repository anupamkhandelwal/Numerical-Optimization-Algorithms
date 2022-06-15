function gx = f3_g2(X)

gx = 0;
gx1 = -(-1 + 0.0025*(X(4) + X(6)));
gx2 = -(-1 + 0.0025*(-X(4) + X(5) + X(7)));
gx3 = -(-1 + 0.01*(-X(6) + X(8)));
gx4 = -(100*X(1) - X(1)*X(6) + 833.33252*X(4) - 83333.333);
gx5 = -(X(2)*X(4) - X(2)*X(7) - 1250*X(4) + 1250*X(5));
gx6 = -(X(3)*X(5) - X(3)*X(8) - 2500*X(5) + 1250000);

if X(1)<100
    gx = [gx, (X(1)-100)];
else
    gx = [gx, 0];
end
if X(1) > 10000
    gx = [gx, -(X(1)-10000)];
else
    gx = [gx, 0];
end
if X(2) < 1000
    gx = [gx,(X(2)-1000)];
else
    gx = [gx, 0];
end
if X(2) > 10000
    gx = [gx ,-(X(2)-10000)];
else
    gx = [gx, 0];
end
if X(3) < 1000
    gx = [gx, (X(3)-1000)];
else
    gx = [gx, 0];
end
if X(3) > 10000
    gx = [gx, -(X(3)-10000)];
else
    gx = [gx, 0];
end
if X(4) < 10
    gx = [gx, (X(4)-10)];
else
    gx = [gx, 0];
end
if X(4) > 1000
    gx = [gx ,-(X(4)-1000)];
else
    gx = [gx, 0];
end
if X(5) < 10
    gx = [gx,(X(5)-10)];
else
    gx = [gx, 0];
end
if X(5) > 1000
    gx = [gx, -(X(5)-1000)];
else
    gx = [gx, 0];
end
if X(6) < 10
    gx = [gx, (X(6)-10)];
else
    gx = [gx, 0];
end
if X(6) > 1000
    gx = [gx, -(X(6)-1000)];
else
    gx = [gx, 0];
end
if X(7) < 10
    gx = [gx, (X(7)-10)];
else
    gx = [gx, 0];
end
if X(7) > 1000
    gx = [gx, -(X(7)-1000)];
else
    gx = [gx, 0];
end
if X(8) < 10
    gx = [gx,(X(8)-10)];
else
    gx = [gx, 0];
end
if X(8) > 1000
    gx = [gx,-(X(8)-1000)];
else
    gx = [gx, 0];
end
gx = [gx,gx1,gx2,gx3,gx4,gx5,gx6] ;
end