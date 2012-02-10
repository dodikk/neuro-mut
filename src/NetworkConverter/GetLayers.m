function [result] = GetLayers(tSortInfo)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%

vertexCount = size(tSortInfo, 2);
if (0 == vertexCount)
    return;
end


layersCount = GetLayersCount(tSortInfo);
result = zeros(2, layersCount);


counter = 1;
layer = 1;
previousWeight = tSortInfo(1, 1);
for vertexIndex = 2 : vertexCount
    vertexWeight = tSortInfo(1, vertexIndex);
    
    if (vertexWeight < previousWeight)
        result(1, layer) = previousWeight;
        result(2, layer) = counter;
        
        
        previousWeight = vertexWeight;
        layer = layer + 1;
        counter = 1;
    elseif (vertexWeight == previousWeight)
       counter = counter + 1;
    else
        error('Wrong sort info passed');
    end
end


    result(1, layersCount) = previousWeight;
    result(2, layersCount) = counter;

return
end

