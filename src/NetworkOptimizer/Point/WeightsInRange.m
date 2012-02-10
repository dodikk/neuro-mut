function [ result ] = WeightsInRange( weights, lowBorder, upBorder )
%
%
%%%%%%%%%%%%%%%%%%%%5

    [rowCount, colCount] = size(weights);

    result = true;
    
    for row = 1 : rowCount
        for col = 1 : colCount
            if (~WeightInRange(row, col, weights, lowBorder, upBorder))
                result = false;
                return;
            end
        end
    end

return
end


