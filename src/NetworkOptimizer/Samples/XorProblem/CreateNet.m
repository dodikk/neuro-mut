function [ net ] = CreateNet( )


conn = [ 0 0 1 1 1; ...
         0 0 1 1 1; ...
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
