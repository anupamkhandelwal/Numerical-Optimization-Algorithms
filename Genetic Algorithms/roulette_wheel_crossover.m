function offspring = roulette_wheel_crossover(P, p_crossover, n_x1, n_x2, x1_l, x1_u, x2_l, x2_u)

%Codeblock for Roulette-Wheel selection.
%This approach is implemented using the following algorithm:

%Step 1: Calculate S = the sum of a finesses.
%Step 2: Generate a random number between 0 and S.
%Step 3: Starting from the top of the population, keep adding the finesses to the partial sum P, till P<S.
%Step 4: The individual for which P exceeds S is the chosen parent.

N = size(P,1);                          %Population size.
S = table2array(varfun(@sum,P(:,5)));   %Sum of all finesses.
parent_index = zeros(1,N);              %Initializing selected parents' array.

for k = 1:N
    
    rand_temp = S(1,1).*rand();         %Random no. between 0 and S.
    temp = 0;
    a=1;                                %For every selection, starting from top of the table.
    
    for a = 1:N
        
        temp = temp + table2array(P(a,5));
        
        if temp > rand_temp
            parent_index(k) = a;        %Selected parent index.
            
            break
        else continue
        end
       
    end
    
end

% Crossover codeblock using two point crossover technique.

i1 = floor((n_x1+n_x2)/3)+1;              %First index for crossover.
i2 = 2*floor((n_x1+n_x2)/3)+1;            %Second index for crossover.

for i = 1:N
    X_b_o(i,:) = table2array(P(parent_index(i),2));     %Mating pool.
end

for i = 1:int8(N/2)
    
    pc = rand();
    
    if pc < p_crossover
        for p = i1:i2
            temp2 = X_b_o(2*i-1,p);
            X_b_o(2*i-1,p) = X_b_o(2*i,p);
            X_b_o(2*i,p) = temp2;
        end
        
    end
    
end

Index = (N+1:2*N);

offspring = fitness_table(N, n_x1, n_x2, x1_l, x1_u, x2_l, x2_u, X_b_o, Index.');

end
