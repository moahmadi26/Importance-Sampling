classdef trajectory
   properties
      time {mustBeNumeric}
      bin {mustBeNumeric}
      weight {mustBeNumeric}
      x
   end
   methods
       function obj = trajectory(time_, bin_, weight_, x_)
         if nargin ~= 0
             obj.time = time_;
             obj.bin = bin_;
             obj.weight = weight_;
             obj.x = x_;
         end
      end
   end
end