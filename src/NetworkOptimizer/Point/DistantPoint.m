function [result] = DistantPoint(localMaximumList)
% Creates a point, distant from all previous in the weight matrix space
%%%%%%%%%%%%%%%%%%%%%

    config = NetworkOptimizerConfiguration();
    smallDimensionsLimit = config.smallDimensionsLimit;

    if ( SpaceIsLarge(smallDimensionsLimit) )
      result = LargeSpaceStrategy(localMaximumList);
    else
      result = SmallSpaceStrategy(localMaximumList);
    end
    
return
end
%%%%%%%%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result] = SpaceIsLarge(localMaximumList)
    
    config = NetworkOptimizerConfiguration();
    smallDimensionsLimit = config.smallDimensionsLimit;
    
    
    [pointRows, pointCols] = size(localMaximumList(1));
        
    if (pointRows + pointCols < smallDimensionsLimit)
       result = false;
    else
       result = true;
    end
    
return
end
%%%%%%%%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result] = LargeSpaceStrategy(localMaximumList)
    low = localMaximumList(1).weights;
    up = localMaximumList(2).weights;
    
    result = RandomPoint(pointRows, low, up);
return
end
%%%%%%%%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result] = SmallSpaceStrategy(localMaximumList)
 
    item = localMaximumList(1);
    item = item{1}; %%Unwrap from cell;
    
    [pointRows, pointCols] = size(item.weights);
    result = ZeroPoint(pointRows);

    for row = 1 : pointRows
        for col = 1 : pointCols
            [low, up] = FindLargestInterval(row, col, localMaximumList);
            result.weights(row, col) = RandomValue(low, up);
        end
    end
    
return
end
%%%%%%%%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
