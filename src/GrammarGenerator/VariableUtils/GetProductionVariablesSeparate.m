function ...
    [ result ...
    ] = ...
GetProductionVariablesSeparate( ...
    lSystem )
%
%

sourceVars = GetSourceVariables(lSystem);
productionVars = GetProductionVariables(lSystem);

result = setdiff(productionVars, sourceVars);

return
end
