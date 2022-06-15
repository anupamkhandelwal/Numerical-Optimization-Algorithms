% Binary coded Genetic Algorithm.
% Control parameters.

clc;                %Clear command window.
clear;              %Clear workspace.

N = 50;             %Population size.
n_x1 = 5;           %No. of bits for first variable.
n_x2 = 5;           %No. of bits for second variable.

x1_l = 0.0;         %Lower limit of first variable.
x1_u = 0.5;         %Upper limit of first variable.

x2_l = 0.0;         %Lower limit of first variable.
x2_u = 0.5;         %Upper limit of first variable.

p_crossover = 0.9;  %Crossover probability.
p_mutation = 0.05;  %Mutation probability.

%Step 1: Random population initialization.
X_binary = randi([0 1], N, n_x1+n_x2);
Index = (1:N);

parent = fitness_table(N, n_x1, n_x2, x1_l, x1_u, x2_l, x2_u, X_binary, Index.');   %Initial fitness calculation.
disp(parent);

for t = 1:15        %No. of iterations.
    
    %Step 2: Roulette Wheel reproduction method. 
    offspring = roulette_wheel_crossover(parent, p_crossover, n_x1, n_x2, x1_l, x1_u, x2_l, x2_u);
        
    %Step 3: Bit-wise mutation operation.
    offspring = bitwise_mutation_operator(offspring, p_mutation, n_x1, n_x2, x1_l, x1_u, x2_l, x2_u);
        
    %Step 4: Survival of the fittest.
    parent = survival(parent,offspring);
    
    %Printing the population pool at the end of an iteration.
    disp(parent);
    
end

%Priniting out unique solutions found.
[~,unique_X] = unique(parent(:,3),'stable');
unique_solutions = parent(unique_X,2:5);
disp(unique_solutions);



    
    
