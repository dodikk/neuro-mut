function ...
    [ result ...
    ] = ...
GetSourceVariables( lSystem )
%
%

result = [];
rules = lSystem.rules;
rulesCount = size(rules, 2);

for ruleIndex = 1 : rulesCount
  currVariables = GetVariables( rules(ruleIndex).before );
  result = [result currVariables];
end

currVariables = GetVariables( lSystem.axiom );
result = [result currVariables];

result = unique(result);
  
return
end
