classdef bin
   properties
      bin_num {mustBeNumeric}
      traj_list
   end
   methods
       function obj = bin(bin_num_)
         obj.bin_num = bin_num_;
         obj.traj_list = trajectory();
         obj.traj_list(1) = [];
       end
       function n = bin_size(obj)
           n = size(obj.traj_list, 2);
       end
   end
end