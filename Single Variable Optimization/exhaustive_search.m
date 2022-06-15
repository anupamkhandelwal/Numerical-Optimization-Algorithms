function X = exhaustive_search(a,b,n,function_name)  
    
    delta = (b-a)/n;                            %Division length.
    
    %Initialization conditions.
    x1 = a;
    x2 = x1 + delta;
    x3 = x2 + delta;
    
    %Output array initialization.
    %First element represents the flag bit where value '1' corresponds to successful exhaustive search.
    %Second and third elements correspond to the bracketed interval.
    X = [0 0 0];

    while x3<=b
        
        y1 = feval(function_name,x1);
        y2 = feval(function_name,x2);
        y3 = feval(function_name,x3);
        
        if y2<=y1 &&  y2<=y3                    %Condition check for minima lying in a particular interval.
        
            X(1) = 1;
            X(2) = x1;
            X(3) = x3;
            break;
    
        else
      
            x1 = x2;
            x2 = x3;
            x3 = x3 + delta;
        
        end
        
    end
    
end