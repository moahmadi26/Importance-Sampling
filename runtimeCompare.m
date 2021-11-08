N = 1000;
modelName = 'futileCycle';

[pSSA, pArraySSA, confSSA, tEndSSA] = SSA('futileCycle',N);
[pwSSA, pwArraySSA, varwSSA, confwSSA, tEndwSSA] = originalwSSA('futileCycle',N);
[pstate, pArraystate, varstate, confstate, tEndstate] = swSSA('futileCycle',N);
[pguided, pArrayguided, varguided, confguided, tEndguided] = guidedwSSA('futileCycle',N, 'C');

%%
figure(1)
X = categorical({'SSA','wSSA','swSSA','guided wSSA'});
X = reordercats(X,{'SSA','wSSA','swSSA','guided wSSA'});
Y = [tEndSSA, tEndwSSA, tEndstate, tEndguided];
bar(X,Y)
title('Runtime Comparison')
ylabel('Time (s)')