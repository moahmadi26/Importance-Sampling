clear;clc;
global delta
biasingValues = 0.05:0.05:1;

for i = 1:length(biasingValues)
    delta = biasingValues(i);
    [p(i), ~, s(i), ~, ~] = originalwSSA('motilReg',1000);
end

circuitTrue = 0.01587*ones(size(p));
yeastTrue = 1.202e-6*ones(size(p));
motilTrue = 2.16117e-7*ones(size(p));
futileTrue = 1.71e-7*ones(size(p));

%%
figure(1)
hold on
plot(biasingValues, s, 'lineWidth', 2)
legend("Weight Variance")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Biasing", 'fontsize', 20)
ylabel("Variance", 'fontsize', 20)
set (gca, 'linewidth', 4)

%%
figure(2)
hold on
plot(biasingValues, p, biasingValues, motilTrue, 'lineWidth', 2)
legend("wSSA Estimate", "True Probability")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Biasing", 'fontsize', 20)
ylabel("Probability", 'fontsize', 20)
set (gca, 'linewidth', 4)