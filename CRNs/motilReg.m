%% Model Details
modelName = 'motilReg';

%from guided proposals paper
k = [0.1;
     0.0002;
     1;
     0.0002;
     1;
     0.0002;
     0.01;
     0.1;
     0.02;
     0.1;
     0.01;
     0.1]; %rate constants

S_in = [1, 0, 0, 0, 0, 0, 0, 0, 0;
        0, 1, 0, 0, 0, 0, 0, 0, 0;
        0, 0, 1, 0, 0, 0, 0, 0, 0;
        0, 0, 0, 1, 0, 0, 0, 0, 0;
        0, 0, 0, 0, 1, 0, 0, 0, 0;
        0, 0, 0, 0, 0, 0, 1, 0, 0;
        0, 0, 0, 1, 0, 1, 0, 0, 0;
        0, 0, 0, 0, 1, 0, 0, 0, 0;
        0, 1, 1, 0, 0, 0, 0, 0, 0;
        0, 0, 0, 0, 0, 0, 0, 1, 0;
        0, 1, 0, 0, 0, 1, 0, 0, 0;
        0, 0, 0, 0, 0, 0, 0, 0, 1]';

S_out = [1, 1, 0, 0, 0, 0, 0, 0, 0;
         0, 0, 0, 0, 0, 0, 0, 0, 0;
         0, 0, 1, 1, 0, 0, 0, 0, 0;
         0, 0, 0, 0, 0, 0, 0, 0, 0;
         0, 0, 0, 1, 0, 1, 1, 0, 0;
         0, 0, 0, 0, 0, 0, 0, 0, 0;
         0, 0, 0, 0, 1, 0, 0, 0, 0;
         0, 0, 0, 0, 1, 1, 0, 0, 0;
         0, 0, 0, 0, 0, 0, 0, 1, 0;
         0, 1, 1, 0, 0, 0, 0, 0, 0;
         0, 0, 0, 0, 0, 0, 0, 0, 1;
         0, 1, 0, 0, 0, 1, 0, 0, 0]';

S = S_out - S_in; %stoichiometric matrix

X0 = [1;
      10;
      1;
      10;
      1;
      1;
      10;
      1;
      1]; %Initial state

F = zeros(9,1);
F(2,1) = 1; %Target condition matrix (F^T*x_t=xp)

xp = [20]; %target state (F^T*x_t=xp)

tmax = 10; %total simulation time

%% Original wSSA Parameters

delta = 0.3; %this is near optimal for this model
alph = ones(12,1);
alph(1) = 1/delta;
alph(10) = 1/delta;
alph(12) = 1/delta;
alph(2) = delta;
alph(9) = delta;
alph(11) = delta;
     
%% swSSA Parameters

assignment = ['E'; 'D'; 'N'; 'N'; 'N'; 'N'; 'N'; 'N'; 'D'; 'E'; 'D'; 'E'];

rho_zero = zeros(12,1);
rho_zero(1) = 0.5;
rho_zero(2) = 0.15;
rho_zero(9) = 0.15;
rho_zero(10) = 0.5;
rho_zero(11) = 0.15;
rho_zero(12) = 0.5;

gamma_max_temp = 8.25;
gamma_max = ones(12,1);
% gamma_max(1) = gamma_max_temp;
% gamma_max(2) = gamma_max_temp;
% gamma_max(9) = gamma_max_temp;
% gamma_max(10) = gamma_max_temp;
% gamma_max(11) = gamma_max_temp;
% gamma_max(12) = gamma_max_temp;
gamma_value = gamma_max_temp;
gamma_max(1) = gamma_value;
gamma_max(2) = gamma_value;
gamma_max(9) = gamma_value;
gamma_max(10) = gamma_value;
gamma_max(11) = gamma_value;
gamma_max(12) = gamma_value;

