function ...
    [ result ] = ...
LoadMatrix ...
    ( fileName )
%Loads the matrix from the text file
%%%%%%%%%%%%%%%%

    rawData = load(fileName);
    result = ParseMatrix(rawData);

return
end
