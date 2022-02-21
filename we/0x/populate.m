function bin_return = populate(bin_arg, size_arg)
%POPULATE Populate a bin until its size reaches size_arg
%copying each trarjectory halves its weight and adds one trajectory to the bin

    %disp(bin_arg);
    sz = bin_size(bin_arg);
    while sz < size_arg
        weights = zeros(1,sz);
        for i=1:sz
            weights(i) = bin_arg.traj_list(i).weight;
        end
        r = sum(weights) * rand(1,1);
        temp = 0;
        for i=1:sz
            temp = temp + weights(i); 
            if temp>=r
                selected_trajectory = i;
                break
            end
        end
       
        temp_weight = bin_arg.traj_list(selected_trajectory).weight; 
        temp_weight = temp_weight/2.0;
        bin_arg.traj_list(selected_trajectory).weight = temp_weight;
        time_ = bin_arg.traj_list(selected_trajectory).time;
        bin_ = bin_arg.traj_list(selected_trajectory).bin;
        x_ = bin_arg.traj_list(selected_trajectory).x;
        traj = trajectory(time_,bin_,temp_weight,x_);
        bin_arg.traj_list(end+1) = traj;  
        
        sz = bin_size(bin_arg);
    end
    bin_return = bin_arg;
%{
    sz = bin_size(bin_arg);
    weights = zeros(1,sz);
    for i=1:sz
        weights(i) = bin_arg.traj_list(i).weight;
    end
    
    n = size_arg-sz;
    
    r = sum(weights) * rand(n,1);
    
    selected_trajectories = zeros(1,n);
    
    count = 0;
    while count ~= n
        temp = 0;
        for ii = 1:sz
            temp = temp + weights(ii);
            if temp>= r(n)
                selected_trajectories(end+1) = ii;
                count = count+1;
                break
            end
        end
    end

    % MAYBE THIS SELECTION IS NOT BEST POSSIBLE!
    sz = size(selected_trajectories,2);
    for i=1:sz
        temp_weight = bin_arg(selected_trajectories(i)).weight; 
        temp_weight = temp_weight/2.0;
        bin_arg(selected_trajectories(i)).weight = temp_weight;
        time_ = bin_arg(selected_trajectories(i)).time;
        bin_ = bin_arg(selected_trajectories(i)).bin;
        x_ = bin_arg(selected_trajectories(i)).x;
        traj = trajectory(time_,bin_,temp_weight,x_);


    end
%}
end

