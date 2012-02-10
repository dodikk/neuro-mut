function [] = CreateConfiguration()

    result.localOptimizeVectorScale = 1;
    result.loaclOptimizePrecision = 0.005;
    
    %% step params
    result.loaclOptimizeMaxStep = 10^10;
    result.loaclOptimizeMinStep = 0.05;
    result.loaclOptimizeStepGrowthFactor = 2;
    result.loaclOptimizeInitialStep = -1;
    
    
    %% Iteration limits.
    result.timeLimit = 1;
    result.localMaximumTriesLimit = 100;     %% deprecated.
    result.findBestStepMaxTriesCount = 10^2; %% deprecated.
    
    %%Multistart randomization params
    result.smallDimensionsLimit = 100;
    
    
    %%logging params
    result.logLimit = 5;
    result.traceLimit = 5;
    
    result.doLogging = false;

    result.doPainting = false;
    result.paintDelay = 3; %%seconds


    SaveNetworkOptimizerConfiguration(result);
return
end
