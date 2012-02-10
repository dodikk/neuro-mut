function ...
    [low, ...
    up] = ...
FindLargestInterval(...
    row, ...
    col, ...
    localMaximumList)
%%%%%%%%%%%%%%%%

    low = inf;
    up = -inf;

    tmpPoints = GetDimension(row, col, localMaximumList);
    tmpPoints = unique(tmpPoints);

    distances = dist(tmpPoints);
    distances = FilterDistances(distances);

    if (~isempty(distances))    
        [distance, index] = max(distances);

        low = tmpPoints(index);
        up = tmpPoints(index + 1);
    elseif (~isempty(tmpPoints))
        low = tmpPoints(1);
        up  = tmpPoints(1);
    else
        low = 0;
        up  = 0;
    end
    
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ...
    [result] = ...
GetDimension(...
    row, ...
    col, ...
    localMaximumList)

    peaksCount = size(localMaximumList, 2);
    result = [];
    
    for iIndex = 1 : peaksCount
        peak = localMaximumList(iIndex);
        peak = peak{1}; %%Unwrap from cell
        
        item = peak.weights(row, col);
        result = [result item];
    end

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result] = FilterDistances(distances)

    [rows, cols] = size(distances);
    result = [];
    
    for iIndex = 1 : rows - 1
        item = distances(iIndex, iIndex + 1);
        result = [result item];
    end

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
