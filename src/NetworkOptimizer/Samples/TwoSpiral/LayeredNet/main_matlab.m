diary optimizer.log
diary on

warning('off', 'all');
format long g;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

fileName = 'architecture.xml';
architecture = GenerateConnectionsMap(fileName, 2);
architecture.functions = ...
      {'purelin' 'purelin' ...
       'tansig'  'tansig' ...
       'tansig'  'tansig' 'tansig' 'tansig'  ... %%'tansig' ...
       'tansig'  'tansig' 'tansig' 'tansig' ... %%'inv_tansig' ...
       'tansig' };
	   

data = CreateTwoSpiralDataForMatlab();
biasInfo = CreateBiases();
[vtLow, vtUp] = CreateBorders();


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

