function [updatedLocalOptimizer] = OnCandidateFailed(localOptimizer)
%
%
%%%%%%%%%%%%%%%%%%
config = NetworkOptimizerConfiguration();
growthFactor = config.loaclOptimizeStepGrowthFactor;


    Trace('Unsuccessfull try. Step size reduced.', 3);

    updatedLocalOptimizer = localOptimizer;

    updatedLocalOptimizer.candidate.error = inf;
    updatedLocalOptimizer.vr = updatedLocalOptimizer.vr / growthFactor;
      
return
end


