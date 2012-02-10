function [result, localOptimizer, vtError] = FindGlobalMaximum(func)

% class function
% {
%     architecture, ...
%     data, ...
%     lowBorder, ...
%     upBorder
% } func;

    config = NetworkOptimizerConfiguration();
    precision = config.loaclOptimizePrecision;
    DO_LOGGING = config.doLogging;
Trace('FindGlobalMaximum started...', 0);
    time = InitializeTimer();
    vtError = [];
    
    netSize = GetNetSize(func.architecture);
    startPoint = CreateStartPoint(...
        netSize, ...
        func.lowBorder.weights, ...
        func.upBorder.weights);
        
    localOptimizer = CreateLocalOptimizer(func, startPoint);
    localOptimizer = FindLocalMaximum(localOptimizer);

    vtError = [vtError localOptimizer.vtError];
    result = localOptimizer.currentPoint;
    
    localMaximumList = ...
    {...
        localOptimizer.func.lowBorder, ...
        localOptimizer.func.upBorder , ...
        result                         ...
    };

    while ( CheckTimeLimit(time) && ...
            (result.error >= precision) ...
          )
        
    	currentPoint = DistantPoint(localMaximumList);
        
        localOptimizer = CreateLocalOptimizer(func, currentPoint);
        localOptimizer = FindLocalMaximum(localOptimizer);
        
        vtError = [vtError localOptimizer.vtError];
        localMaximum = localOptimizer.currentPoint;
        
        result = NetMax(localMaximum, result);
        
    	localMaximumList = [localMaximumList {localMaximum}];
        time = MeasureTime(time);
        
        if DO_LOGGING
            save 'Global_Result.mat' result vtError
        end
    end
    
Trace('FindGlobalMaximum ended...', 0);
return
end
