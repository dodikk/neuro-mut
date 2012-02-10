function [ sortedConnections ] = SortConnections(connections,  tSortInfo)
%
%
    vertexCount = size(connections, 1);
    rowsSortedMatrix = zeros(vertexCount, vertexCount);
    
    %%Sort rows
    for index = 1 : vertexCount
        oldIndex = tSortInfo(2, index);
        rowsSortedMatrix(index, :) = connections(oldIndex, :);
    end
    
    
    
    sortedConnections = zeros(vertexCount, vertexCount);
    %% Sort columns
    for index = 1 : vertexCount
        oldIndex = tSortInfo(2, index); 
        sortedConnections(:, index) = rowsSortedMatrix(:, oldIndex);
    end

return
end
