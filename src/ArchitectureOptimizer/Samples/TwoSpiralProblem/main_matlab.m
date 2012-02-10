diary 'Spiral_GA_log.txt'

data = CreateTwoSpiralDataForMatlab();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
startPoint = '__cascade_start.xml';
%startPoint = 'start.xml';



settings = [];
settings.FAILURES_LIMIT    = 5;
settings.REWRITING_COUNT   = 20;
settings.NEURONS_LIMIT     = 40;
settings.LEARN_TRIES_COUNT =  3;
settings.ACCEPTABLE_ERROR  = 10^-4;
settings.MIN_ERROR_DIFF    = 10^-4;
settings.TRAINING_PERCENT  = 0.8;

settings.DO_LOGGING        = true;



[resultArchName  , ...
 net             , ...
 resultArch      , ...
 vtError] = M_OptimizeArchitecture( ...
					  startPoint  , ...
					  data        , ...
					  settings);

save('result.mat', 'resultArch');


save('net.mat', 'net')
PlotMatlabBackup('net.mat');					  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

diary off

