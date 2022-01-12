function htilde = calculatePredilection(xt,k,S,F,dt,xp, S_in)
    h = calculatePropensity(xt,k, S_in);
    H = diag(h);
    e = expectation(xt,F,S,k,dt, S_in);
    htilde = h + (H*S'*F)/(F'*S*H*S'*F*dt) * (xp-e);
end