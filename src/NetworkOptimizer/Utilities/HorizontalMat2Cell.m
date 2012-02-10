function [ result ] = HorizontalMat2Cell( mData )

    dataSize = size(mData, 1);
    result = cell(1, dataSize);
    
    for index = 1 : dataSize
        result{index} = mData(index, :);
    end

return
end
