function d = presimulationCheck(xt,F,S,k,dt,xp,x0)
    e = expectation(xt,F,S,k,dt);
    d = zeros(size(e));
    FTx0 = F'*x0;
    for i = 1:length(e)
        d(i) = (e(i)-xp(i))*(xp(i)-FTx0(i));
    end
end