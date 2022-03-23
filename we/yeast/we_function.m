function [p, t_end, v] = we_function(bin_pop_)
    t_start = tic;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Simulation pararmeters
    N = 5;
    time_step = 0.125;
    bin_pop = bin_pop_;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Model specific binning
    
    % Success bin. Trajectories in success bin are not simulated further. 
    % weight of those trajectories are used to calculate the mean and variance 
    % of estimate
    success_bin = 51; 
    
    
    % Normal bin. Population for normal bins is set to be bin_pop. % Main part 
    % of weighted ensemble. 
    
    % For Yeast Polarization, bins 1 to 50 represent G_bg having the
    % population 0 to 49 and bin 51 represents G_bg having the population 50
    
    for i = 1:51
        bin_obj(i) = bin(i);
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    yeastPolarization;
    
    succ_weights = zeros(1, N);
    num_succ = 0;
    
    for i = 1:N
        
        i
    
        sum_succ_weights = 0; 
    
        for ii = 1:51
            bin_obj(ii) = bin(ii);
        end
        
        % Populate the bin containing initial state to bin_pop.
        % This is bin(1) which represents G_bg=0
        for ii = 1:bin_pop
            bin_obj(1).traj_list(ii) = trajectory(0, 1, (1.0/bin_pop), X0);
        end
        
        flag = false;
    
        while (~flag)
            
            % simulate all the trajectories in bins 1:49 for
            % 'time_step' units of time. If all the trajectories are simulated
            % beyond tmax, end the simulation.
            flag = true;
            for ii = 1:50
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
                        if curr_x(6) <= 49
                            bin_obj(ii).traj_list(iii).bin = curr_x(6)+1;
                        else 
                            bin_obj(ii).traj_list(iii).bin = 51;
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
            
            for ii = 1:50
                sz = bin_size(bin_obj(ii));
                if sz>0
                    for iii=1:sz
                        if bin_obj(ii).traj_list(iii).bin ~= ii
                            if bin_obj(ii).traj_list(iii).bin == 51
                                bin_obj(51).traj_list(end+1) = bin_obj(ii).traj_list(iii);
                            else 
                                bin_obj(bin_obj(ii).traj_list(iii).bin).traj_list(end+1) = bin_obj(ii).traj_list(iii);
                            end
                        end
                    end
                end
             end
            
    
            % check the trajectories in all bins and remove the ones that do
            % not belong
             for ii = 1:50
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
    
    
            
            for ii=1:50
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
    
        sz_51 = bin_size(bin_obj(51)); 
        if sz_51>0
            for ii=1:sz_51
                num_succ = num_succ + 1;
                sum_succ_weights = sum_succ_weights + bin_obj(51).traj_list(ii).weight;
            end
        end
        succ_weights(i) = sum_succ_weights;
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
           
       
    end
    
    
    
    
    t_end = toc(t_start);
    
    p = sum(succ_weights)/N;
    v = var(succ_weights);
    
    SE = (1/sqrt(N))*sqrt(v);
    zstar = 1.96;
    error = zstar*SE;
    %conf = [p-zstar*SE,p+zstar*SE]; %95% confidence interval
end
