%loading model parameters
model

%simulation runs
N = 1000;

%accumulator
mn = 0;


for i = 1:N
   
   t = 0;
   delta_t = tmax - t;
   x = X0;
   w = 1;
   
   %evaluate all hj, h0 would be sum(h)
   h = calculatePropensity(x, k);

   while t<tmax
       if xp == F'*x
          mn = mn + w;
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
            h_tilde = calculatePropensity(x, k);
      
       elseif flag == 1
            h_tilde = calculatePredilection(x,k,S,F,delta_t,xp);
       end
       
       r1 = rand;
       r2 = rand;
       
       tau = -(1.0/sum(h_tilde)) * log(r1);
       
       %randomly selecting one of reactions. Probablity distribution of 
       %selection is based on each reaction's relative propensity
       temp_sum = 0;
       j = 1;
       
       while temp_sum <= r2*sum(h_tilde)
           temp_sum = temp_sum + h_tilde(j);
           j = j + 1;
       end
       
       j = j - 1;
       w = w * (h(j)/h_tilde(j)) * exp((sum(h_tilde) - sum(h))*tau);
       t = t + tau;
       delta_t = tmax - t;
       x = x + S(:,j);
       h = calculatePropensity(x,k);
       
       
   end
end
p = mn/N;
