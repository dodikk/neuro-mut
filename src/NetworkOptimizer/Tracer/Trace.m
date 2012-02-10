function [] = Trace(msg, level)

config = NetworkOptimizerConfiguration();
traceLimit = config.traceLimit;

if (level <= traceLimit)
  formattedMsg = strcat(CreateSpacer(level), msg);
  disp(formattedMsg); 
  FlushLogFile();
end


return
end
