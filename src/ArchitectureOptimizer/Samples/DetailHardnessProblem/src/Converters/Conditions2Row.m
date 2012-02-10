function [result] = Conditions2Row(conditions)

    result = [];
    
    
    phaseCount = size(conditions.phases, 2);
    for phaseIndex = 1 : phaseCount 
        phase = conditions.phases(phaseIndex);
        
        rawPhase = Struct2Mat(phase);
        rawPhase = rawPhase';
        
        result = [result rawPhase];
    end
    

return
end

