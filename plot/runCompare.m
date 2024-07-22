clear;clc;
N = 10000;
n = 1:N;
modelName = 'yeastPolarization';

[pSSA, pArraySSA, varSSA, confSSA, tEndSSA] = SSA(modelName,N);
[pwSSA, pwArraySSA, varwSSA, confwSSA, tEndwSSA] = originalwSSA(modelName,N);
[pstate, pArraystate, varstate, confstate, tEndstate] = swSSA(modelName,N);
[pguided, pArrayguided, varguided, confguided, tEndguided] = guidedwSSA(modelName,N, 'C');

circuitTrue = 6.29e-4*ones(size(pArraySSA));
yeastTrue = 1.202e-6*ones(size(pArraySSA));
motilTrue = 2.16117e-7*ones(size(pArraySSA));
futileTrue = 1.71e-7*ones(size(pArraySSA));

%%
figure(1)
hold on
plot(n,pArraySSA, n,pwArraySSA, n,pArraystate, n,pArrayguided, n, yeastTrue, 'LineWidth', 2)
legend('SSA', 'wSSA', 'swSSA', 'Guided wSSA', 'True Probability')
set (gcf, 'color', 'w')
legend boxoff
xlabel('Runs', 'fontsize', 20)
ylabel('Estimated Probability', 'fontsize', 20)
set (gca, 'linewidth', 4)