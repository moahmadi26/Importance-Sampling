gamma_max_f = 10;
gamma_max_g = 10;

rho_zero_f = 0.55;
rho_zero_g = 0.15;

x=0:0.001:1;
f_x=zeros(size(x,1));
g_x=zeros(size(x,1));

for i=1:length(x) 
    if x(i) <rho_zero_f
        f_x(i) = ((((gamma_max_f-1)/(rho_zero_f^2))*((rho_zero_f-x(i))^2))+1);
    else
        f_x(i) = 1;
    end
end

for i=1:length(x) 
    if x(i) >rho_zero_g
        g_x(i) = 1.0/((((gamma_max_g-1)/((rho_zero_g-1)^2))*((rho_zero_g-x(i))^2))+1);
    else
        g_x(i) = 1;
    end
end

figure(1)
least_g_value = 1.0/((((gamma_max_g-1)/((rho_zero_g-1)^2))*((rho_zero_g-1)^2))+1);
plot(x,g_x, 'LineWidth', 2)
hold on
plot([rho_zero_g rho_zero_g], [0 1],'--', 'LineWidth', 2)
plot([0 1], [least_g_value least_g_value],'--', 'LineWidth', 2)
ylim([0 1.2])
xticks([rho_zero_g])
xticklabels({'\rho_{0}^{j}'})
yticks([least_g_value 1])
yticklabels({'1/\gamma_{j}^{max}','1'})
set (gca, 'linewidth', 4)
set(gca,'FontWeight','bold')
hYLabel = get(gca,'YLabel');
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
ax = gca;
ax.FontSize = 16;
xlabel('\rho_{j}(x)');
ylabel('g_{j}(x)')
exportgraphics(ax,'g_func.png','Resolution',96)

figure(2)
max_f_value = ((((gamma_max_f-1)/(rho_zero_f^2))*((rho_zero_f)^2))+1);
plot(x,f_x, 'LineWidth', 2)
hold on
plot([rho_zero_f rho_zero_f], [0 1],'--', 'LineWidth', 2)
plot([0 rho_zero_f-0.05], [1 1],'--', 'LineWidth', 2)
ylim([0 11])
xticks([rho_zero_f])
xticklabels({'\rho_{0}^{j}'})
yticks([1 max_f_value ])
yticklabels({'1','\gamma_{j}^{max}'})
set (gca, 'linewidth', 4)
set(gca,'FontWeight','bold')
hYLabel = get(gca,'YLabel');
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
ax = gca;
ay = gca;
ay.FontSize = 16;
xlabel('\rho_{j}(x)');
ylabel('f_{j}(x)');
exportgraphics(ay,'f_func.png','Resolution',96)
