%Phase-2 assignment.
%Method name: Cauchy's Steepest Descent.

filename = 'inputdata1.xlsx';
I = xlsread(filename);

for j = 1:5
     
     %Input parameters read from a file.
     a = I(j,1);
     b = I(j,2);
     n = I(j,3);
     delta_x = I(j,4);
     epsilon = I(j,5);
     d = I(j,6);
     
     function_name = strcat('f',num2str(j));
     
     X_initial = a*ones(1,d) + (b-a)*rand(1,d);
     
     Z = steepest_descent(d,function_name,n,X_initial,delta_x,epsilon);
     %Z = steepest_descent_modified(d,function_name,n,X_initial,delta_x,epsilon);
     fprintf('Problem no. = ');
     disp(j);
     fprintf('No. of variables = ');
     disp(d);
     disp('----------------------------------------------------------------------------------');
     fprintf('Optimum solution =');
     disp(Z);
     fprintf('Function value at otipma = '); 
     disp(feval(function_name,Z));   
     disp('==================================================================================');
          
end