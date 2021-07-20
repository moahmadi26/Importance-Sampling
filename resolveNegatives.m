function alphaOut = resolveNegatives(alphaIn, method)
    if method == "A"
        
        alphaIn = alphaIn + abs(min(alphaIn)) + 0.01;
        for it = 1:length(alphaIn)
           if (isnan(alphaIn(it))) | (alphaIn(it)<0)
               alphaIn(it) = 1;
           end
        end
        alphaOut = alphaIn;
        
    elseif method == "B"
        
        alphaIn = alphaIn./min(alphaIn);
        for it = 1:length(alphaIn)
           if isnan(alphaIn(it))
               alphaIn(it) = 1;
           end
        end
        alphaOut = alphaIn;
        
    elseif method == "C"
    
        for it = 1:length(alphaIn)
           if isnan(alphaIn(it))
               alphaIn(it) = 1;
           end
           
           if alphaIn(it)<0
               alphaIn(it) = 1;
           end   
        end
        alphaOut = alphaIn;
        
    end
end