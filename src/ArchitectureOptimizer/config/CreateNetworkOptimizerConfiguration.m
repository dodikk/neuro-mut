function [] = CreateNetworkOptimizerConfiguration()

    result.doLogging = false;
    result.timeLimit = 1;

    result.doPainting = true;
    result.paintDelay = 3; %%seconds
    
    result.localOptimizeVectorScale = 1;
    result.loaclOptimizeMinStepSize = 0.005;
    result.loaclOptimizeStepGrowthFactor = 2;
    result.localMaximumTriesLimit = 10^2;
    
    %% or any other problem specific value.
    result.findBestStepMaxTriesCount = 10^2; 
    result.smallDimensionsLimit = 100;
    
    result.logLimit = 5;
    result.traceLimit = 5;

    SaveNetworkOptimizerConfiguration(result);
return
end
