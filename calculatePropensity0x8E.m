function h = calculatePropensity0x8E(X)

% Define k module:
ka = 0.25;       % Activated production rate
ka_f = 0.0033;   % Forward activation binding rate
ka_r = 1.0;      % Reverse activation binding rate
kao_f = 1.0;     % Forward activated RNAP binding rate
kao_r = 1.0;     % Reverse activated RNAP binding rate
kb = 1.0E-4;     % Basal production rate
ko = 0.05;       % Open complex production rate
ko_f = 0.033;    % Forward RNAP binding rate
ko_r = 1.0;      % Reverse RNAP binding rate
kr_f = 0.5;      % Forward repression binding rate
kr_r = 1.0;      % Reverse repression binding rate
nc = 2.0;        % Stoichiometry of binding
ng = 2.0;        % Initial promoter count
np = 10.0;       % Stoichiometry of production
nr = 30.0;       % Initial RNAP count

% Define k topmodel:
kc_f = 0.05;    % Forward complex formation rate 
kc_r = 1.0;     % Reverse complex formation rate
kd = 0.0075;    % Degradation rate 


% Reaction Propensities
h(1,1) = X(1)*(kb*ko_f/ko_r*nr+ka*kao_f/kao_r*nr*(ka_f/ka_r*X(5))^nc)/(1+ko_f/ko_r*nr+kao_f/kao_r*nr*(ka_f/ka_r*X(5))^nc);  % AmtR_protein_interaction_0
h(2,1) = X(2)*ko*ko_f/ko_r*nr/(1+ko_f/ko_r*nr+(kr_f/kr_r*X(9))^nc);                                                         % AmtR_protein_interaction_1
h(3,1) = X(2)*ko*ko_f/ko_r*nr/(1+ko_f/ko_r*nr+(kr_f/kr_r*X(9))^nc);                                                         % BetI_protein_interaction_0
h(4,1) = X(16)*ko*ko_f/ko_r*nr/(1+ko_f/ko_r*nr+(kr_f/kr_r*X(14))^nc);                                                       % BetI_protein_interaction_1
h(5,1) = X(16)*(kb*ko_f/ko_r*nr+ka*kao_f/kao_r*nr*(ka_f/ka_r*X(5))^nc)/(1+ko_f/ko_r*nr+kao_f/kao_r*nr*(ka_f/ka_r*X(5))^nc); % HlyllR_protein_interaction_0
h(6,1) = X(1)*ko*ko_f/ko_r*nr/(1+ko_f/ko_r*nr+(kr_f/kr_r*X(14))^nc);                                                        % HlyllR_protein_interaction_1
h(7,1) = X(18)*ko*ko_f/ko_r*nr/(1+ko_f/ko_r*nr+(kr_f/kr_r*X(12))^nc);                                                       % PhIF_protein_interaction_0
h(8,1) = X(17)*ko*ko_f/ko_r*nr/(1+ko_f/ko_r*nr+(kr_f/kr_r*X(3))^nc);                                                        % PhIF_protein_interaction_1
h(9,1) = X(20)*ko*ko_f/ko_r*nr/(1+ko_f/ko_r*nr+(kr_f/kr_r*X(13))^nc);                                                       % YFP_protein_interaction_0
h(10,1) = X(19)*ko*ko_f/ko_r*nr/(1+ko_f/ko_r*nr+(kr_f/kr_r*X(8))^nc);                                                       % YFP_protein_interaction_1
h(11,1) = kd*X(3);                                                                                                          % AmtR_degradation_interaction
h(12,1) = kd*X(5);                                                                                                          % Ara_AraC_protein_degradation_interaction
h(13,1) = kd*X(4);                                                                                                          % AraC_protein_degradation_interaction
h(14,1) = kd*X(7);                                                                                                          % aTc_TetR_protein_degradation_interaction
h(15,1) = kd*X(8);                                                                                                          % BetI_degradation_interaction
h(16,1) = kc_f*X(4)^nc*X(21)^nc-kc_r*X(5);                                                                                  % Complex_Ara_AraC_protein
h(17,1) = kc_f*X(14)^nc*X(6)^nc-kc_r*X(7);                                                                                  % Complex_aTc_TetR_protein
h(18,1) = kc_f*X(10)^nc*X(12)^nc-kc_r*X(11);                                                                                % Complex_IPTG_LacI_protein
h(19,1) = kd*X(9);                                                                                                          % HlyllR_degradation_interaction
h(20,1) = kd*X(11);                                                                                                         % IPTG_LacI_protein_degradation_interaction
h(21,1) = kd*X(12);                                                                                                         % LacI_degradation_interaction
h(22,1) = kd*X(13);                                                                                                         % PhIF_degradation_interaction
h(23,1) = kd*X(14);                                                                                                         % TetR_degradation_interaction
h(24,1) = kd*X(15);                                                                                                         % FRP_degradation_interaction

end