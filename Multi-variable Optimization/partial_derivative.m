function dX = partial_derivative(function_name,d,X,delta_x)
    
    dX = zeros(1,d);
    dx = zeros(1,d);
    
    for k = 1:d
        dx(k) = delta_x; 
        dX(k) = (feval(function_name,X+dx)-feval(function_name,X-dx))/(2*delta_x);
        dx(k) = 0;
    end
end
