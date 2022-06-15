%Phase-3 assignment.
%Penalty Function Method and Method of Multipliers.

filename = 'inputdata_phase3.xlsx';
I = xlsread(filename);
for j = 1
    
    a = I(j,1);             %Lower bound of variables.
    b = I(j,2);             %Upper bound of variables.
    n = I(j,3);             %Maximum no. of iterations.
    delta_x = I(j,4);       %Delta value for derivative computation.
    epsilon = 10^(-4);%I(j,5);       %Epsilon value for termination conditions.
    d = I(j,6);             %No. of input variables.

    objective_function_name = strcat('f',num2str(j));
    constraint_filename_pfm = strcat('f',num2str(j),'_g');
    constraint_filename_mom = strcat('f',num2str(j),'_g2');
    
    X_initial = [0.4,0.1,0.1,0.1,0.1];%a*ones(1,d) + (b-a)*rand(1,d);  %Random initialization of variables.
    
    %bracket_operator() corresponds to calling penalty function method.
    %method_multiplier() corresponds to calling method of multipliers.
    
    Z_pfm = bracket_operator(d,objective_function_name,constraint_filename_pfm,n,X_initial,delta_x,epsilon);
    disp('xxxxxxxxxxxxxxxxxxxx')
    Z_mom = method_multiplier(d,objective_function_name,constraint_filename_mom,n,X_initial,delta_x,epsilon);
    
    disp('----------------------------------------------------------');
    disp(Z_pfm);
    disp(Z_mom);
    disp('----------------------------------------------------------');
    
end





