function P = fitness_table(N, n_x1, n_x2, x1_l, x1_u, x2_l, x2_u, X_binary, Index)

    for i = 1:N
        
        DV_x1 = 0;                                  %Initializing Decoded Value of x1.
        DV_x2 = 0;                                  %Initializing Decoded Value of x2.
        
        for j = 1:n_x1
            DV_x1 = 2*DV_x1 + X_binary(i,j);        %Computing Decoded Value of x1.
        end
        
        for j = 1:n_x2
            DV_x2 = 2*DV_x2 + X_binary(i,n_x1+j);   %Computing Decoded Value of x2.
        end
            
        x1 = x1_l + x1_u*DV_x1/(2^n_x1 - 1);        %Real value of x1.
        x2 = x2_l + x2_u*DV_x2/(2^n_x2 - 1);        %Real value of x2.
           
        X(i,1) = x1;
        X(i,2) = x2;
        Function_value(i,1) = f1(X(i,:));           %Computing function value for (x1,x2).
        Fitness_value(i,1) = 1/(1+f1(X(i,:)));      %Computing fitness vaule for (x1,x2).
        
    end
    
    P = table(Index, X_binary, X, Function_value, Fitness_value);
    
end
    
