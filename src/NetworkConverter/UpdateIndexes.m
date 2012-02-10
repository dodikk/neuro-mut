function [result] = UpdateIndexes(arrIndexes, tSortInfo)
%
%
%%%%%%%%%%%%%%%%%%%%%%

dataSize = size(arrIndexes, 2);
indexMap = tSortInfo(2, :);

result = zeros(1, dataSize);

for index = 1 : dataSize
   newIndex = find(indexMap == arrIndexes(1, index));
   result(1, index) =  newIndex;
end


return
end
