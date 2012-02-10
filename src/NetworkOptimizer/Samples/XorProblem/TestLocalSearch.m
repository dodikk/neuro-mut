function [] = TestLocalSearch( )

warning('off', 'all');

conn = [ 0 0 1 1; ...
         0 0 1 1; ...
         0 0 0 1; ...
         0 0 0 0 ];
    
fcn = [@logsig @logsig @logsig @logsig];
inputs = [1 2];
outputs = [4];

net.connections = conn;
net.functions = fcn;
net.inputs = inputs;
net.outputs = outputs;
%%%%%%%%%%%%%%%%%%%%%%%%%%

in = {[0 0] [0 1] [1 0] [1 1]};
exp = {[0] [1] [1] [0]};

data.input = in;
data.expected = exp;
%%%%%%%%%%%%%%%%%%%%%%%%%%
weights = ...
       [ 0 0 1 2; ...
         0 0 3 4; ...
         0 0 0 5; ...
         0 0 0 0 ];
     
point.weights = weights;
point.error = inf;
     
local = FindLocalMaximum(...
            net, ...
            data, ...
            point);
        

disp('Local : ');
msgErr = sprintf('  SSE : %d', local.error);
disp(msgErr);
disp('  Weights :');
disp(local.weights);
disp('');
disp('');
