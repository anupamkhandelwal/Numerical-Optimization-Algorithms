function fx = f1(Z)
x1 = Z(1);
x2 = Z(2);
x3 = Z(3);
x4 = Z(4);
x5 = Z(5);

e1=0;
e2=0;
e3=0;
e4=0;
e5=0;

if x1<=0;
    e1 = 0;
end

if x1>0 && x1<=0.1
    e1 = 50*x1;
end

if x1>0.1 && x1<=0.2
    e1 = 450*x1 - 40;
end

if x1>0.2 && x1<=0.3
    e1 = 200*x1 + 10;
end

if x1>0.3 && x1<=0.4
    e1 = 100*x1 + 40;
end

if x1>0.4 && x1<=1
    e1 = 80;
end

if x1>1 
    e1 = 0;
end

fx = -e1;

if x2<=0;
    e2=0;
end

if x2>0 && x2<=0.1
    e2 = 200*x2 ;
end

if x2>0.1 && x2<=0.3
    e2 = 50*x2 + 15 ;
end

if x2>0.3 && x2<=0.6
    e2 = 100*x2 ;
end

fx =+ -e2;

if x3<=0;
    e3=0;
end

if x3>0 && x3<=0.1
    e3 = 150*x3 ;
end

if x3>0.1 && x3<=0.4
    e3 = 100*x3 + 5;
end

fx =+ -e3;

if x4<=0;
    e4=0;
end

if x4>0 && x4<=0.1
    e4 = 100*x4 ;
end

if x4>0.1 && x4<=0.3
    e4 = 50*x4 - 40;
end

if x4>0.3 && x4<=0.4
    e4 = 150*x4 - 25;
end

fx =+ -e4;

if x5<0
    e5 = 0;
end
if x5>=0 && x5<1
    e5 = 37.5*x5;
end
fx =+ -e5;
end