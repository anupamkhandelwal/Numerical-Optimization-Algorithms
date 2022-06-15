function parent = survival(parent,offspring)

N = size(parent,1);                 %Population size.

temp = [parent;offspring];          %Pooling all solutions.
temp = sortrows(temp,4);            %Sorting solutions based on function values.

parent = temp(1:N,:);               %Selection of 'N' best solutions.

Index = (1:N);

parent{:,1} = (1:N).';              %Best 'N' solutions becomes parent for next generation.

end