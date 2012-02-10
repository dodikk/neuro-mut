function [result] = AddFakeVertexes(net, tSortInfo)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vertexCount = size(net.connections, 1);
result = SortNetwork(net, tSortInfo);

layers = GetLayers(tSortInfo);

for x = 1 : vertexCount
    for y = 1 : vertexCount
        isAdjacent = ( 0 ~= net.connections(x, y) );        
        
        if (isAdjacent)
            xLayerIndex = GetLayerOfTheVertex(x, layers, tSortInfo);
            yLayerIndex = GetLayerOfTheVertex(y, layers, tSortInfo);
        
            distance = yLayerIndex - xLayerIndex;
            result.connections = ...
                InsertConnectionChain(...
                    result.connections, ...
                    x, ...
                    y, ...
                    distance);

            %% TODO : add vertexes.
        end
    end
end
    

return
end
