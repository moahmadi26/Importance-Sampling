%% Model Details
%from original wSSA paper
k = [1;
    0.025]; %rate constants

S_in = [1, 0;
        0, 1]';
    
S_out = [1, 1;
         0, 0]';
     
S = S_out - S_in; % stoichiometric matrix

X0 = [1;
     40]; %Initial state

F = [0;
     1]; %Target condition matrix (F^T*x_t=xp)

xp = [65]; %target state (F^T*x_t=xp)

tmax = 100; %total simulation time

%% Original wSSA Parameters

delta = 1.2;
alph = [delta;
         1/delta];
     
%% swSSA Parameters

assignment = ['E'; 'N'];
rho_zero = zeros(2,1);
rho_zero(1) = 0.6;
gamma_max = ones(2,1);
gamma_max(1) = 14;
