function ...
    [ result ...
    ] = ...
GetSourceVariablesSeparate( ...
    lSystem )
%
%

sourceVars = GetSourceVariables(lSystem);
productionVars = GetProductionVariables(lSystem);

result = setdiff(sourceVars, productionVars);

return
end
