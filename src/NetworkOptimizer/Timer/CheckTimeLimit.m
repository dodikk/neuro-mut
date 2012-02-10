function [result] = CheckTimeLimit(time)

    config = NetworkOptimizerConfiguration();    
    timeLimit = config.timeLimit;    
    
    msg = sprintf('Global maximum search iteration #%i of #%i', time, timeLimit);
    Trace(msg, 1);
    
    result = (time < timeLimit);
return
end
