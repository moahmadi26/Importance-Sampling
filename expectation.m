function e = expectation(xt,F,S,k,dt, S_in)
    h = calculatePropensity(xt,k, S_in);
    e = F'*(xt+S*h*dt);
end