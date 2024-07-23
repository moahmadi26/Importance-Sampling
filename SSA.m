%function [p, pArray, var, conf, tEnd] = SSA(modelFile, N)
clearvars;
addpath('CRNs');
addpath('utils');
model = input('Model Name? ', 's');
run(model);

N = 10000;
q = 0;
pArray = zeros(1,N);

tStart = tic;
for i = 1:N
    if mod(i,1000) == 0
        i
    end
    t = 0;
    x = X0;
    
    if strcmp(modelName, 'circuit0x8E')
        a = calculatePropensity0x8E(x, S);
    else
        a = calculatePropensity(x, S_in, k);
    end

    a0 = sum(a);
    
    while t < tmax
        if xp == F'*x
        %if xp <= F'*x
            q = q + 1;
            break
        end
       r1 = rand;
       r2 = rand;
       
       tau = -(1.0/a0) * log(r1);
       
       temp_sum = 0;
       mu = 1;
       
       while temp_sum <= r2*a0
           temp_sum = temp_sum + a(mu);
           mu = mu + 1;
       end
       
       mu = mu - 1;
       
       t = t + tau;
       x = x + S(:,mu);
       
       if strcmp(modelName, 'circuit0x8E')
           a = calculatePropensity0x8E(x, S);
       else
           a = calculatePropensity(x, S_in, k);
       end
       
       a0 = sum(a);
    end
    pArray(i) = q/i;
end
tEnd = toc(tStart);

p = pArray(end);
var = p - p^2;
SE = sqrt(p*(1-p)/N);
zstar = 1.96;
conf = [p-zstar*SE,p+zstar*SE]; %95% confidence interval
rmpath('CRNs')