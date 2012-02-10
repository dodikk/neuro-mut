function ...
    [ result ] = ...
RandomPoint( ...
    dimensionsCount, ...
    low, ...
    up)
% Point is a weight matrix and error.
%%%%%%%%%%%%%%%

    
    result.weights = zeros(dimensionsCount, dimensionsCount);
    
    for row = 1 : dimensionsCount
        for col = 1 : dimensionsCount
            result.weights(...
                      row, ...
                      col) = ...
            RandomValue(...
                low(row, col), ...
                up(row, col) );
        end
    end
    
    result.error = inf;
return
end