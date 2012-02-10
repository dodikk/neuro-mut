function [net] = CreateFeedForwardNet()

bounds = [-1 1; -1 1];
hiddenLayerSize = 60;
layersCount = 1;
outputsCount = 10;
layerSizes = ones(1, layersCount) * hiddenLayerSize;
functions = {'tansig', 'tansig'};
%%functions = {'tansig', 'tansig', 'tansig'};
net = newff(bounds, [layerSizes outputsCount], functions);
net = init(net);

return
end

