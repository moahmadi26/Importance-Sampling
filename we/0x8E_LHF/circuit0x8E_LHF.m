%% Model Details
% Circuit0x8E_LHF
% 1.473
%%%%%%%%%%%%%%%%%%%%%



% Species: AmtR_protein, Ara_AraC_protein, BetI_protein, BM3R1_protein, HlyIIR_protein,
% LacI_protein, PhlF_protein, TetR_protein, YFP_protein,
% topModel_AmtRpart_module_sub__pBAD,
% topModel_AmtRpart_module_sub__pBM3R1,
% topModel_BetIpart_module_sub__pHlyIIR,
% topModel_BetIpart_module_sub__pTet,
% topModel_Inverter1_module_sub__Inverter1_fc,
% topModel_Inverter2_module_sub__Inverter2_fc,
% topModel_PhlFpart_module_sub__pAmtR,
% topModel_PhlFpart_module_sub__pTac,
% topModel_YFPpart_module_sub__pBetI,
% topModel_YFPpart_module_sub__pPhlF

S = [-10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % AmtR_degradation_interaction
     0, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;  % BetI_degradation_interaction
     0, 0, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;  % BM3R1_degradation_interaction
     0, 0, 0, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % HlyIIR_degradation_interaction
     0, 0, 0, 0, 0, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % PhlF_degradation_interaction
     10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_AmtRpart_module_sub__AmtR_protein_interaction_0
     10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_AmtRpart_module_sub__AmtR_protein_interaction_1
     0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_BetIpart_module_sub__BetI_protein_interaction_0
     0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_BetIpart_module_sub__BetI_protein_interaction_1
     0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_Inverter1_module_sub__HlyIIR_protein_interaction
     0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_Inverter2_module_sub__BM3R1_protein_interaction
     0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_PhlFpart_module_sub__PhlF_protein_interaction_0
     0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_PhlFpart_module_sub__PhlF_protein_interaction_1
     0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_YFPpart_module_sub__YFP_protein_interaction_0
     0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_YFPpart_module_sub__YFP_protein_interaction_1
     0, 0, 0, 0, 0, 0, 0, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]'; % YFP_degradation_interaction

%Initial state
X0 = [70;   % AmtR_protein
      60;   % Ara_AraC_protein
      70;   % BetI_protein
      0;    % BM3R1_protein
      0;    % HlyIIR_protein
      0;    % LacI_protein
      70;   % PhlF_protein
      0;    % TetR_protein
      0;    % YFP_protein
      2.0;  % topModel_AmtRpart_module_sub__pBAD
      2.0;  % topModel_AmtRpart_module_sub__pBM3R1
      2.0;  % topModel_BetIpart_module_sub__pHlyIIR
      2.0;  % topModel_BetIpart_module_sub__pTet
      2.0;  % topModel_Inverter1_module_sub__Inverter1_fc
      2.0;  % topModel_Inverter2_module_sub__Inverter2_fc
      2.0;  % topModel_PhlFpart_module_sub__pAmtR
      2.0;  % topModel_PhlFpart_module_sub__pTac
      2.0;  % topModel_YFPpart_module_sub__pBetI
      2.0]; % topModel_YFPpart_module_sub__pPhlF

F = zeros(19,1);
F(9,1) = 1; %Target condition matrix (F^T*x_t=xp)

xp = [160]; %target state (F^T*x_t=xp) 30

tmax = 1000; %total simulation time


%% Original wSSA Parameters

delta = 0.7; %close to optimal for this scheme by running 2000 wSSA for delta in [0.05, 0.05, 1.5]
alph = ones(16,1);
% alph(1) = 1/delta;
% alph(2) = delta;
% alph(4) = delta;
% alph(5) = delta;
% alph(6) = delta;
% alph(7) = 1/delta;
% alph(8) = 1/delta;
% alph(11) = 1/delta;
% alph(12) = 1/delta;
% alph(13) = 1/delta;
alph(14) = 1/delta;
alph(15) = 1/delta;
alph(16) = delta;

%% swSSA Parameters

assignment = ['N'; 'N'; 'N'; 'N'; 'N'; 'N'; 'N'; 'N'; 'N'; 'N'; 'N'; 'N'; 'N'; 'E'; 'E'; 'D'];

rho_zero = zeros(16,1);
rho_zero(14) = 0.5;
rho_zero(15) = 0.5;
rho_zero(16) = 0.15;

gamma_max_temp = 1.75; %close to optimal for this scheme by running 5000 swSSA for gamma in [1, 0.25, 5]
gamma_max = ones(16,1);
gamma_max(14) = gamma_max_temp;
gamma_max(15) = gamma_max_temp;
gamma_max(16) = gamma_max_temp;