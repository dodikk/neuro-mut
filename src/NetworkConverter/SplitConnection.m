function ...
    [result, ...
     lastAddedVertexIndex] = ...
SplitConnection(...
    connections, ...
    fromIndex, ...
    toIndex)
%
%
%%%%%%%%%%%%%%%%%%%

[rowCount, colCount] = size(connections);


newItemCol = colCount + 1;
newItemRow = rowCount + 1;

result = zeros(newItemRow, newItemCol);
result(1:rowCount, 1:colCount) = connections;


result(fromIndex, toIndex) = 0;


lastAddedVertexIndex = newItemCol; %% == newItemRow
result(fromIndex, lastAddedVertexIndex) = 1;
result(lastAddedVertexIndex, toIndex) = 1;


return %%result
end

