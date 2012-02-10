function [updatedLocalOptimizer] = FindLocalMaximum(localOptimizer)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    config = NetworkOptimizerConfiguration();
    precision = config.loaclOptimizePrecision;
    TRESH_HOLD  = config.loaclOptimizeMinStep;
    triesLimit = config.localMaximumTriesLimit;
    
    DO_LOGGING = config.doLogging;
    
Trace('FindLocalMaximum started...', 1);
    updatedLocalOptimizer = localOptimizer;

    netSize = GetNetSize(updatedLocalOptimizer.func.architecture);
	
    triesCounter = 0;
	while ( (abs(updatedLocalOptimizer.vr) >= TRESH_HOLD) ...
         && (abs(updatedLocalOptimizer.currentPoint.error) >= precision) ...
         && (triesCounter < triesLimit) ...
          )
        triesCounter = triesCounter + 1;
        
%%%%%%%%%%%        
        if (DO_LOGGING)
            save 'CurrentWeights.mat' updatedLocalOptimizer
        end 
        msg = sprintf('Local maximum search iteration #%i of #%i', triesCounter, triesLimit);
        Trace(msg, 2);
%%%%%%%%%%%        
        
        updatedLocalOptimizer = FindBestStep(updatedLocalOptimizer);
        updatedLocalOptimizer = AdjustStep(updatedLocalOptimizer);

                        
        updatedLocalOptimizer.vtError = ...
            [updatedLocalOptimizer.vtError ...
             updatedLocalOptimizer.currentPoint.error];
       
%%%%%%%%%%%        
        DO_PAINTING = config.doPainting;
        if (DO_PAINTING)
            PAINT_DELAY = config.paintDelay;
            plot(updatedLocalOptimizer.vtError);
            pause(PAINT_DELAY);
        end
%%%%%%%%%%%        
    end

Trace('FindLocalMaximum ended...', 1);    
return
end

