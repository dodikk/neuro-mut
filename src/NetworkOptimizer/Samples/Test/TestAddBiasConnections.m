function []  = TestAddBiasConnections(  )

warning('off', 'all');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bIndexes = [3 4 5];
bLow = [-10 -10 -10];
bUp  = [+10 +10 +10];

biases.indexes = bIndexes;
biases.low = bLow;
biases.up = bUp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net2 = AddBiasConnections(net, biases);

expectedConn = ...
       [ ... %%weights
         0 0 1 1 1 0 0 0; ...
         0 0 1 1 1 0 0 0; ...
         0 0 0 0 1 0 0 0; ...
         0 0 0 0 1 0 0 0; ...
         0 0 0 0 0 0 0 0;
         0 0 1 0 0 0 0 0; %%Biases
         0 0 0 1 0 0 0 0;
         0 0 0 0 1 0 0 0];
     
%disp('recieved :');
%disp(net2.connections);
AssertEqual(net2.connections, expectedConn);
AssertEqual(net2.inputs, [1 2 6 7 8]);
AssertEqual(net2.outputs, net.outputs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('TestAddBiasConnections successfull');
