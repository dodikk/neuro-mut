function [row, col] = ParamIndexToMatrixCoordinates(localOptimizer, index)
%
%
%%%%%%%%%%%%%%%%%%%%%%

    conn    = localOptimizer.func.architecture.connections;
    netSize = GetNetSize(localOptimizer.func.architecture);
    
    tConn = conn';
    linearMatrixIndexes = find((tConn > 0) | (tConn < 0));
    
    lIndex = linearMatrixIndexes(index);
    
    row = ceil (lIndex / netSize); %%row = [lIndex / netSize]
    col = mod(lIndex, netSize);    %%col = {lIndex / netSize}
    if (0 == col)
        col = netSize;
    end

return
end


