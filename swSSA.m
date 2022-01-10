%%function [p, pArray, var, conf, tEnd] = swSSA(modelFile, N)
input('Model Name? ')
%input('swSSA Specific Input? ')
%eval(modelFile)

%simulation runs
N = 10000;

%accumulator
mn = 0;
squareSum = 0;

pArray = zeros(N,1);

tStart = tic;
for i = 1:N
   %i
   t = 0;
   x = X0;
   w = 1;
   pArray(i) = mn/i;
   
   a = calculatePropensity(x, k, S_in);
   a0 = sum(a);
   rho = a/a0;
   gamma = gammaFunction(rho_zero, gamma_max, rho, assignment);
   %disp(size(gamma))
   b = gamma.*a;
   %disp (size(b))
   b0 = sum(b);
   
   
   while t<tmax
       if xp == F'*x
          mn = mn + w;
          squareSum = squareSum + w^2;
          break;
       end

       r1 = rand;
       r2 = rand;
       
       tau = (1.0/a0) * log(1.0/r1);
       
       it = 1;
       temp_sum = 0;
       
       while temp_sum <= r2*b0
           temp_sum = temp_sum + b(it);
           it = it+1;   
       end
       
       it = it-1;
       w = w * (a(it)/b(it)) * (b0/a0);
       t = t + tau;
       x = x + S(:,it); 
        
       a = calculatePropensity(x, k, S_in);
       a0 = sum(a);
       rho = a/a0;
       gamma = gammaFunction(rho_zero, gamma_max, rho, assignment);
       b = gamma.*a;
       b0 = sum(b);
       
   end
   pArray(i) = mn/i;
end
tEnd = toc(tStart);

p = pArray(end);
var = squareSum/N - p^2;
SE = (1/sqrt(N))*sqrt(var);
zstar = 1.96;
conf = [p-zstar*SE,p+zstar*SE]; %95% confidence interval
%%end


function gamma = gammaFunction(rho_zero, gamma_max, rho, assignment)
    gamma = ones(size(assignment, 1), 1);
    for j=1:size(assignment, 1)
        if assignment(j) == 'E'
            if rho(j) < rho_zero(j)
                gamma(j) = (((gamma_max(j)-1)/(rho_zero(j)^2))*((rho_zero(j)-rho(j))^2)) + 1;
            end
        elseif assignment(j) == 'D'
            if rho(j) > rho_zero(j)
                gamma(j) = 1.0 / ((((gamma_max(j)-1)/((rho_zero(j)-1)^2))*((rho_zero(j)-rho(j))^2)) + 1);
            end
        end    
    end
end

