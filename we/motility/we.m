t_start = tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation pararmeters
N = 50;
time_step = 1;
bin_pop = 100;
samples = (0);
samples(end) = [];
sim_samples = (0);
sim_samples(end) = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model specific binning

% Success bin. Trajectories in success bin are not simulated further. 
% weight of those trajectories are used to calculate the mean and variance 
% of estimate
success_bin = 20; 

% ss bin. representing the rest of the state space not as precisely probed. 
ss_bin = 9; 

% Normal bin. Population for normal bins is set to be bin_pop. % Main part 
% of weighted ensemble. 

% For motilReg CodY>=20 is success, CodY<=9 represents rest of state space
% and 10=<CodY<=19 represents notmal bins

for i = 1:20
    bin_obj(i) = bin(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


motilReg;

num_succ = 0;
success_weights = [];

sum_succ_weights = 0; 

for i = 1:N
    i

    

    for ii = 1:20
        bin_obj(ii) = bin(ii);
    end
    
    % Populate the bin containing initial state to bin_pop
    for ii = 1:bin_pop
        bin_obj(10).traj_list(ii) = trajectory(0, 10, (1.0/bin_pop), X0);
    end
    
    flag = false;

    while (~flag)
        
        % simulate all the trajectories in bins 9:19 for
        % 'time_step' units of time. If all the trajectories are simulated
        % beyond tmax, end the simulation.
        flag = true;
        for ii = 9:19
            sz = bin_size(bin_obj(ii));
            if sz > 0
                for iii=1:sz
                    curr_time = bin_obj(ii).traj_list(iii).time; 
                    curr_x = bin_obj(ii).traj_list(iii).x;
                    if curr_time < tmax
                        flag = false;
                        while (curr_time - bin_obj(ii).traj_list(iii).time) < time_step
                            a = calculatePropensity(curr_x,k,S_in);
                            a0 = sum(a);
                            r1 = rand;
                            r2 = rand;
                            tau = -(1.0/a0) * log(r1);
               
                            temp_sum = 0;
                            mu = 1;
                            while temp_sum <= r2*a0
                                temp_sum = temp_sum + a(mu);
                                mu = mu + 1;
                            end
                            mu = mu - 1;
               
                            curr_time = curr_time + tau;
                            curr_x = curr_x + S(:,mu);
                        end
                    end
                    bin_obj(ii).traj_list(iii).x = curr_x;
                    bin_obj(ii).traj_list(iii).time = curr_time;
                    if (10<=curr_x(2)) && (curr_x(2) <= 19)
                        bin_obj(ii).traj_list(iii).bin = curr_x(2);
                    elseif curr_x(2) <=9
                        bin_obj(ii).traj_list(iii).bin = 9;
                    else
                        bin_obj(ii).traj_list(iii).bin = 20;
                    end
                end
            end
        end
        
        % If all the trajectories in all bins (except for the success bin)
        % are simulated beyond tmax, end the simulation
        if flag
            break
        end

        % check all the trajectories in all bins and add them
        % to appropriate bins
        
        for ii = 9:19
            sz = bin_size(bin_obj(ii));
            if sz>0
                for iii=1:sz
                    if bin_obj(ii).traj_list(iii).bin ~= ii
                        if bin_obj(ii).traj_list(iii).bin == 20
                            bin_obj(20).traj_list(end+1) = bin_obj(ii).traj_list(iii);
                        elseif bin_obj(ii).traj_list(iii).bin >= 10
                            bin_obj(bin_obj(ii).traj_list(iii).bin).traj_list(end+1) = bin_obj(ii).traj_list(iii);
                        elseif bin_obj(ii).traj_list(iii).bin == 9
                            bin_obj(9).traj_list(end+1) = bin_obj(ii).traj_list(iii);
                        else 
                            disp('Error!!!!!!!!!!!!!!!!')
                        end
                    end
                end
            end
         end
        

        % check the trajectories in all bins and remove the ones that do
        % not belong
         for ii = 9:19
            flag_ = true;
            while (flag_)
                flag_ = false;
                sz = bin_size(bin_obj(ii));
                if sz > 0
                    for iii=1:sz
                        if bin_obj(ii).traj_list(iii).bin ~= ii
                            bin_obj(ii).traj_list(iii) = [];
                            flag_ = true;
                            break
                        end
                    end
                end
            end
         end


        
        for ii=9:19
            sz = bin_size(bin_obj(ii));
            if sz > 0
                if sz < bin_pop
                    bin_obj(ii) = populate(bin_obj(ii), bin_pop);
                elseif sz > bin_pop
                    bin_obj(ii) = merge(bin_obj(ii), bin_pop);
                end
            end
        end
            
         %disp('hi');
  
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% After each iteration is done, save how many trajectories have
% succeed/failed and what is the sum of weight for those

    sz_20 = bin_size(bin_obj(20)); 
    if sz_20>0
        for ii=1:sz_20
            num_succ = num_succ + 1;
            sum_succ_weights = sum_succ_weights + bin_obj(20).traj_list(ii).weight;
            samples(end+1) = bin_obj(20).traj_list(ii).weight;
        end
    end
    success_weights(end+1) = sum_succ_weights;
%{
    for ii=26:51
        sz = bin_size(bin_obj(ii)); 
        for iii=1:sz
            num_fail = num_fail + 1;
            sum_fail_weights = sum_fail_weights + bin_obj(ii).traj_list(iii).weight;
            samples(end+1) = 0.0;
        end
    end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    sim_samples(end+1) = sum(samples);
    samples = (0);
    samples(end) = [];
   
end




t_end = toc(t_start);

p = sum_succ_weights/N;
p1 = mean(sim_samples);
v = var(sim_samples);

%SE = (1/sqrt(N))*sqrt(var);
%zstar = 1.96;
%conf = [p-zstar*SE,p+zstar*SE]; %95% confidence interval
