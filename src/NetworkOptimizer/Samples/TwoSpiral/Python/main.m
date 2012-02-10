function [] = main( )

warning('off', 'all');
format long g;
 
CreateConfiguration();
 
net = CreateNet();
data = CreateData();
biases = CreateBiases();
weights = CreateWeights();

[net2, data2] = AddBiases(net, data, biases);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[error, outputsSignals] = SimulateNetwork(net2, weights, data2);

disp('Error : ');
disp(error);

plotData = data;
plotData.expected = outputsSignals;
Draw2Spiral(plotData);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save 'result.mat' ...
     net data biases ...
     net2 data2 ...
     weights ...
     error outputsSignals
