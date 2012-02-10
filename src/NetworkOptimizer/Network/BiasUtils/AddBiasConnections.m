function ...
    [ architectureOut ...
    ] = ...
AddBiasConnections( ... 
    architecture, ...
    biasRanges)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    biasCount = size(biasRanges.indexes, 2);
    neuronsCount = size(architecture.connections, 1);
    newSize = neuronsCount + biasCount;
%%%%%%%%%
    architectureOut.outputs = UpdateOutputs(architecture);
%%%%%%%%%
    architectureOut.inputs = ...
        UpdateInputs(architecture, ...
                     neuronsCount, ...
                     newSize);
%%%%%%%%%       
    architectureOut.functions = ...
        UpdateFunctions(architecture, biasCount);
%%%%%%%%%
    

    
    architectureOut.connections = UpdateConnections(...
                                      architecture,...
                                      biasRanges);
%%%%%%%%%    

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result] = UpdateConnections( ...
                        architecture,...
                        biasRanges)
                    
    biasCount = size(biasRanges.indexes, 2);
    neuronsCount = size(architecture.connections, 1);
    newSize = neuronsCount + biasCount;
    
    conn = zeros(newSize, newSize);
    conn(...
       1 : neuronsCount, ...
       1 : neuronsCount) = ...
    architecture.connections;

    for biasIndex = 1 : biasCount
       itemIndex = biasRanges.indexes(biasIndex);
       conn(neuronsCount + biasIndex, itemIndex) = true;
    end

    result = conn;
    
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result] = UpdateOutputs(architecture)

    result = architecture.outputs;

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result] = UpdateInputs(...
                        architecture, ...
                        neuronsCount, ...
                        newSize)

    inputsIncrement = neuronsCount + 1 : ...
                                     1 : ...
                      newSize;
    
     result = [architecture.inputs, inputsIncrement];

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result] = UpdateFunctions(architecture, biasCount)

    fcnIncrement = CreatePurelinFunctions(biasCount);
    result = [architecture.functions fcnIncrement];

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [fcnVt] = CreatePurelinFunctions(biasCount)

    fcnVt = [];
    for index = 1 : biasCount
        fcnVt = [fcnVt @purelin];
    end

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
