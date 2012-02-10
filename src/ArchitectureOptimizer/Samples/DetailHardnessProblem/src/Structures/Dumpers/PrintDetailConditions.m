function [] = PrintDetailConditions(conditions)

    disp('----------------------------------');
    disp('Conditions : ');
    msgTemperature = sprintf('_ _ Start temperature : %f', conditions.startTemperature);
    msgHaltTime    = sprintf('_ _ Halt time         : %f', conditions.haltTime        );
    
    disp(msgTemperature);
    disp(msgHaltTime   );
    
    
    disp('_ _ Phases :');
    phasesCount = size(conditions.phases, 2);
    for phaseIndex = 1 : phasesCount
       msgPhase = sprintf('_ _ _ _ Phase %i', phaseIndex); 
       disp('_');
       disp(msgPhase);
       
       PrintDetailPhase(conditions.phases(phaseIndex));
    end

    disp('----------------------------------');
    
return
end
