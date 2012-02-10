function ...
    [result, ...
     tSortInfo, ...
     endOfArchitecture ...
    ] ...
= ParseConnMapWithTSortInfo( rawData )
% TSortInfo goes after the connection map.
%%%% TSortInfo(1, :) - weights.
%%%% TSortInfo(2, :) - vertexIndexes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rawDataSize = size(rawData, 2);
[result, endOfConnectionsMap] = ParseArchitecture(rawData);

tSortInfoOffset = endOfConnectionsMap;
tSortInfoSize = rawData(1, tSortInfoOffset);


tSortItemSize = 2;
tSortInfo = zeros(tSortItemSize, tSortInfoSize);
beg = tSortInfoOffset + 1;
fin = beg + tSortInfoSize * tSortItemSize - 1;

if (fin > rawDataSize)
   error "index out of range";
end

MATLAB_ARRAY_START = 1;
for itemIndex = 1 : tSortInfoSize 
    dataIndex = beg + tSortItemSize * (itemIndex - 1);
    
    tSortInfo(1, itemIndex) = rawData(1, dataIndex);
    tSortInfo(2, itemIndex) = rawData(1, dataIndex + 1) + MATLAB_ARRAY_START; 
end

endOfArchitecture = fin + 1;

return
end
