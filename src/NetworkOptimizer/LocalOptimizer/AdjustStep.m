function [updatedLocalOptimizer] = AdjustStep(localOptimizer)
%
%
%%%%%%%%%%%%%%%%%%%%%    
Trace('AdjustStep started...', 2);
    config = NetworkOptimizerConfiguration();
	growthFactor = config.loaclOptimizeStepGrowthFactor;
    
    updatedLocalOptimizer = localOptimizer;

    msg = sprintf('Changing parameter %i', updatedLocalOptimizer.vi);
    Log(msg, 3);

    msg = sprintf('Parameter delta is %i', updatedLocalOptimizer.vr);
    Log(msg, 3);

    
    msg = sprintf(...
        'Current error is : %i', ...
        updatedLocalOptimizer.currentPoint.error);
    Log(msg, 4);
    
    msg = sprintf(...
        'Candidate error is : %i', ...
        updatedLocalOptimizer.candidate.error);
    Log(msg, 4);
    
    
    
	if ( updatedLocalOptimizer.candidate.error >= updatedLocalOptimizer.currentPoint.error )
        updatedLocalOptimizer = OnCandidateFailed(updatedLocalOptimizer);
    else      
        updatedLocalOptimizer.currentPoint = updatedLocalOptimizer.candidate;
        
        
        if (0 == updatedLocalOptimizer.triesCount)
            updatedLocalOptimizer = OnFirstCandidateMatch(updatedLocalOptimizer);            
        else
            updatedLocalOptimizer.candidate.weights = ...
                updatedLocalOptimizer.candidate.weights + ...
                updatedLocalOptimizer.statisticGradient;
            
              
            [row, col] = ParamIndexToMatrixCoordinates(...
                        updatedLocalOptimizer, ...
                        updatedLocalOptimizer.vi);  
            
            updatedLocalOptimizer.candidate.weights(row, col) = ...
                updatedLocalOptimizer.candidate.weights(row, col) + ...
                updatedLocalOptimizer.vr;
            

            updatedLocalOptimizer.candidate.error = ...
                CheckedSimulateNetwork( ...
                    updatedLocalOptimizer, ...
                    updatedLocalOptimizer.candidate.weights ...
                );
            
            msg = sprintf(...
                'Statistic gradient fixed Candidate error is : %i', ...
                updatedLocalOptimizer.candidate.error);
            Log(msg, 4);
            
                
            if ( ...
                 updatedLocalOptimizer.candidate.error >= ...
                 updatedLocalOptimizer.currentPoint.error ...
               )
                updatedLocalOptimizer = OnLaterCandidateMatch(updatedLocalOptimizer);
            else
                updatedLocalOptimizer = OnStatisticGradientSucceeded(updatedLocalOptimizer);              
            end
        end
    end

    
msg = sprintf(...
        'New current error : %i', ...
        updatedLocalOptimizer.currentPoint.error);    
Log(msg, 3);



Trace('AdjustStep ended...', 2);
return
end
