function ...
    [ architecture, ...
      weights, ...
      biases, ...
      endOfNetwork ...
    ] = ...
ParseNetwork( rawData )
% FOR IMPORTING DATA FROM the PYrobot
% 
%%%%%%%%%%%%%%%%%%%%%%%

rawDataSize = size(rawData, 2);
[architecture, weightMatrixStart] = ParseArchitecture(rawData);


rawWeightMatrix = rawData(1, weightMatrixStart : rawDataSize);
rawWeightSize = size(rawWeightMatrix, 2);
[weights, biasIndexesStart] = ParseMatrix(rawWeightMatrix);

rawBiasIndexes =  rawWeightMatrix(1, biasIndexesStart : rawWeightSize);
rawBiasSize = size(rawBiasIndexes, 2);
[biasIndexes, biasValuesStart] = ParseMatrix(rawBiasIndexes);
biasIndexes = biasIndexes';
biasIndexes = biasIndexes + ones(size(biasIndexes));

rawBiasValues = rawBiasIndexes(1, biasValuesStart : rawBiasSize);
[biasValues, endOfNetwork] = ParseMatrix(rawBiasValues);
biasValues = biasValues';

biases.indexes = biasIndexes;
biases.low = biasValues;
biases.up = biasValues;

return
end
