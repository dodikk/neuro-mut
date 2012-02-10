function [lSystemOut] = ExpandVertexToTree(lSystemIn)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
GRAMMAR = Grammar();

cellVertexName = GetVertexToExpand(lSystemIn);
vertexName = cellVertexName{1};
treeWidth = GetTreeWidth();
newName = GetUniqueName();

%root
after = GRAMMAR.subgraphStart;
after = strcat(after, GRAMMAR.variableSeparator);
after = strcat(after, newName);
after = strcat(after, GRAMMAR.attributePredcessor);
after = strcat(after, GRAMMAR.inAttribute);

%children connections
for index = 1 : treeWidth
    after = strcat(after, GRAMMAR.positive);
    strIndex = int2str(index);
    after = strcat(after, strIndex);
end

%children
for index = 1 : treeWidth
    after = strcat(after, GRAMMAR.variableSeparator);
    after = strcat(after, vertexName);
    after = strcat(after, GRAMMAR.attributePredcessor); 
    after = strcat(after, GRAMMAR.outAttribute);
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
function [result] = GetTreeWidth()    
    configuration = GrammarGeneratorConfiguration();
    result = RandomInteger(configuration.maxTreeLayerSize);
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
