function [result] = ConfigureLmaSettings(net)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

result = net;

result.initFcn             = 'initlay';
result.performFcn          = 'mse';
result.trainFcn            = 'trainlm'; 
result.trainParam.epochs   = 1000;
%result.trainParam.show     = 1;

result = init(result);
result.trainParam.min_grad = 1e-25;

result.adaptFcn = 'trainlm';
result.adaptParam.passes = 1;

result.trainParam.mu_max = 1e+25;
%%result.divideFcn = 'dividerand';



return
end
