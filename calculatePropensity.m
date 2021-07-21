function h = calculatePropensity(X,k,S)
%     old function, only works for sixrxn:
%     h(1,1) = k(1)*X(1)*X(2);
%     h(2,1) = k(2)*X(3);
%     h(3,1) = k(3)*X(3);
%     h(4,1) = k(4)*X(4)*X(5);
%     h(5,1) = k(5)*X(6);
%     h(6,1) = k(6)*X(6);

%     new function, should work for any model:
for j = 1:size(S,2)
    h(j,1) = k(j);
    for i = 1:size(S,1)
        if S(i,j) < 0
            h(j,1) = h(j)*X(i)^(-S(i,j));
        end
    end
end

end