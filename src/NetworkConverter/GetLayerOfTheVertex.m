function [ result ] = GetLayerOfTheVertex(...
    vertexIndex, layers, tSortInfo )
%
% net must already be sorted.

    weight = tSortInfo(1, vertexIndex);
    
    lWeights = layers(1, :);
    result = find(lWeights == weight);


return
end
