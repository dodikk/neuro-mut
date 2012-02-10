function [result] = ParseConditions(rawData, formatSettings)

    result = [];
    [rowCount, colCount] = size(rawData);
    currentRow = 1;
    
    while (currentRow < rowCount)
        rawConditionEnd = currentRow + formatSettings.stagesPerCondition - 1;
        rawCondition = rawData(currentRow:rawConditionEnd, 1:end);
        
        condition = ParseCondition(rawCondition);
        result = [result condition];
        
        currentRow = rawConditionEnd + 1;
    end

return
end
