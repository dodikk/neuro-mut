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
       'tansig'  'tansig' 'tansig' 'tansig' 'tansig' ...
       'tansig'  'tansig' 'tansig' 'tansig' 'tansig' ...
       'tansig'  'tansig' 'tansig' 'tansig' 'tansig' ...
       'tansig' };
                       
data = CreateTwoSpiralDataForMatlab();
biasInfo = CreateBiases();
[vtLow, vtUp] = CreateBorders();


net = RawNetworkToMatlabFormat(architecture, biasInfo, vtLow, vtUp);
net.trainParam.show = inf;
net = train(net, data.input, data.expected);
save('net.mat', 'net');

PlotMatlabBackup('net.mat');



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
diary off

