function e = expectation(xt,F,S,k,dt)
    h = calculatePropensity(xt,k, S);
    e = F'*(xt+S*h*dt);
end