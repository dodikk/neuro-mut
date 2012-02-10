function ...
    [ result ...
    ] = ...
LSystemRewriteN( axiom, rules, stepsCount)
%Performs L-System processing
%  Detailed explanation goes here
    result = axiom;

    for iIndex = 1 : stepsCount
        result = LSystemRewrite1(result, rules);
    end

end
