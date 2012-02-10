function [lSystemOut] = AddOpenLayer(lSystemIn)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
GRAMMAR = Grammar();

cellVertexName = GetVertexToExpand(lSystemIn);
vertexName = cellVertexName{1};

after = GRAMMAR.subgraphStart;
    newName = GetUniqueName();
    after = strcat(after, GRAMMAR.variableSeparator);
    after = strcat(after, newName);
    after = strcat(after, GRAMMAR.attributePredcessor);
    after = strcat(after, GRAMMAR.inOutAttribute);
    
    after = strcat(after, GRAMMAR.positive);
    after = strcat(after, '1');
    
    newName = GetUniqueName();
    after = strcat(after, GRAMMAR.variableSeparator);
    after = strcat(after, newName);
    after = strcat(after, GRAMMAR.attributePredcessor);
    after = strcat(after, GRAMMAR.inOutAttribute);
after = strcat(after, GRAMMAR.subgraphEnd);



before = strcat(GRAMMAR.variableSeparator, vertexName);



lSystemOut = AddRule(lSystemIn, before, after);


return
end




function [ vertexName ] = GetVertexToExpand(lSystem)
    vertexName = GetRandomProductionVariable(lSystem);
return
end


