function [] = TestXORSimulate()

warning('off', 'all');

conn = [ 0 0 1 1 0; ...
         0 0 1 1 0; ...
         0 0 0 0 1; ...
         0 0 0 0 1; ...
         0 0 0 0 0];
    
fcn = [@purelin @purelin @hardlim @hardlim @hardlim];
inputs = [1 2];
outputs = [5];

net.connections = conn;
net.functions = fcn;
net.inputs = inputs;
net.outputs = outputs;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
in = {[0 0] [0 1] [1 0] [1 1]};
exp = {[0] [1] [1] [0]};

data.input = in;
data.expected = exp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bIndexes = [3 4 5];
bLow = [-10 -10 -10];
bUp  = [+10 +10 +10];

biases.indexes = bIndexes;
biases.low = bLow;
biases.up = bUp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
weights = ...
       [ ... %%weights
         0 0  -1    -1     0 0 0 0; ...
         0 0  -1    -1     0 0 0 0; ...
         0 0   0     0     1 0 0 0; ...
         0 0   0     0    -1 0 0 0; ...
         0 0   0     0     0 0 0 0;
         0 0 1.5     0     0 0 0 0; %%Biases
         0 0   0   0.5     0 0 0 0;
         0 0   0     0  -0.5 0 0 0];


[net2, data2] = AddBiases(net, data, biases);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[err] = SimulateNetwork(net2, weights, data2);

AssertEqual(err, 0); %??? maybe other norm definition ???
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('TestXORSimulate successfull');
