function fx = evaluator(Z,g_name,f_name,sigma,R)    
    gx = feval(g_name,Z);
    gx0 = gx(1);
    gx = gx(2:end);
    temp = arrayfun(@bracketer,gx + sigma);
    gx = temp.^2 - sigma.^2;
    sigma = temp;
    gx = gx0 + sum(gx);
    fx = feval(f_name,Z) + R*gx;
end