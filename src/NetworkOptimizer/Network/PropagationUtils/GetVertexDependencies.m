function ...
    [ result ...
    ] = ...
GetVertexeDependencies(...
    candidate, ...
    architecture);
%%%%%%%%%%%%%5

    result = [];
    vertexCount = size(architecture.connections, 2);

    for index = 1 : vertexCount
        if ( architecture.connections(index, candidate) )
            result = [result index];
        end
    end

return
end
