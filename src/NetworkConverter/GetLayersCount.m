function [ result ] = GetLayersCount( tSortInfo )
%
%%%%%%%%%%%%%%%%%%

vertexCount = size(tSortInfo, 2);

if (0 == vertexCount)
    result = 0;
    return;
end

result = 1;

previousWeight = tSortInfo(1, 1);
for vertexIndex = 2 : vertexCount
    vertexWeight = tSortInfo(1, vertexIndex);
    
    if (vertexWeight < previousWeight)
        result = result + 1;
        previousWeight = vertexWeight;
    elseif (vertexWeight == previousWeight)
       continue;
    else
        error('Wrong sort info passed');
    end
end


return %%result
end
