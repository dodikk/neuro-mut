function ...
    [ result, ...
      endOfArchitecture ...
    ] = ...
ParseArchitecture ...
    ( rawData )
% PARSING CONNECTIONS MAP FORMAT
% %%%%%%%%%%%%%%%%%%%
rawDataSize = size(rawData, 2);
[result.connections, inputsOffset] = ParseMatrix(rawData);

inputs = rawData(1, inputsOffset:rawDataSize);
[result.inputs, outputsOffset] = ParseMatrix(inputs);
result.inputs = result.inputs';
result.inputs = result.inputs + ones(size(result.inputs));


outputsOffset = outputsOffset + inputsOffset - 1; 

outputs = rawData(1, outputsOffset:rawDataSize);
[result.outputs, endOfArchitecture] = ParseMatrix(outputs);
result.outputs = result.outputs';
result.outputs = result.outputs + ones(size(result.outputs));

endOfArchitecture = outputsOffset + endOfArchitecture - 1;

return
end
