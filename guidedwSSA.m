function [p, pArray, var, conf, tEnd] = guidedwSSA(modelFile)
%loading model parameters
%input('Model Name? ')
eval(modelFile)

%simulation runs
N = 1000;

%accumulator
mn = 0;
squareSum = 0;

pArray = zeros(N,1);

tStart = tic;
for i = 1:N
   t = 0;
   delta_t = tmax - t;
   x = X0;
   w = 1;
   
   while t<tmax
       %evaluate all hj, h0 would be sum(h)
       h = calculatePropensity(x, k, S_in);
       h0 = sum(h);
       
       if xp == F'*x
          mn = mn + w;
          squareSum = squareSum + w^2;
          break;
       end
       
       %evaluate all di
       
       d = presimulationCheck(x,F,S,k,delta_t,xp,X0);
       
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
            h_tilde = calculatePredilection(x,k,S,F,delta_t,xp);
       end
       
       alph = h_tilde./h;
       
       %choose method "A", "B" or "C" as second argument of reslveNegatives
       alph = resolveNegatives(alph, "C");
       
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
end

% %Plotting Convergence
% runs = 0:length(pArray)-1;
% true = 0.0433*ones(size(runs));
% figure(1)
% plot(runs, pArray, runs, true)
% xlabel("Runs")
% ylabel("Estimated Probability")
% title("Guided wSSA Convergence")
