clear;clc;
N = 1000;
modelName = 'circuit0x8E';

[pSSA, pArraySSA, confSSA, tEndSSA] = SSA(modelName,N);
[pwSSA, pwArraySSA, varwSSA, confwSSA, tEndwSSA] = originalwSSA(modelName,N);
[pstate, pArraystate, varstate, confstate, tEndstate] = swSSA(modelName,N);
[pguided, pArrayguided, varguided, confguided, tEndguided] = guidedwSSA(modelName,N, 'C');

%%
figure(1)
X = categorical({'SSA','wSSA','swSSA','guided wSSA'});
X = reordercats(X,{'SSA','wSSA','swSSA','guided wSSA'});
Y = [tEndSSA, tEndwSSA, tEndstate, tEndguided];
bar(X,Y)
set (gcf, 'color', 'w')
%title('Runtime Comparison')
ylabel('Time (s)', 'fontsize', 20)