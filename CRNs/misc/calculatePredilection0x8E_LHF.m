function htilde = calculatePredilection0x8E_LHF(xt,S,F,dt,xp)
    h = calculatePropensity0x8E_LHF(xt);
    H = diag(h);
    e = expectation0x8E_LHF(xt,F,S,dt);
    htilde = h + (H*S'*F)/(F'*S*H*S'*F*dt) * (xp-e);
end