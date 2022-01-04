%% Model Details
% Circuit0x8E
%%%%%%%%%%%%%%%%%%%%%


 
% Species: AmtR_protein, Ara_AraC_protein, BetI_protein, HlyIIR_protein,
% LacI_protein, PhlF_protein, TetR_protein, YFP_protein,
% topModel_AmtRpart_module_sub__pBAD,
% topModel_AmtRpart_module_sub__pHlyIIR,
% topModel_BetIpart_module_sub__pHlyIIR,
% topModel_BetIpart_module_sub__pTet,
% topModel_HlyIIRpart_module_sub__pBAD,
% topModel_HlyIIRpart_module_sub__pTet,
% topModel_PhlFpart_module_sub__pAmtR, topModel_PhlFpart_module_sub__pTac,
% topModel_YFPpart_module_sub__pBetI, topModel_YFPpart_module_sub__pPhlF

S = [-10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % AmtR_degradation_interaction
     0, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;  % BetI_degradation_interaction
     0, 0, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % HlyIIR_degradation_interaction
     0, 0, 0, 0, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % PhlF_degradation_interaction
     10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_AmtRpart_module_sub__AmtR_protein_interaction_0
     10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_AmtRpart_module_sub__AmtR_protein_interaction_1
     0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_BetIpart_module_sub__BetI_protein_interaction_0
     0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_BetIpart_module_sub__BetI_protein_interaction_1
     0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_HlyIIRpart_module_sub__HlyIIR_protein_interaction_0
     0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_HlyIIRpart_module_sub__HlyIIR_protein_interaction_1
     0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_PhlFpart_module_sub__PhlF_protein_interaction_0
     0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_PhlFpart_module_sub__PhlF_protein_interaction_1
     0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_YFPpart_module_sub__YFP_protein_interaction_0
     0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % topModel_YFPpart_module_sub__YFP_protein_interaction_1
     0, 0, 0, 0, 0, 0, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]'; % YFP_degradation_interaction

%Initial state
X0 = [70;   % AmtR_protein       
      60;   % Ara_AraC_protein     
      70;   % BetI_protein         
      0;    % HlyIIR_protein         
      0;    % LacI_protein      
      70;   % PhlF_protein      
      0;    % TetR_protein 
      0;    % YFP_protein
      2.0;  % topModel_AmtRpart_module_sub__pBAD      
      2.0;  % topModel_AmtRpart_module_sub__pHlyIIR
      2.0;  % topModel_BetIpart_module_sub__pHlyIIR
      2.0;  % topModel_BetIpart_module_sub__pTet
      2.0;  % topModel_HlyIIRpart_module_sub__pBAD
      2.0;  % topModel_HlyIIRpart_module_sub__pTet
      2.0;  % topModel_PhlFpart_module_sub__pAmtR
      2.0;  % topModel_PhlFpart_module_sub__pTac
      2.0;  % topModel_YFPpart_module_sub__pBetI
      2.0]; % topModel_YFPpart_module_sub__pPhlF

F = zeros(18,1);
F(8,1) = 1; %Target condition matrix (F^T*x_t=xp)

xp = [30]; %target state (F^T*x_t=xp) 30

tmax = 1000; %total simulation time


%% Original wSSA Parameters

%delta = 1;
alph = ones(15,1);
alph(13) = 1/delta;
alph(14) = 1/delta;
alph(15) = delta;

     
%% swSSA Parameters

%Mohammad help
