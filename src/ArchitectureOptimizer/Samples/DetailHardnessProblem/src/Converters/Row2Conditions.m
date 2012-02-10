function [conditions] = Row2Conditions(row, formatSettings)
%
% TODO : fix hardcoded indexes
%%%%%%%%%%%%%%%%%
    conditions = [];
    
    conditions.startTemperature = 950;
    conditions.haltTime = 30;
    
    conditions.phases = [];
    
    phaseSize = 3;
    phaseOffset = 1;
    for phaseIndex = 1 : formatSettings.stagesPerCondition
        
        tmpDuration = row(1, phaseOffset + 2);
        tmpAir      = row(1, phaseOffset + 0);
        tmpWater    = row(1, phaseOffset + 1);
        
        conditions.phases = ...
        [ ...
            conditions.phases, ...
            CreateDetailPhase(tmpDuration, tmpAir, tmpWater), ...
        ];

        phaseOffset = phaseOffset + phaseSize;
    end

    if (formatSettings.hasTemperature)
       temperatureOffset = phaseSize * formatSettings.stagesPerCondition + 1;
       conditions.startTemperature = row(1, temperatureOffset);
    end

return
end
