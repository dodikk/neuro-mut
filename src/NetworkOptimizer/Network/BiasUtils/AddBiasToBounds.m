function ...
    [ outLow, ...
    outUp] = ...
AddBiasToBounds( ...
    low, ...
    up, ...
    biases)
%
%%%%%%%%%%%%%%%%%%%%%%%%

    outLow = AddBiasToLowBound(low, biases);
    outUp  = AddBiasToUpBound(up, biases);

return
end
