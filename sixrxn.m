%% Model Details
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
gamma = 0.5;
alpha = [1;
         1;
         gamma;
         1;
         1;
         1/gamma];
     
%% swSSA Parameters

% Need Mohammad help