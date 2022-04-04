clear;clc;
bin_pop_values = 10:5:200;

for i = 1:length(bin_pop_values)
    disp(bin_pop_values(i))
    %waitbar(i/length(bin_pop_values));
    bin_pop_ = bin_pop_values(i);
    [p(i), t(i), v(i)] = we_function(bin_pop_);
end
%d = load('../../../we_figures/0x8E/N=5/estimate.mat');
%p = d.p;

circuitTrue = 6.29e-4*ones(size(p));
yeastTrue = 1.202e-6*ones(size(p));
motilTrue = 2.16117e-7*ones(size(p));
futileTrue = 1.71e-7*ones(size(p));

%%
figure(1)
hold on
plot(bin_pop_values, p, bin_pop_values, circuitTrue, 'lineWidth', 2)
legend("WE Estimate", "True Probability")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Bin Size", 'fontsize', 20)
ylabel("Probability", 'fontsize', 20)
set (gca, 'linewidth', 4)
set(gca, 'YScale', 'log')
ylim([10^-06 10^-02])
ax = gca;
%exportgraphics(ax,'circuit_estimate_log.png','Resolution',96)



figure(2)
hold on
plot(bin_pop_values, t, 'lineWidth', 2)
legend("Time")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Bin Size", 'fontsize', 20)
ylabel("Time(s)", 'fontsize', 20)
set (gca, 'linewidth', 4)
ay=gca;
%exportgraphics(ay,'circuit_time.png','Resolution',96)

figure(3)
hold on
plot(bin_pop_values, p, bin_pop_values, circuitTrue, 'lineWidth', 2)
legend("WE Estimate", "True Probability")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Bin Size", 'fontsize', 20)
ylabel("Probability", 'fontsize', 20)
set (gca, 'linewidth', 4)
az=gca;
%exportgraphics(az,'circuit_estimate.png','Resolution',96)

figure(4)
hold on
plot(bin_pop_values, v, 'lineWidth', 2)
legend("variance")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Bin Size", 'fontsize', 20)
ylabel("Probability", 'fontsize', 20)
set (gca, 'linewidth', 4)
ac=gca;
%exportgraphics(az,'circuit_estimate.png','Resolution',96)
