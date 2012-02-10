function [result] = InitializeBestStepAttemptsCount(localOptimizer)
%
%
%%%%%%%%%%
config = NetworkOptimizerConfiguration();
THRESH_HOLD = config.loaclOptimizeMinStep;
SCALE_FACTOR = config.loaclOptimizeStepGrowthFactor;

NDIM = GetParamsCount(localOptimizer);


if (abs(localOptimizer.vr) < SCALE_FACTOR * THRESH_HOLD)
    result = SCALE_FACTOR;
else
    result = SCALE_FACTOR * NDIM;
end

return
end
