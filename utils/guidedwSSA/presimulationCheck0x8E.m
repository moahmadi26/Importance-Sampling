function d = presimulationCheck0x8E(xt,F,S,dt,xp,x0)
    e = expectation0x8E(xt,F,S,dt);
    d = zeros(size(e));
    FTx0 = F'*x0;
    for i = 1:length(e)
        d(i) = (e(i)-xp(i))*(xp(i)-FTx0(i));
    end
end