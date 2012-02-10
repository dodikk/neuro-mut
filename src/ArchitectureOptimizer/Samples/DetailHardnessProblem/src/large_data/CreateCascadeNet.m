function [net] = CreateCascadeNet()
%
%
%%%%%%%%%


bounds = [-1 1; -1 1];
%%hiddenLayerSize = 20;
%%layersCount = 2;
outputsCount = 10;
%layerSizes = ones(1, layersCount) * hiddenLayerSize;

layerSizes = [20 10 10];
functions = {'tansig', 'tansig', 'tansig', 'tansig'};



net = newcf(bounds, [layerSizes outputsCount], functions);
net = init(net);




return
end
