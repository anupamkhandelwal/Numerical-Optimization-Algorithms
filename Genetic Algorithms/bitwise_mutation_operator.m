function offspring = bitwise_mutation_operator(offspring, p_mutation, n_x1, n_x2, x1_l, x1_u, x2_l, x2_u)

N = size(offspring,1);                      %Population size.
X_b_o = table2array(offspring(:,2));        %Offspring array.

for i = 1:N
    
    for j = 1:10
        
        pm = rand();
        
        if pm < p_mutation
            X_b_o(i,j) = 1 - X_b_o(i,j);    %Successful mutation.            
        end
        
    end
    
end

Index = (N+1:2*N);

offspring = fitness_table(N, n_x1, n_x2, x1_l, x1_u, x2_l, x2_u, X_b_o, Index.');

end