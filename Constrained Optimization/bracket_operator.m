function Z = bracket_operator(d,f_name,g_name,M,X_initial,delta_x,epsilon)
    %PENALTY FUNCTION METHOD
    R = 700; % initialisation
    Z = X_initial;
    P = @(Z) feval(f_name,Z) + R*feval(g_name,Z); %Penalty function. g_name internally calculates the bracket operations.
    Z = steepest_descent(d,P,M,Z,delta_x,epsilon); % Use unconstrained optimization (in our case steepest descent 
    counter = 0;
    while(counter<50)
        P_prev = P(Z);
        R = 10*R; % update R
        P = @(Z) feval(f_name,Z) + R*feval(g_name,Z);
        Z = steepest_descent(d,P,M,Z,delta_x,epsilon);
        P_new = P(Z);
        if abs(P_new - P_prev) < epsilon %Termination Condition
            break;
        end
        counter = counter + 1;
    end
    disp(Z);
end