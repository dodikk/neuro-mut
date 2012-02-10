function ...
    [ dataOut ...
    ] = ...
AddBiasInputs( ...
    data, ...
    biasRanges)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    dataSize = size(data.input, 2);
    dataOut.input = cell(1, dataSize);
    dataOut.expected = data.expected;
    
    biasCount = size(biasRanges.indexes, 2);
    increment = ones(1, biasCount);
    
    
    for itemIndex = 1 : dataSize
        item = data.input{itemIndex};
        nItem = [item increment];
        dataOut.input{itemIndex} = nItem;
    end

return
end
