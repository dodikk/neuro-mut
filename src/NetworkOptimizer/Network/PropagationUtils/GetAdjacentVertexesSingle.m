function ...
    [ result ...
    ] = ...
GetAdjacentVertexesSingle(...
    candidate, ...
    architecture);
%%%%%%%%%%%%%5

    result = [];
    vertexCount = size(architecture.connections, 2);

    for index = 1 : vertexCount
        if ( architecture.connections(candidate, index) )
            result = [result index];
        end
    end

return
end
