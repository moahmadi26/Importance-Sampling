function h = calculatePropensity(X,k)
    h(1) = k(1)*X(1)*X(2);
    h(2) = k(2)*X(3);
    h(3) = k(3)*X(3);
    h(4) = k(4)*X(4)*X(5);
    h(5) = k(5)*X(6);
    h(6) = k(6)*X(6);
end