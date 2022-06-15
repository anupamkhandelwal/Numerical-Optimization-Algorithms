function Z = steepest_descent_modified(d,function_name,M,X_initial,delta_x,epsilon)
    
    counter = 0;                          %Iteration counter for number of descent updates.
    Z = X_initial;                        %Initialization condition.
    
    w_grad_prev = partial_derivative(function_name,d,Z,delta_x);  %Initialization condition for momentum.
    
    while(counter<M)
    
        %Step 2.
        dX = partial_derivative(function_name,d,Z,delta_x);
        
        %Step 3.
        if norm(dX)<epsilon
            disp(norm(dX));
            break;
        end
             
        
        alpha_final = 0.01;
        beta = 0.98;
        w_grad = beta*w_grad_prev + (1-beta)*dX;        % Moving average calculation. 
        w_grad_prev = w_grad;
        Z = Z - alpha_final*w_grad;                     % MODIFIED DESCENT UPDATE.
                
        %Termination condition check.
        dZ = partial_derivative(function_name,d,Z,delta_x);
        %disp(dot(dX,dZ));
%         if abs(dot(dX,dZ))<epsilon^2,
%             %disp('dot(dX,dZ)<epsilon');
%             break;
%         end
%         
%         
%         %Step 5
%         if norm(alpha_final*dX)/norm(Z) < epsilon,
%             %disp('third condition');
%             break;
%         end
        
        counter = counter+1;
    end
    disp(2*counter);
    %disp(alpha_final);
    end