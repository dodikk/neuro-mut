function [ outLow ] = AddBiasToLowBound( low, biasRanges )
%
%%%%%%%%%%%%%%%%%%%%%

    biasCount = size(biasRanges.indexes, 2);
    neuronsCount = size(low, 1);
    newSize = neuronsCount + biasCount;
    
    conn = zeros(newSize, newSize);
    
    conn(...
       1 : neuronsCount, ...
       1 : neuronsCount) = low;
   
    
    for biasIndex = 1 : biasCount
       itemIndex = biasRanges.indexes(biasIndex);
       conn(...
         neuronsCount + biasIndex, ...
         itemIndex) = ...
       biasRanges.low(biasIndex);
    end
    
    outLow = conn;

return
end
