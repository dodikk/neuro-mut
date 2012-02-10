function [ result ] = CreateLocalOptimizer( func, startPoint )
%
%
%%%%%%%%%%%%%%

conf = NetworkOptimizerConfiguration();
netSize = GetNetSize(func.architecture);

result.func         = func;
result.currentPoint = startPoint;
result.currentPoint.error = ...
    SimulateNetwork(...
        result.func.architecture, ...
        result.currentPoint.weights, ...
        result.func.data);
    
result.vtError = [result.currentPoint.error];


result.candidate         = ZeroPoint(netSize);
result.statisticGradient = zeros(netSize);
result.candidateDelta    = zeros(netSize);
result.triesCount        = 0;
result.vvec              = true;
result.vr                = conf.loaclOptimizeInitialStep;
result.vi                = 0;


return
end



