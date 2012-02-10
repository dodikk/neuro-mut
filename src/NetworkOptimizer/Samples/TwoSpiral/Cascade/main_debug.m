function [] = main_debug( )

diary optimizer.log
diary on

warning('off', 'all');
format long g;

CreateConfiguration_debug();
fileName = 'architecture.xml';
layersCount = 12;
%%%%
data = CreateData();
net = GenerateConnectionsMap(fileName, layersCount);
%%%%
net.functions = [
    @purelin @purelin ...
    @FahlmanFunc @FahlmanFunc @FahlmanFunc @FahlmanFunc @FahlmanFunc ...
    @FahlmanFunc @FahlmanFunc @FahlmanFunc @FahlmanFunc @FahlmanFunc ...
    @FahlmanFunc @FahlmanFunc @FahlmanFunc ...
    @FahlmanFunc
];
%%%%

[pLow, pUp] = CreateBorders();

%%%%
biases.indexes = [1 2];
biases.low = [-1 -1];
biases.up = [0 0];

[pLow.weights pUp.weights] = AddBiasToBounds(pLow.weights, pUp.weights, biases);

[net2, data2] = AddBiases(net, data, biases);



save 'cascade_debug.mat' ...
     net data biases...
     net2 data2
%%%%


func = [];
func.architecture = net2;
func.data = data2;
func.lowBorder = pLow;
func.upBorder  = pUp;
func.plotData  = data; 


[glob, localOptimizer, vtError] = FindGlobalMaximum(func);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%vtError = localOptimizer.vtError;

disp('Global : ');
errMsg = sprintf('  MSE : %d', glob.error);
disp(errMsg);

[error, outputsSignals] = SimulateNetwork(net2, glob.weights, data2);
plotData = data;
plotData.expected = outputsSignals;


%%%%%%%%%%%%%%%%%%%%%

testData = CreateTwoSpiralTestData(2);
[error, outputsSignals] = SimulateNetwork(...
                            net2, ...
                            glob.weights, ...
                            testData);

testData.expected = outputsSignals;
dataDelimiter = 0;
%%%%%%%%%%%%%%%%%%%%%


subplot(3, 1, 1); plot(vtError);
subplot(3, 1, 2); Draw2Spiral(plotData);
subplot(3, 1, 3); Draw2SpiralPlain(testData, dataDelimiter);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

save 'cascade_debug.mat' ...
     glob vtError...
     net data biases...
     net2 data2 ...
     plotData


diary off

