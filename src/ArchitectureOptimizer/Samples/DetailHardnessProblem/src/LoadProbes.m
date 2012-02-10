function [ result ] = LoadProbes(fileName, formatSettings)
%
%
%%%%%%%%%%%%%%%%%%%%%%


    rawData = dlmread(fileName, formatSettings.delimiter);    
    result = ParseProbes(rawData, formatSettings);
    

return
end






