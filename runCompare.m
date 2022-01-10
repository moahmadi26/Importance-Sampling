N = 1000;
n = 1:N;
modelName = 'futileCycle';

[pSSA, pArraySSA, confSSA, tEndSSA] = SSA(modelName,N);
[pwSSA, pwArraySSA, varwSSA, confwSSA, tEndwSSA] = originalwSSA(modelName,N);
[pstate, pArraystate, varstate, confstate, tEndstate] = swSSA(modelName,N);
[pguided, pArrayguided, varguided, confguided, tEndguided] = guidedwSSA(modelName,N, 'C');

%%
figure(1)
plot(n,pArraySSA, n,pwArraySSA, n,pArraystate, n,pArrayguided, 'LineWidth', 2)
title('Run-Convergence Comparison')
legend('SSA', 'wSSA', 'swSSA', 'Guided wSSA')
xlabel('Runs')
ylabel('Estimated Probability')