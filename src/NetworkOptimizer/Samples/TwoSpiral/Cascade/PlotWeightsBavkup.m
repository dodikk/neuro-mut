warning('off', 'all');

load 'cascade_debug.mat'
load 'CurrentWeights.mat'

result = updatedLocalOptimizer.currentPoint;
net2 = updatedLocalOptimizer.func.architecture;
data2 = updatedLocalOptimizer.func.data;

[error, outputsSignals] = SimulateNetwork(net2, result.weights, data2);
plotData = updatedLocalOptimizer.func.plotData;
plotData.expected = outputsSignals;

disp('Error : ');
disp(error);

Draw2Spiral(plotData);

