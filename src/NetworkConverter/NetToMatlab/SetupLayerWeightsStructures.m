function [result] = SetupLayerWeightsStructures(net)
%
% Net must already be constructed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    result = net;
    for fromVertexIndex = 1 : result.numLayers
        for toVertexIndex = 1 : result.numLayers
           if (0 == result.layerConnect(toVertexIndex, fromVertexIndex)) 
               continue;
           end
           
           result.layerWeights{toVertexIndex, fromVertexIndex}.initFcn   = 'initnw'  ;
           result.layerWeights{toVertexIndex, fromVertexIndex}.learnFcn  = 'learngdm';
           result.layerWeights{toVertexIndex, fromVertexIndex}.weightFcn = 'dotprod' ;
           result.layerWeights{toVertexIndex, fromVertexIndex}.learn     = 1;
           
           %%result.layerWeights{toVertexIndex, fromVertexIndex}.learnParam     = 1;
           %% .lc
           %% .mc
        end
    end

    

return
end


