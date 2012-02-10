function [ net ] = CreateNet( )


conn = [ 0 0 1 ; ...
         0 0 1 ; ...
         0 0 0 ];
    
fcn = [@Square @Square @purelin];
inputs = [1 2];
outputs = [3];

net.connections = conn;
net.functions = fcn;
net.inputs = inputs;
net.outputs = outputs;
%%%%%%%%%%%%%%%%%%%%%%%%%%
