function [] = main_debug( )

% halfHardLim = @(x)(hardlim(x) - 0.5);
outFunc = @(x)(...
        2 * logsig(x) - 1 ...
);

logsig2 = @(x)(2 * logsig(x));



warning('off', 'all');
format long g;

CreateConfiguration();
fileName = 'architecture.xml';
layersCount = 20;
%%%%
data = CreateData();
weights = CreateWeights();
net = GenerateConnectionsMap(fileName, layersCount);
%%%%
net.functions = [
    @purelin  @purelin  ... %%inputs
    outFunc outFunc outFunc outFunc outFunc ...
    outFunc outFunc outFunc outFunc outFunc ...
    outFunc outFunc outFunc outFunc outFunc ...
    outFunc outFunc outFunc outFunc outFunc ...
    outFunc ... 
    outFunc %%outputs
];
%%%%
[error, outputsSignals] = SimulateNetwork(net, weights, data);

plotData = data;
plotData.expected = outputsSignals;
Draw2Spiral(plotData);
xlim([-1 1]);
ylim([-1 1]);
zlim([-1 1]);

disp('Error :');
disp(error);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save 'cascade_debug.mat' ...
     net data...
     error outputsSignals
