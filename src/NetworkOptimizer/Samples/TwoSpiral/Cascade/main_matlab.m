diary optimizer.log
diary on

warning('off', 'all');
format long g;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

fileName = 'architecture.xml';
architecture = GenerateConnectionsMap(fileName, 12);
architecture.functions = ...
      {
       'purelin' 'purelin' ...
       'tansig'  'tansig' 'tansig' 'tansig' 'tansig' ...
       'tansig'  'tansig' 'tansig' 'tansig' 'tansig' ...
       'tansig'  'tansig' 'tansig' 'tansig' };
                       
data = CreateTwoSpiralDataForMatlab();

biasInfo.indexes = [1 2];
biasInfo.low     = [-1 -1];
biasInfo.up      = [0 0];

neuronsCount = 16;
vtLow = ones(neuronsCount) * (-120);
vtUp  = ones(neuronsCount) * (+50);


net = RawNetworkToMatlabFormat(architecture, biasInfo, vtLow, vtUp);
net.trainParam.show = inf;
[net, TR, Y, E, Pf, Af ] = train(net, data.input, data.expected);


save('net.mat', 'net');


mseMsg = sprintf('MSE error : %f', mse(E));
disp(mseMsg);
PlotMatlabBackup('net.mat');


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
diary off

