function [ net ] = CreateNet( )

fileName = 'architecture.xml';
net = GenerateConnectionsMap(fileName, 2);
    
fcn = [@purelin @purelin ...
       @logsig  @logsig ...
       @logsig  @logsig @logsig @logsig ...
       @inv_logsig  @inv_logsig @inv_logsig @inv_logsig @inv_logsig ...
       @inv_logsig];
   
net.functions = fcn;
% %%%%%%%%%%%%%%%%%%%%%%%%%%