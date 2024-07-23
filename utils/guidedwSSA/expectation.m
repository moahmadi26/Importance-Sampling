function e = expectation(xt,F,S,k,dt, S_in)
    h = calculatePropensity(xt, S_in, k);
    e = F'*(xt+S*h*dt);
end