function e = expectation0x8E_LHF(xt,F,S,dt)
    h = calculatePropensity0x8E_LHF(xt);
    e = F'*(xt+S*h*dt);
end