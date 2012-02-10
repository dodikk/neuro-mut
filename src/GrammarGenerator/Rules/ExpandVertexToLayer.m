function [lSystemOut] = ExpandVertexToLayer(lSystemIn)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
GRAMMAR = Grammar();

cellVertexName = GetVertexToExpand(lSystemIn);
vertexName = cellVertexName{1};
layerWidth = GetLayerWidth();

after = GRAMMAR.subgraphStart;
for index = 1 : layerWidth
    newName = GetUniqueName();
    after = strcat(after, GRAMMAR.variableSeparator);
    after = strcat(after, newName);
    after = strcat(after, GRAMMAR.attributePredcessor);
    after = strcat(after, GRAMMAR.inOutAttribute);
end
after = strcat(after, GRAMMAR.subgraphEnd);

before = strcat(GRAMMAR.variableSeparator, vertexName);
lSystemOut = AddRule(lSystemIn, before, after);

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ...
    [ vertexName ...
    ] = ...
GetVertexToExpand(lSystem)
    vertexName = GetRandomProductionVariable(lSystem);
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result] = GetLayerWidth()    
    configuration = GrammarGeneratorConfiguration();
    result = RandomInteger(configuration.maxLayerSize);
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
