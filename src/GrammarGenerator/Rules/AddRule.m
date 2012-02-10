function ...
    [ lSystemOut ...
    ] = ...
AddRule( ...
    lSystemIn, ...
    before, ...
    after)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%

rulesCount = size(lSystemIn.rules, 2);
newRuleIndex = rulesCount + 1;

lSystemOut = lSystemIn;
lSystemOut.rules(newRuleIndex).before = before;
lSystemOut.rules(newRuleIndex).after = after;


return
end
