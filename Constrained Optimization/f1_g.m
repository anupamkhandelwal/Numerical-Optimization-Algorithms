function gx = f1_g(Z)
x1 = Z(1);
x2 = Z(2);
x3 = Z(3);
x4 = Z(4);
x5 = Z(5);

gx = 0;
gx1 = x1 + x2 + x3 + x4 + x5;
if gx1 > 0 && gx1<1.0
    gx1 = 0;
end

if x1 <= 0
    gx = gx + (x1)^2;
end
if x1 > 0.4
    gx = gx + (x1-0.4)^2;
end

if x2 <= 0
    gx = gx + (x2)^2;
end
if x2 > 0.4
    gx = gx + (x2-0.4)^2;
end

if x3 <= 0
    gx = gx + (x2)^2;
end
if x3 > 0.4
    gx = gx + (x2-0.4)^2;
end

if x4 <= 0
    gx = gx + (x2)^2;
end
if x4 > 0.4
    gx = gx + (x2-0.4)^2;
end

if x5 <= 0
    gx = gx + (x2)^2;
end
if x5 > 0.4
    gx = gx + (x2-0.4)^2;
end

gx = gx + gx1^2 ;

end