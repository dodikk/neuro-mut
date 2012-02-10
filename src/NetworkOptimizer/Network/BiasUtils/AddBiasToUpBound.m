function [ outUp ] = AddBiasToUpBound( up, biasRanges )
%
%%%%%%%%%%%%%%%%%%%%%

    biasCount = size(biasRanges.indexes, 2);
    neuronsCount = size(up, 1);
    newSize = neuronsCount + biasCount;
    
    conn = zeros(newSize, newSize);
    
    conn(...
       1 : neuronsCount, ...
       1 : neuronsCount) = up;
   
    
    for biasIndex = 1 : biasCount
       itemIndex = biasRanges.indexes(biasIndex);
       conn(...
         neuronsCount + biasIndex, ...
         itemIndex) = ...
       biasRanges.up(biasIndex);
    end
    
    outUp = conn;

return
end
