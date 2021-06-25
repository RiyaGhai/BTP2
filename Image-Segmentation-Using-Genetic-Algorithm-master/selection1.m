function new_population = selection1(ranking, population, p_selection, new_population)

    M = size(population, 1);
   % ranking = max(ranking) - ranking; %to convert minimisation problem to maximisation problem
    ranking = sum(ranking) - ranking; 
   normalised_ranking = ranking./sum(ranking);
    [sorted_ranking, idx] = sort(normalised_ranking, 'descend');

    for i = 1:M
        new_population = [new_population; population(idx(i), :)];
    end
    
    cumsum = zeros(1 , M);
    for i = 1 : M
        for j = i : M
            cumsum(i) = cumsum(i) + sorted_ranking(j);
        end
    end
    
    for k = 1:round(p_selection*population_size)
        R = rand(); % in [0,1]
        parent_idx = M;
        for i = 1: length(cumsum)
             if R > cumsum(i)
                  parent_idx = i - 1;
                  break;
             end
        end
                
        new_population = [new_population; new_pop(parent_idx, :)];
    end
    
end