function [ result, matrixEndOffset ] = ParseMatrix( rawData )
% IMPORTING MATRIX ONLY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ROW_COUNT_OFFSET = 1;
COL_COUNT_OFFSET = 2;
DATA_OFFSET      = 3;

[rdRows, rdCols] = size(rawData);

rowCount = rawData(ROW_COUNT_OFFSET);
colCount = rawData(COL_COUNT_OFFSET);

matrixSize = rowCount * colCount;

dataEnd = DATA_OFFSET + matrixSize - 1;
vect = rawData(1, DATA_OFFSET : dataEnd );

result = reshape(vect, rowCount, colCount);
result = result';
matrixEndOffset = dataEnd + 1;

return
end
