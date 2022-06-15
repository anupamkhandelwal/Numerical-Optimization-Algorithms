function gx = f2_g(Z)
x1 = Z(1);
x2 = Z(2);
gx = 0;
gx1 = -((x1)^2 - (x2) + 1);
if gx1 > 0
    gx1 = 0;
end
gx2 = -(1-x1 + (x2-4)^2);
if gx2 > 0
    gx2 = 0;
end
if x1 < 0
    gx = gx + (x1)^2;
end
if x1 > 10
    gx = gx + (x1-10)^2;
end
if x2 < 0
    gx = gx + (x2)^2;
end
if x2 > 10
    gx = gx + (x2-10)^2;
end
gx = gx + gx1^2 + gx2^2;
end