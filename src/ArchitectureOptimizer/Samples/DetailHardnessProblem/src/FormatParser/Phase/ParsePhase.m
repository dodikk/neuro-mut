function [phase] = ParsePhase(rawPhase)

    phase = [];
    
    phase.airPressure   = rawPhase(1, 1);
    phase.waterPressure = rawPhase(1, 2);
    phase.duration      = rawPhase(1, 3);

return
end
