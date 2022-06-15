function fx = f2(Z)
x1 = Z(1);
x2 = Z(2);
fx = -(sin(2*pi*x1)^3)*sin(2*pi*x2)/((x1+x2)*x1^3);
end