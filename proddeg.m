k = [1;
    0.025]; %rate constants

S = [0,1;
    0,-1]'; %Stoichiometric matrix

X0 = [1;
    40]; %Initial state

F = zeros(2,1);
F(2,1) = 1; %Target condition matrix (F^T*x_t=xp)

xp = [80]; %target state (F^T*x_t=xp)

tmax = 100; %total simulation time

