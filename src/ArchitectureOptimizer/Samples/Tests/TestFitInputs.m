function [] = TestFitInputs( )
%
% 
%%%%%%%%%%%

data.inputs = {[0 0] [0 1] [1 0] [1 1]};
net.inputs = [1 2 3];
res = FitInputs(net.inputs, data.inputs);
AssertEqual(res, [1 2]);

data.inputs = {[0 0] [0 1] [1 0] [1 1]};
net.inputs = [3];
res = FitInputs(net.inputs, data.inputs);
AssertEqual(res, [3 4]);

disp('TestFitInputs successfull');
