clear;clc;
N = 10000;
n = 1:N;
modelName = 'motilReg';

[pSSA, pArraySSA, confSSA, tEndSSA] = SSA(modelName,N);
[pwSSA, pwArraySSA, varwSSA, confwSSA, tEndwSSA] = originalwSSA(modelName,N);
[pstate, pArraystate, varstate, confstate, tEndstate] = swSSA(modelName,N);
[pguided, pArrayguided, varguided, confguided, tEndguided] = guidedwSSA(modelName,N, 'C');

circuitTrue = 0.01587*ones(size(n));
yeastTrue = 1.202e-6*ones(size(n));
motilTrue = 2.375e-7*ones(size(n));
futileTrue = 0.0433*ones(size(n));

%%
figure(1)
hold on
plot(n,pArraySSA, n,pwArraySSA, n,pArraystate, n,pArrayguided, n, motilTrue, 'LineWidth', 2)
legend('SSA', 'wSSA', 'swSSA', 'Guided wSSA', 'True Probability')
set (gcf, 'color', 'w')
legend boxoff
xlabel('Runs', 'fontsize', 20)
ylabel('Estimated Probability', 'fontsize', 20)
set (gca, 'linewidth', 4)