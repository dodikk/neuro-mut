function [lSystemOut] = ExpandVertexToCascade(lSystemIn)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
GRAMMAR = Grammar();
lSystemOut = lSystemIn;

cellVertexName = GetVertexToExpand(lSystemIn);
vertexName = cellVertexName{1};

cascadeBaseName = GetUniqueName();
cascadeExpansionName = GetUniqueName();

[before, after] = CreateCascadeAxiomRule(vertexName, cascadeBaseName, cascadeExpansionName);
lSystemOut = AddRule(lSystemIn, before, after);

[before, after] = CreateCascadeRule(cascadeBaseName, cascadeExpansionName);
lSystemOut = AddRule(lSystemOut, before, after);

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ...
    [before, ...
    after] = ...
CreateCascadeAxiomRule(...
    vertexName, ...
    cascadeBaseName, ...
    cascadeExpansionName)

GRAMMAR = Grammar();
before = '';
after = '';

before = strcat(before, GRAMMAR.variableSeparator);
before = strcat(before, vertexName);

after = strcat(after, GRAMMAR.subgraphStart);
    after = strcat(after, GRAMMAR.subgraphStart);
        after = strcat(after, GRAMMAR.variableSeparator);
        after = strcat(after, cascadeBaseName);
        after = strcat(after, GRAMMAR.attributePredcessor);
        after = strcat(after, GRAMMAR.inOutAttribute);
    after = strcat(after, GRAMMAR.subgraphEnd);
    
    after = strcat(after, GRAMMAR.attributePredcessor);
    after = strcat(after, GRAMMAR.inAttribute);
    after = strcat(after, GRAMMAR.positive);
    after = strcat(after, '1');

    after = strcat(after, GRAMMAR.variableSeparator);
    after = strcat(after, cascadeExpansionName);
    after = strcat(after, GRAMMAR.attributePredcessor);
    after = strcat(after, GRAMMAR.outAttribute);
after = strcat(after, GRAMMAR.subgraphEnd);

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ...
    [before, ...
    after] = ...
CreateCascadeRule(...
    cascadeBaseName, ...
    cascadeExpansionName)

GRAMMAR = Grammar();
before = '';
after = '';

before = strcat(before, GRAMMAR.variableSeparator);
before = strcat(before, cascadeBaseName);
before = strcat(before, GRAMMAR.attributePredcessor);
before = strcat(before, GRAMMAR.inOutAttribute);



after = strcat(after, GRAMMAR.variableSeparator);
after = strcat(after, cascadeExpansionName);
after = strcat(after, GRAMMAR.attributePredcessor);
after = strcat(after, GRAMMAR.inOutAttribute);

after = strcat(after, GRAMMAR.positive);
after = strcat(after, '1');

after = strcat(after, GRAMMAR.subgraphStart);
    after = strcat(after, GRAMMAR.variableSeparator);
    after = strcat(after, cascadeBaseName);
    after = strcat(after, GRAMMAR.attributePredcessor);
    after = strcat(after, GRAMMAR.inOutAttribute);
after = strcat(after, GRAMMAR.subgraphEnd);
after = strcat(after, GRAMMAR.attributePredcessor);
after = strcat(after, GRAMMAR.inOutAttribute);

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ...
    [ vertexName ...
    ] = ...
GetVertexToExpand(lSystem)
    vertexName = GetRandomProductionVariable(lSystem);
return
end
