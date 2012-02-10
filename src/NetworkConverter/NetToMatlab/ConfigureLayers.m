function [result] = ConfigureLayers(net, arrFunctions)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

result = net;
numLayers = net.numLayers;

for layerIndex = 1 : numLayers
    result.layers{layerIndex}.size = 1;
    result.layers{layerIndex}.initFcn='initnw';
    result.layers{layerIndex}.transferFcn = arrFunctions{layerIndex};
end


return
end


