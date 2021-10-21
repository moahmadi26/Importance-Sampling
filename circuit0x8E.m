%% Model Details
% Circuit0x8E
%%%%%%%%%%%%%%%%%%%%%


 
% Species: pBad, pHlyllR, AmtR, AraC, AraAraC, aTc, aTcTetR, BetI, HIyIIR, IPTG, IPTGLacI,
% LacI, PhIF, TetR, YFP, pTet, pAmtR, pTac, pBetI, pPhIf, Ara

S = [0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % AmtR_protein_interaction_0
     0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % AmtR_protein_interaction_1
     0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % BetI_protein_interaction_0
     0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % BetI_protein_interaction_1
     0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % HlyllR_protein_interaction_0
     0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % HlyllR_protein_interaction_1
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0; % PhIF_protein_interaction_0
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0; % PhIF_protein_interaction_1
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0; % YFP_protein_interaction_0
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0; % YFP_protein_interaction_1
     0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % AmtR_degradation_interaction
     0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % Ara_AraC_protein_degradation_interaction
     0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % AraC_protein_degradation_interaction
     0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % aTc_TetR_protein_degradation_interaction
     0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % BetI_degradation_interaction
     0, 0, 0, -2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2; % Complex_Ara_AraC_protein
     0, 0, 0, 0, 0, -2, 1, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0; % Complex_aTc_TetR_protein
     0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 1, -2, 0, 0, 0, 0, 0, 0, 0, 0, 0; % Complex_IPTG_LacI_protein
     0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % HlyllR_degradation_interaction
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % IPTG_LacI_protein_degradation_interaction
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0; % LacI_degradation_interaction
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0; % PhIF_degradation_interaction
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0; % TetR_degradation_interaction
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0]'; % FRP_degradation_interaction

%Initial state
X0 = [2.0;  % pBad      
      2.0;  % pHlyllR    
      70;   % AmtR        
      0;    % AraC         
      0;    % AraAraC     
      0;    % aTc      
      0;    % aTcTetR  
      70;   % BetI     
      0;    % HIyIIR    
      60;   % IPTG    
      0;    % IPTGLacI  
      0;    % LacI    
      70;   % PhIF 
      0;    % TetR 
      0;    % YFP  
      2.0;  % pTet  
      2.0;  % pAmtR  
      2.0;  % pTac 
      2.0;  % pBetI 
      2.0   % pPhIf 
      0];   % Ara  

F = zeros(20,1);
F(15,1) = 1; %Target condition matrix (F^T*x_t=xp)

xp = [29]; %target state (F^T*x_t=xp)

tmax = 10; %total simulation time


%% Original wSSA Parameters

delta = 2;
alph = [delta;
         1/delta];
     
%% swSSA Parameters

%Mohammad help
