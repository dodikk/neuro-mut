function [updatedLocalOptimizer] = UpdateCandidate(localOptimizer)
%
%
%%%%%%%%%%%%    
    updatedLocalOptimizer = localOptimizer;
    NDIM = GetParamsCount(updatedLocalOptimizer);
    
    
    config = NetworkOptimizerConfiguration();
    initialStep = -abs(config.loaclOptimizeInitialStep);
    maxStep = config.loaclOptimizeMaxStep;    
%%%%    

    updatedLocalOptimizer.vr = - updatedLocalOptimizer.vr;
    
    if ( updatedLocalOptimizer.vr > 0 )
        updatedLocalOptimizer.vi = ...
            IncrementWithOverflow(...
                updatedLocalOptimizer.vi, ...
                NDIM ...
            );
    end

    [row, col] = ParamIndexToMatrixCoordinates(...
                    updatedLocalOptimizer, ...
                    updatedLocalOptimizer.vi);

                
%%%%%%%%%%%                    
    updatedLocalOptimizer.candidate.weights(row, col) = ...
        updatedLocalOptimizer.candidate.weights(row, col) + ...
        updatedLocalOptimizer.vr;                    
                
    updatedLocalOptimizer.candidate.error = ...
        CheckedSimulateNetwork( ...
            updatedLocalOptimizer, ...
            updatedLocalOptimizer.candidate.weights ...
        );       

        
%%%%%%%%%%%%%

return
end
