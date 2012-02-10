function [ ] = TestFitOutputs( )

data.outputs = {[0 0] [0 1] [1 0] [1 1]};
net.outputs = [1 2 3];
res = FitOutputs(net.outputs, data.outputs);
AssertEqual(res, [1 2]);

data.outputs = {[0 0] [0 1] [1 0] [1 1]};
net.outputs = [3];
res = FitOutputs(net.outputs, data.outputs);
AssertEqual(res, [2 3]);

disp('TestFitOutputs successfull');
