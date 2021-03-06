function [updatedLocalOptimizer] = FindBestStep(localOptimizer)
%
%
%%%%%%%%%%%%%%%%%%%%%%
    config = NetworkOptimizerConfiguration();
	maxTriesCount = config.findBestStepMaxTriesCount; 
Trace('FindBestStep started...', 2);
    updatedLocalOptimizer = localOptimizer;
    netSize = GetNetSize(updatedLocalOptimizer.func.architecture);
       
    updatedLocalOptimizer.currentPoint.error = ...
        CheckedSimulateNetwork(...
            updatedLocalOptimizer, ...
            updatedLocalOptimizer.currentPoint.weights);
    
    
    maxTriesCount = InitializeBestStepAttemptsCount(updatedLocalOptimizer);
    
	updatedLocalOptimizer.triesCount = 0;
	while  ( ...
               ( ...
                   updatedLocalOptimizer.candidate.error >= ...
                   updatedLocalOptimizer.currentPoint.error ...
               ) ...
               && ...
               (...
                   updatedLocalOptimizer.triesCount < ...
                   maxTriesCount ...
               ) ...
           ) ...
        msg = sprintf(...
                'Best step search iteration #%i of #%i', ...
                updatedLocalOptimizer.triesCount, ...
                maxTriesCount);
            
        Trace(msg, 10);
		
        
        updatedLocalOptimizer.candidate = updatedLocalOptimizer.currentPoint;
        updatedLocalOptimizer.vvec = false;
        updatedLocalOptimizer = UpdateCandidate(updatedLocalOptimizer);
                       

        updatedLocalOptimizer.triesCount = updatedLocalOptimizer.triesCount + 1;
    end


msg = sprintf('Current error : %i', updatedLocalOptimizer.currentPoint.error);
Log(msg, 1);
msg = sprintf('Candidate error : %i', updatedLocalOptimizer.candidate.error);
Log(msg, 1);

Trace('FindBestStep ended...', 2);
end
