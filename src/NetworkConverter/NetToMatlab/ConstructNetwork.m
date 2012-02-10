function ...
    [result] = ...
ConstructNetwork(...
    architecture,           ...
    biasInfo                ...
)
%
%
%%%%%%%%%%%%%%%%%%%%%%%


numInputs = size(architecture.inputs, 2);
numOutputs = size(architecture.outputs, 2);



vertexCount = size(architecture.connections, 1); 
% == size(architecture.connections, 2)
numLayers = vertexCount;




biasConnect = zeros(numLayers, 1);
biasConnect(biasInfo.indexes, 1) = 1;



inputConnect = zeros(numLayers, numInputs);
for inputIndex = 1 : numInputs
    vertexIndex = architecture.inputs(inputIndex);
    inputConnect(vertexIndex, inputIndex) = 1;
end


%% Transpone the connection matrix 
%% due to the matlab architecture.
layerConnect = architecture.connections';


outputConnect = zeros(1, numLayers);
outputConnect(1, architecture.outputs) = 1;


result = network(    ...
    numInputs,       ...
    numLayers,       ...
    biasConnect,     ...
    inputConnect,    ...
    layerConnect,    ...
    outputConnect,   ...
    outputConnect    ...
);



return
end
