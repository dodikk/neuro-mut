function [] = PrintDetailPhase(phase)

    msgTime  = sprintf('Duration       : %f', phase.duration     );
    msgAir   = sprintf('Air pressure   : %f', phase.airPressure  );
    msgWater = sprintf('Water pressure : %f', phase.waterPressure);
    
    disp(msgTime );
    disp(msgAir  );
    disp(msgWater);

return
end
