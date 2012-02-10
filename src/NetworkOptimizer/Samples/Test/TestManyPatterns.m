function [] = TestManyPatterns()

conn = [ 0 0 1 1; ...
         0 0 1 1; ...
         0 0 0 1; ...
         0 0 0 0 ];
    
fcn = [@Linear @Linear @Linear @Linear];
inputs = [1 2];
outputs = [4];

net.connections = conn;
net.functions = fcn;
net.inputs = inputs;
net.outputs = outputs;

weights = ...
       [ 0 0 1 2; ...
         0 0 3 4; ...
         0 0 0 5; ...
         0 0 0 0 ];


in = {[0 0] [0 1] [1 0] [1 1]};
exp = {[0] [1] [1] [0]};

data.input = in;
data.expected = exp;
    
[err] = SimulateNetwork(net, weights, data);

expSig = [0 19 7 26];
arrExp = [0 1  1 0 ];
expErr = [0 18 6 26];

expErr = mse(expErr);
AssertEqual(err, expErr);

disp('TestManyPatterns successfull');
