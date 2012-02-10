function [condition] = ParseCondition(rawCondition)


    [rowCount, colCount] = size(rawCondition);
    
    %% TODO : fix the stub
    condition.startTemperature = 950;
    condition.haltTime = 30;
    condition.phases = [];
    
    for phaseIndex = 1 : rowCount
        rawPhase = rawCondition(phaseIndex, 1:end);
        phase = ParsePhase(rawPhase);
        
        condition.phases = [condition.phases phase];
    end

return
end

