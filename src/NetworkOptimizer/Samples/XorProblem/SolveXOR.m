function [] = SolveXOR( )

warning('off', 'all');
CreateConfiguration();

diary optimizer.log
diary on

net = CreateNet();
data = CreateData();
biases = CreateBiases();


[low, up] = CreateBorders();

pLow.weights = AddBiasToLowBound(low, biases);
pLow.error = inf;

pUp.weights = AddBiasToUpBound(up, biases);
pUp.error = inf;



[net2, data2] = AddBiases(net, data, biases);


func = [];
func.architecture = net2;
func.data         = data2;
func.lowBorder    = pLow;
func.upBorder     = pUp;
func.plotData     = data;


[glob, localOptimizer, vtError] = FindGlobalMaximum(func);


disp('Global : ');
errMsg = sprintf('  MSE : %d', glob.error);
disp(errMsg);

%vtError = localOptimizer.vtError;
subplot(2, 2, 1:2); plot(vtError);
%input('Press <enter> to continue');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mData = HorizontalCell2Mat(data.input);

plotX = mData(:, 1)';
plotY = mData(:, 2)';


[error, outputsSignals] = SimulateNetwork(net2, glob.weights, data2);
mOutputs = HorizontalCell2Mat(outputsSignals);


subplot(2, 2, 3); plot3(plotX, plotY, mOutputs');
grid on
axis square
%%%%%%%%%%%%%%%%%%%%%%

%input('Press <enter> to continue');

plotX = 0:0.1:1;
plotY = 0:0.1:1;
data = CreateGrid(plotX, plotY);
[net2, data2] = AddBiases(net, data, biases);


[error, outputsSignals] = SimulateNetwork(net2, glob.weights, data2);
mOutputs = HorizontalCell2Mat(outputsSignals);


mData = HorizontalCell2Mat(data.input);
plotX = mData(:, 1)';
plotY = mData(:, 2)';


subplot(2, 2, 4); plot3(plotX, plotY, mOutputs');
grid on
axis square
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

save 'xor.mat' ...
     glob vtError...
     net data biases...
     net2 data2


diary off
