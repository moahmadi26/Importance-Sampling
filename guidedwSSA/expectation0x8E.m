function e = expectation0x8E(xt,F,S,dt)
    h = calculatePropensity0x8E(xt);
    e = F'*(xt+S*h*dt);
end