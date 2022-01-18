clear;clc;
global gamma_value
biasingValues = 4:0.25:12;

for i = 1:length(biasingValues)
    gamma_value = biasingValues(i);
    p(i) = swSSA('circuit0x8E',100);
end

circuitTrue = 0.01587*ones(size(p));
yeastTrue = 1.202e-6*ones(size(p));
motilTrue = 2.16117e-7*ones(size(p));
futileTrue = 1.71e-7*ones(size(p));

%%
figure(1)
hold on
plot(biasingValues, p, biasingValues, circuitTrue, 'lineWidth', 2)
legend("swSSA Estimate", "True Probability")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Biasing", 'fontsize', 20)
ylabel("Probability", 'fontsize', 20)
set (gca, 'linewidth', 4)