function [result] = ConfigurePerceptron(net)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

result = net;

result.initFcn             = 'initlay';
result.performFcn          = 'mse';
result.trainFcn            = 'learnpn'; 
%result.trainParam.epochs   = 10000;

init(result);


return
end
