function Z = method_multiplier(d,f_name,g_name,M,X_initial,delta_x,epsilon)
    %METHOD OF MULTIPLIERS
    R = 0.5; % R remains constant
    Z = X_initial;
    gx = feval(g_name,Z);
    gx = gx(2:end);
    global sigma % because sigma is changed with the function evaluator
    sigma = zeros(size(gx));
    P = @(Z) feval(@evaluator,Z,g_name,f_name,sigma,R); % evaluator calculates the penalty function 
    Z = steepest_descent(d,P,M,Z,delta_x,epsilon); % Use unconstrained optimization (in our case steepest descent 
    counter = 0;
    while(counter<50)
        P_prev = P(Z);
        P = @(Z) feval(@evaluator,Z,g_name,f_name,sigma,R);
        Z = steepest_descent(d,P,M,Z,delta_x,epsilon);
        P_new = P(Z);
        if abs(P_new - P_prev) < epsilon
            break;
        end
        counter = counter + 1;
    end
    disp(Z);
    disp(feval(f_name,Z));
end