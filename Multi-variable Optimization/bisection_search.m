function z = bisection_search(x1,x3,del_x,e,function_name)
    
    %Initialization conditions.
    z1 = x1;
    z2 = x3;
    
    z = (z1+z2)/2;                                                                     %Mid point computation.
    dz = (feval(function_name,z+del_x)-feval(function_name,z-del_x))/(2*del_x);        %Derivative computation.
    
    while abs(dz)>e
        
        if dz>0
            
            %If the derivative is positive, neglect the second half of interval.
            z2 = z;
        
        else
            
            %Else if derivative is negative, neglect the first half of interval. 
            z1 = z;
            
        end 
        
        z = (z1+z2)/2;
        dz = (feval(function_name,z+del_x)-feval(function_name,z-del_x))/(2*del_x);
        
    end
    
end