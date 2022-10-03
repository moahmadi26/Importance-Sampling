function e = expectation0x8E_TI(xt,F,S,dt)
    h = calculatePropensity0x8E_TI(xt);
    e = F'*(xt+S*h*dt);
end