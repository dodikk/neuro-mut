function [updatedLocalOptimizer] = OnStatisticGradientSucceeded(localOptimizer)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%
    config = NetworkOptimizerConfiguration();
    growthFactor = config.loaclOptimizeStepGrowthFactor;
    conn = localOptimizer.func.architecture.connections;
Trace('The statistic gradient matches. Fixing statistic gradient.', 3);
    updatedLocalOptimizer = localOptimizer;
    
    
    updatedLocalOptimizer.currentPoint = updatedLocalOptimizer.candidate;
    
    [row, col] = ParamIndexToMatrixCoordinates(...
                        updatedLocalOptimizer, ...
                        updatedLocalOptimizer.vi);
                    
                        
    updatedLocalOptimizer.statisticGradient(row, col) = ...
        updatedLocalOptimizer.statisticGradient(row, col) + ...
        updatedLocalOptimizer.vi;
    
        
    updatedLocalOptimizer.candidateDelta = ...
        updatedLocalOptimizer.statisticGradient * ...
        growthFactor;
    
        
    updatedLocalOptimizer.vvec = true;
    
    updatedLocalOptimizer.candidate.weights = ...
        updatedLocalOptimizer.candidate.weights + ... 
        updatedLocalOptimizer.candidateDelta;
    
    updatedLocalOptimizer.candidate.error = ...
        CheckedSimulateNetwork( ...
            updatedLocalOptimizer, ...
            updatedLocalOptimizer.candidate.weights ...
        );

%%%%%%%%%%%%%%%%
    vtIndexes = find((conn > 0) | (conn < 0));
    vtParams = updatedLocalOptimizer.candidateDelta(vtIndexes);

    updatedLocalOptimizer.vr = sqrt( sse(vtParams) );
%%%%%%%%%%%%%%%%
    
return
end

