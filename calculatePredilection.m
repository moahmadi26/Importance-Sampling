function htilde = calculatePredilection(xt,k,S,F,dt,xp)
    h = calculatePropensity(xt,k);
    H = diag(h);
    htilde = h + (H*S'*F)/(F'*S*H*S'*F*dt) * (xp-F'*(xt+S*h*dt));
end