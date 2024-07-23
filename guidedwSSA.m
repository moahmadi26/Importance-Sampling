%function [p, pArray, var, conf, tEnd] = guidedwSSA(modelFile, N, negativeMethod)
clearvars;
addpath('CRNs');
addpath('utils');
addpath('utils/guidedwSSA');
model = input('Model Name? ', 's');
run(model);
negativeMethod = 'C';

N = 100000;

%accumulator
mn = 0;
squareSum = 0;

pArray = zeros(N,1);

tStart = tic;
for i = 1:N
   if mod(i,1000) == 0
        i
   end
   t = 0;
   delta_t = tmax - t;
   x = X0;
   w = 1;
   
   while t<tmax
       %evaluate all hj, h0 would be sum(h)
       if strcmp(modelName, 'circuit0x8E')
           h = calculatePropensity0x8E(x);
       else
           h = calculatePropensity(x, S_in, k);
       end

       h0 = sum(h);
       
       if xp == F'*x
          mn = mn + w;
          squareSum = squareSum + w^2;
          break;
       end
       
       %evaluate all di
       
       if strcmp(modelName, 'circuit0x8E')
           d = presimulationCheck0x8E(x,F,S,delta_t,xp,X0);
       else
           d = presimulationCheck(x,F,S,k,delta_t,xp,X0, S_in);
       end
       
       %set h_tilde based on d. if all di>0 don't adjust model
       flag = 0;
       for v = 1:length(d)
           if d(v)<=0
               flag = 1;
           end
       end
       
       if flag == 0
            h_tilde = h;
      
       elseif flag == 1
           if strcmp(modelName, 'circuit0x8E') 
               h_tilde = calculatePredilection0x8E(x,S,F,delta_t,xp);
           else
               h_tilde = calculatePredilection(x,k,S,F,delta_t,xp, S_in);
           end
       end
       
       alph = h_tilde./h;
       
       %choose method "A", "B" or "C" as second argument of reslveNegatives
       alph = resolveNegatives(alph, negativeMethod);
       
       h_tilde = alph .* h; 
       h0_tilde = sum(h_tilde);
       
       r1 = rand;
       r2 = rand;
       
       tau = -(1.0/h0_tilde) * log(r1);
       
       %randomly selecting one of reactions. Probablity distribution of 
       %selection is based on each reaction's relative propensity
       temp_sum = 0;
       j = 1;
       
       while temp_sum <= r2*h0_tilde
           temp_sum = temp_sum + h_tilde(j);
           j = j + 1;
       end
       
       j = j - 1;
       w = w * (h(j)/h_tilde(j)) * exp((h0_tilde - h0)*tau);
       t = t + tau;
       delta_t = tmax - t;
       x = x + S(:,j);
       
   end
   pArray(i) = mn/i;
end
tEnd = toc(tStart);

p = pArray(end);
var = squareSum/N - p^2;
SE = (1/sqrt(N))*sqrt(var);
zstar = 1.96;
conf = [p-zstar*SE,p+zstar*SE]; %95% confidence interval
%end

% %Plotting Convergence
% runs = 0:length(pArray)-1;
% true = 0.0433*ones(size(runs));
% figure(1)
% plot(runs, pArray, runs, true)
% xlabel("Runs")
% ylabel("Estimated Probability")
% title("Guided wSSA Convergence")
