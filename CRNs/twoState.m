%% Model Details
%from swSSA paper
k = [0.12;
     1]; %rate constants

S_in = [1, 0;
        0, 1]'; 

S_out = [0, 1;
         1, 0]';

S = S_out - S_in; %stoichiometric matrix

X0 = [100;
      0]; %Initial state

F = zeros(2,1);
F(2,1) = 1; %Target condition matrix (F^T*x_t=xp)

xp = [30]; %target state (F^T*x_t=xp)

tmax = 10; %total simulation time


%% Original wSSA Parameters

%delta = 2; %this is near optimal for this model
alph = [delta;
         1/delta];
     
%% swSSA Parameters

assignment = ['E'; 'N'];

rho_zero = zeros(2,1);
rho_zero(1) = 0.5;

gamma_max = ones(2,1);
gamma_max(1) = 20;