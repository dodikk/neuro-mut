function                    ...
    [result] =              ...
RawNetworkToMatlabFormat(   ...
    architecture,           ...
    biasInfo,               ...
    inputRangesLow,         ...
    inputRangesUp           ...
)
% Converts network from the adjacency matrix to the matlab format.
%
%
% One vertex is one layer.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


result = ConstructNetwork(architecture, biasInfo);

result = ConfigureLearningAlgorithm(result);
result = ConfigureLayers(result, architecture.functions);
result = SetInputRanges(result, inputRangesLow, inputRangesUp);

result = SetupLayerWeightsStructures(result);


result = init(result);
result = FreezeInputWeights(result);

return %result
end


