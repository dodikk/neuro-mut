function [ ] = TestFitArchitecture( )

data.input = {[0 0] [0 1] [1 0] [1 1]};
net.inputs = [1 2 3];
data.expected = {[0 0] [0 1] [1 0] [1 1]};
net.outputs = [3];
res = FitArchitectureToData(net, data);

AssertEqual(res.inputs, [1 2]);
AssertEqual(res.outputs, [2 3]);

disp('TestFitArchitecture successfull');
