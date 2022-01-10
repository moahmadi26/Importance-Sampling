clear;clc;
global delta
biasingValues = 0.05:0.05:1.5;

for i = 1:length(biasingValues)
    delta = biasingValues(i);
    p(i) = originalwSSA('circuit0x8E',100);
end

circuitTrue = 0.01587*ones(size(p));
yeastTrue = 1.202e-6*ones(size(p));
motilTrue = 2.375e-7*ones(size(p));
futileTrue = 0.0433*ones(size(p));

%%
figure(1)
hold on
plot(biasingValues, p, biasingValues, circuitTrue, 'lineWidth', 2)
legend("wSSA Estimate", "True Probability")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Biasing", 'fontsize', 20)
ylabel("Probability", 'fontsize', 20)
set (gca, 'linewidth', 4)