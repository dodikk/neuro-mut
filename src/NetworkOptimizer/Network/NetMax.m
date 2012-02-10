function ...
    [ result ] = ...
NetMax(...
    weightsL, ...
    weightsR)
% Compares two weight matrices fitness
% Compares two weight matrices fitness on the same architecture
    
    if (weightsL.error < weightsR.error)
       result = weightsL;
    else 
       result = weightsR;
    end

return
end
