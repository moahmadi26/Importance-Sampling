%% Propensity function
function h = calculatePropensity(X, S_in, k)    
    for j = 1:size(S_in,2)
        h(j,1) = k(j);
        for i = 1:size(S_in,1)
            h(j,1) = h(j)*X(i)^(S_in(i,j));
        end
    end
end