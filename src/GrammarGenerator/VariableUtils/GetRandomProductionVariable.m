function [ result ] = GetRandomProductionVariable(lSystem)
    prodVertexes = GetProductionVariables(lSystem);

    maxCount = size(prodVertexes, 2);
    index = RandomInteger(maxCount);
    
    result = prodVertexes(index);
return
end
