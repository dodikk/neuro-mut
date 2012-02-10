function [updatedLocalOptimizer] = OnLaterCandidateMatch(localOptimizer);
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    config = NetworkOptimizerConfiguration();
    growthFactor = config.loaclOptimizeStepGrowthFactor;
Trace('Later candidate matches. Changing direction.', 3);
    updatedLocalOptimizer = localOptimizer;

    netSize = GetNetSize(updatedLocalOptimizer.func.architecture);

    updatedLocalOptimizer.statisticGradient = zeros(netSize);
    
    updatedLocalOptimizer.candidate.weights = updatedLocalOptimizer.currentPoint.weights;
    updatedLocalOptimizer.candidate.error = ...
        CheckedSimulateNetwork(...
            updatedLocalOptimizer, ...
            updatedLocalOptimizer.candidate.weights ...
        );

    [row, col] = ParamIndexToMatrixCoordinates(...
                        updatedLocalOptimizer, ...
                        updatedLocalOptimizer.vi);
                    
    

    updatedLocalOptimizer.candidate.weights(row, col) = ...
        updatedLocalOptimizer.candidate.weights(row, col) + ...
        updatedLocalOptimizer.vr;
    
    updatedLocalOptimizer.statisticGradient(row, col) = updatedLocalOptimizer.vr;
    
    updatedLocalOptimizer.vr = ...
        updatedLocalOptimizer.vr * ...
        growthFactor;


return
end

