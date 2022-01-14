%% Model Details
%from original wSSA paper
k = [1;
    1;
    0.1;
    1;
    1;
    0.1]; %rate constants

S_in = [1,1,0,0,0,0;
    0,0,1,0,0,0;
    0,0,1,0,0,0;
    0,0,0,1,1,0;
    0,0,0,0,0,1;
    0,0,0,0,0,1]'; 

S_out = [0,0,1,0,0,0;
    1,1,0,0,0,0;
    1,0,0,0,1,0;
    0,0,0,0,0,1;
    0,0,0,1,1,0;
    0,1,0,1,0,0]';

S = S_out - S_in; %stoichiometric matrix

% S = [-1,-1,1,0,0,0;
%     1,1,-1,0,0,0;
%     1,0,-1,0,1,0;
%     0,0,0,-1,-1,1;
%     0,0,0,1,1,-1;
%     0,1,0,1,0,-1]'; %Stoichiometric matrix

X0 = [1;
    50;
    0;
    1;
    50;
    0]; %Initial state

F = zeros(6,1);
F(5,1) = 1; %Target condition matrix (F^T*x_t=xp)

xp = [40]; %target state (F^T*x_t=xp)

tmax = 100; %total simulation time


%% Original wSSA Parameters
delta = 0.5; %this is near optimal for this model
alph = [1;
         1;
         delta;
         1;
         1;
         1/delta];
     
%% swSSA Parameters

assignment = ['N'; 'N'; 'D'; 'N'; 'N'; 'E'];

rho_zero = zeros(6,1);
rho_zero(3) = 0.15;
rho_zero(6) = 0.5;

gamma_max = ones(6,1);
gamma_max(3) = 2.2;
gamma_max(6) = 2.2;