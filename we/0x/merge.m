function bin_return = merge(bin_arg, size_arg)
%MERGE select two trajectories in the bin and merge them until 
%size of the bin equals size_arg
%After merging two trajectories, one of the survives and the the other gets
%ist weight
%disp(bin_arg);
    sz = bin_size(bin_arg);
    while sz > size_arg
        weights = zeros(1,sz);
        for i=1:sz
            weights(i) = 1.0/(bin_arg.traj_list(i).weight);
        end
        
        r = sum(weights) * rand(1,1);
        temp = 0;
        for i=1:sz
            temp = temp + weights(i); 
            if temp>=r
                selected_trajectory_1 = i;
                weight_1 = weights(i);
                break
            end
        end
        
        weights(selected_trajectory_1) = [];
        
        r = sum(weights) * rand(1,1);
        temp = 0;
        sz=size(weights,2);

        for i=1:sz
            temp = temp + weights(i); 
            if temp>=r
                selected_trajectory_2 = i;
                weight_2 = weights(i);
                break
            end
        end

        if selected_trajectory_2>=selected_trajectory_1
            selected_trajectory_2 = selected_trajectory_2 + 1;
        end

        r = (weight_1 + weight_2) * rand(1,1);
        if r>weight_1
            alive_traj = selected_trajectory_2;
            dead_traj = selected_trajectory_1;
        else
            alive_traj = selected_trajectory_1;
            dead_traj = selected_trajectory_2;
        end
       
        temp_weight_1 = bin_arg.traj_list(alive_traj).weight;
        temp_weight_2 = bin_arg.traj_list(dead_traj).weight;
        weight_ = temp_weight_1 + temp_weight_2;
        bin_arg.traj_list(alive_traj).weight = weight_;
        bin_arg.traj_list(dead_traj) = [];  
        
        sz = bin_size(bin_arg);
    end
    bin_return = bin_arg;
end

