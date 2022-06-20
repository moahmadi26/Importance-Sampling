N = 15;
pmat = load('./bin_pop_10_5_200_N_15/p.mat');
p = pmat.p;

tmat = load('./bin_pop_10_5_200_N_15/t.mat');
t = tmat.t;

vmat = load('./bin_pop_10_5_200_N_15/v.mat');
v = vmat.v;

circuitTrue = 6.29e-4*ones(size(p));
yeastTrue = 1.202e-6*ones(size(p));
motilTrue = 2.16117e-7*ones(size(p));
futileTrue = 1.71e-7*ones(size(p));

x = 10:5:200;
err = zeros(size(x));

for i = 1:size(x, 2)
    disp(v(i))
    SE = (1/sqrt(N))*sqrt(v(i));
    disp(SE)
    zstar = 1.96;
    err(i) = zstar*SE;
end

figure(1)
%hold on
%plot(bin_pop_values, p, bin_pop_values, yeastTrue, 'lineWidth', 2)
hold on
errorbar(x(1:2:end), p(1:2:end), err(1:2:end), 'o', 'LineWidth', 2)
hold on
plot(x(1:2:end), futileTrue(1:2:end), 'lineWidth', 2)
hold on
plot(x(1:2:end), p(1:2:end), ':', 'LineWidth', 1.5, 'Color', [0 0.447 0.7410])
legend("WE Estimate", "True Probability")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Bin Size", 'fontsize', 20)
ylabel("Probability", 'fontsize', 20)
set (gca, 'linewidth', 4)
set(gca, 'YScale', 'log')
ylim([10^-09 10^-03])
ax = gca;
ax.FontSize = 24;
%exportgraphics(ax,'yeast_estimate_log.png','Resolution',96)



figure(2)
hold on
plot(x(1:2:end), t(1:2:end), 'lineWidth', 2)
legend("Time")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Bin Size", 'fontsize', 20)
ylabel("Time(s)", 'fontsize', 20)
set (gca, 'linewidth', 4)
ay=gca;
ay.FontSize = 24;
%exportgraphics(ay,'yeast_time.png','Resolution',96)

%{
figure(3)
hold on
plot(bin_pop_values, p, bin_pop_values, yeastTrue, 'lineWidth', 2)
legend("WE Estimate", "True Probability")
set (gcf, 'color', 'w')
legend boxoff 
xlabel("Bin Size", 'fontsize', 20)
ylabel("Probability", 'fontsize', 20)
set (gca, 'linewidth', 4)
az=gca;
%exportgraphics(az,'yeast_estimate.png','Resolution',96)

%}

