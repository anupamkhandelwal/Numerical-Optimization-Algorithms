function Z = steepest_descent(d,function_name,M,X_initial,delta_x,epsilon)
    
    counter = 0;                          %Iteration counter for number of descent updates.
    Z = X_initial;                        %Initialization condition.
    
    while(counter<M)
    
        %Step 2.
        dX = partial_derivative(function_name,d,Z,delta_x);
        
        %Step 3.
        if norm(dX)<epsilon
            %disp('dX<eps');
            break;
        end
        
        %Step 4. GOLDEN SECTION METHOD USED
        
        a=0;                            % Start of search interval.
        b=5;                            % End of search interval
        iter= 1000;                     % Maximum number of iterations for search method.
        tau=double((sqrt(5)-1)/2);      % Golden proportion coefficient, around 0.618
        k=0;                            % Iteration counter for search method.


        alpha1=a+(1-tau)*(b-a);                      % Computing 'x' values.
        alpha2=a+tau*(b-a);

        f_alpha1=feval(function_name,Z-alpha1*dX);   % Function evaluations.
        f_alpha2=feval(function_name,Z-alpha2*dX);

        while ((abs(b-a)>epsilon) && (k<iter))
            k=k+1;
            if(f_alpha1<f_alpha2)
                b=alpha2;
                alpha2=alpha1;
                alpha1=a+(1-tau)*(b-a);

                f_alpha1=feval(function_name,Z-alpha1*dX);
                f_alpha2=feval(function_name,Z-alpha2*dX);

            else
                a=alpha1;
                alpha1=alpha2;
                alpha2=a+tau*(b-a);

                f_alpha1=feval(function_name,Z-alpha1*dX);
                f_alpha2=feval(function_name,Z-alpha2*dX);
            end

            k=k+1;
        end


        % Choosing minimum point.
        if(f_alpha1<f_alpha2)
            alpha_final = alpha1;
        else
            alpha_final = alpha2;
        end
      
                
        Z = Z - alpha_final*dX;             % DESCENT UPDATE.
        
        %Termination condition check.
        dZ = partial_derivative(function_name,d,Z,delta_x);
        %disp(dot(dX,dZ));
        if abs(dot(dX,dZ))<epsilon^2,
            %disp('dot(dX,dZ)<epsilon');
            break;
        end
              
        
        %Step 5
        if norm(alpha_final*dX)/norm(Z) < epsilon,
            %disp('third condition');
            break;
        end
        
        counter = counter+1;
    end
    %disp(counter);
    %disp(alpha_final);
    end
