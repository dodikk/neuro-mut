function [ result ] = ParseProbes(rawData, formatSettings)

    result = {};
    [rowCount, colCount] = size(rawData);
    
    currentRow = 1;
    while (currentRow <= rowCount)
        rawProbeEndRow = currentRow + formatSettings.cutsPerProbe - 1;
        rawProbe = rawData(currentRow:rawProbeEndRow, 1:end);
        probe = ParseProbe(rawProbe);
        
        result = cat(2, result, {probe});
        
        currentRow = rawProbeEndRow + 1;
        
    end %%while

return
end

