function e = expectation(xt,F,S,k,dt)
    h = calculatePropensity(xt,k);
    e = F'*(xt+S*h*dt);
end