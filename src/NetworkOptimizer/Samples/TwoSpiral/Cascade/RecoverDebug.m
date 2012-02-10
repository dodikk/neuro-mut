warning('off', 'all');
format long g;
load 'cascade_debug.mat'

[error, outputsSignals] = SimulateNetwork(net2, glob.weights, data2);
plotData = data;
plotData.expected = outputsSignals;


%%%%%%%%%%%%%%%%%%%%%
[testData, testPlotData] = CreateTwoSpiralTestData(2);
[error, outputsSignals] = SimulateNetwork(...
    net2, ...
    glob.weights, ...
    testData);

testPlotData.expected = outputsSignals;
dataDelimiter = 0;

save 'cascade_debug.mat' outputsSignals
%%%%%%%%%%%%%%%%%%%%%


subplot(3, 1, 1); plot(vtError);
subplot(3, 1, 2); Draw2Spiral(plotData);
subplot(3, 1, 3); Draw2SpiralPlain(testPlotData, dataDelimiter);
