%% Model Details
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

alph = ones(12,1);
alph(1) = 1/delta;
alph(10) = 1/delta;
alph(12) = 1/delta;
alph(2) = delta;
alph(9) = delta;
alph(11) = delta;
     
%% swSSA Parameters

%Mohammad help