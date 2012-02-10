function [ result ] = FreezeInputWeights( net )
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

result = net;
numInputs = net.numInputs;

[iwRows, iwCols] = size(result.IW);
for inputIndex = 1 : numInputs
    for vertexIndex = 1 : iwRows
        cellSize = size(result.IW{vertexIndex, inputIndex});
        result.IW{vertexIndex, inputIndex} = ones(cellSize);
    end
    
    result.inputWeights{inputIndex}.learn = 0;
end


return
end
