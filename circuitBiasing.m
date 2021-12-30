clear;clc;
global delta
biasingValues = 0.05:0.05:1.5;

for i = 1:length(biasingValues)
    delta = biasingValues(i);
    p(i) = originalwSSA('circuit0x8E',1000);
end


%%
figure(1)
hold on
plot(biasingValues, p, 'lineWidth', 2)
legend("wSSA Estimate", "True Probability")
set (gcf, 'color', 'w');
legend boxoff 
xlabel("Biasing", 'fontsize', 20)
ylabel("Probability", 'fontsize', 20);
set (gca, 'linewidth', 4)