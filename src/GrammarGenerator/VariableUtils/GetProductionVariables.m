function ...
    [ result...
    ] = ...
GetProductionVariables( ...
    lSystem )
%
%

result = [];
rules = lSystem.rules;
rulesCount = size(rules, 2);

for ruleIndex = 1 : rulesCount
  currVariables = GetVariables( rules(ruleIndex).after );
  result = [result currVariables];
end

result = unique(result);

return
end
