function [ result ] = LoadConditions(fileName, formatSettings)


    rawData = dlmread(fileName, formatSettings.delimiter);    
    result = ParseConditions(rawData, formatSettings);


return
end
