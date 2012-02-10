function [] = main( )

warning('off', 'all');
format long g;

diary optimizer.log
diary on

CreateConfiguration();

x = [-3 1 2];
y = -5 : 0.1 : 5;

net = CreateNet();
data = CreateData(x, y);
[pLow, pUp] = CreateBorders();

func = [];
func.architecture = net;
func.data = data;
func.lowBorder = pLow;
func.upBorder  = pUp;
func.plotData  = data;


[glob, localOptimizer, vtError] = FindGlobalMaximum(func);
%vtError = localOptimizer.vtError;


disp('Global : ');
errMsg = sprintf('  MSE : %d', glob.error);
disp(errMsg);


hold off
%subplot(2, 2, 1:2); 
plot(vtError);
grid on
axis on
input('Press <enter> to continue');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = -3 : 0.1 : 3;
y = -5 : 0.1 : 5;
data = CreateData(x, y);

mData = HorizontalCell2Mat(data.input);

plotX = mData(:, 1)';
plotY = mData(:, 2)';


[error, outputsSignals] = SimulateNetwork(net, glob.weights, data);
mOutputs = HorizontalCell2Mat(outputsSignals);

%subplot(2, 2, 3:4); 
plot3(plotX, plotY, mOutputs');
grid on
axis square
hold off

mResult = vertcat(plotX, plotY, mOutputs');
%disp('Simulation results : ');
%disp(mResult');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save 'square.mat' ...
     glob vtError...
     net data

diary off
