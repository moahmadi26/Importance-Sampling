%% Model Details
%from dwSSA paper
k = [0.0038;
     0.0004;
     0.042;
     0.0100
     0.011;
     0.1;
     1050;
     3.21]; %rate constants

S_in = [0, 0, 0, 0, 0, 0, 0;
        1, 0, 0, 0, 0, 0, 0;
        1, 1, 0, 0, 0, 0, 0;
        0, 0, 1, 0, 0, 0, 0;
        0, 0, 1, 1, 0, 0, 0;
        0, 0, 0, 0, 1, 0, 0;
        0, 0, 0, 0, 0, 1, 1;
        0, 0, 0, 0, 0, 0, 0]'; 

S_out = [1, 0, 0, 0, 0, 0, 0;
         0, 0, 0, 0, 0, 0, 0;
         0, 1, 1, 0, 0, 0, 0;
         1, 0, 0, 0, 0, 0, 0;
         0, 0, 0, 0, 1, 1, 0;
         0, 0, 0, 0, 0, 0, 1;
         0, 0, 0, 1, 0, 0, 0;
         0, 0, 1, 0, 0, 0, 0]';

S = S_out - S_in; %stoichiometric matrix

X0 = [50;
      2;
      0;
      50;
      0;%Mohammad help
      0;
      0]; %Initial state

F = zeros(7,1);
F(6,1) = 1; %Target condition matrix (F^T*x_t=xp)

xp = [50]; %target state (F^T*x_t=xp)

tmax = 20; %total simulation time


%% Original wSSA Parameters

delta = 0.5; %near optimal for this scheme
%alph = [1/delta; delta; 1/delta; delta; 1/delta; delta; delta; 1/delta];
alph = ones(8,1);
alph(6) = delta;

     
%% swSSA Parameters

assignment = ['N'; 'N'; 'N'; 'N'; 'N'; 'D'; 'N'; 'N'];

rho_zero = zeros(8,1);
rho_zero(6) = 0.15;

gamma_max = ones(8,1);
gamma_max(6) = 20;
