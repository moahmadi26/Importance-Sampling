function htilde = calculatePredilection(xt,k,S,F,dt,xp)
    h = calculatePropensity(xt,k);
    H = diag(h);
    e = expectation(xt,F,S,k,dt);
    htilde = h + (H*S'*F)/(F'*S*H*S'*F*dt) * (xp-e);
end