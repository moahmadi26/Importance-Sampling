input('Model Name? ')

N = 1000;
tmax = 100;
q = 0;
gamma = 0.5; %gamma and alpha are specific to sixrxn model
alpha = [1;
         1;
         gamma;
         1;
         1;
         1/gamma];

for i = 1:N
    w = 1;
    t = 0;
    x = X0;
    
    a = calculatePropensity(x,k,S);
    a0 = sum(a);
    b = a.*alpha;
    b0 = sum(b);
    
    while t < tmax
        if xp == F'*x
            q = q + w;
            break
        end
       r1 = rand;
       r2 = rand;
       
       tau = -(1.0/a0) * log(r1);
       
       temp_sum = 0;
       mu = 1;
       
       while temp_sum <= r2*b0
           temp_sum = temp_sum + b(mu);
           mu = mu + 1;
       end
       
       mu = mu - 1;
       
       w = w*(a(mu)/b(mu))*(b0/a0);
       t = t + tau;
       x = x + S(:,mu);
       
       a = calculatePropensity(x,k,S);
       a0 = sum(a);
       b = a.*alpha;
       b0 = sum(b);
    end
end

p = q/N