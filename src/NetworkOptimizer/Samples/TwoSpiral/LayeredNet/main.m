function [] = main( )

diary optimizer.log
diary on

warning('off', 'all');
format long g;
 
CreateConfiguration();
 
net = CreateNet();
data = CreateData();
biases = CreateBiases();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[low, up] = CreateBorders();

pLow.weights = AddBiasToLowBound(low, biases);
pLow.error = inf;

pUp.weights = AddBiasToUpBound(up, biases);
pUp.error = inf;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[net2, data2] = AddBiases(net, data, biases);


func = [];
func.architecture = net2;
func.data = data2;
func.lowBorder = pLow;
func.upBorder  = pUp;
func.plotData  = data;


[glob, localOptimizer, vtError] = FindGlobalMaximum(func);
%vtError = localOptimizer.vtError;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Global : ');
errMsg = sprintf('  MSE : %d', glob.error);
disp(errMsg);


plot(vtError);
input('Press <enter> to continue');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[error, outputsSignals] = SimulateNetwork(net2, glob.weights, data2);
plotZ = HorizontalCell2Mat(outputsSignals);

plotData = data;
plotData.expected = outputsSignals;
Draw2Spiral(plotData);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save 'spiral2.mat' ...
     glob vtError...
     net data biases...
     net2 data2


diary off
