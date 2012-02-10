function [] = DumpMatrix(msg, level)

config = NetworkOptimizerConfiguration();
logLimit = config.logLimit;

if (level <= logLimit)
  disp(msg); 
  FlushLogFile();
end


return
end
