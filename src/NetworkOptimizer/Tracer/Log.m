function [] = Log(msg, level)

config = NetworkOptimizerConfiguration();
logLimit = config.logLimit;

if (level <= logLimit)
  formattedMsg = strcat(CreateSpacer(level), msg);
  disp(formattedMsg); 
  FlushLogFile();
end


return
end
