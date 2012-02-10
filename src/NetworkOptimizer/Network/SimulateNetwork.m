function ...
    [ error, ...
      outputsSignals ...
    ]= ...
SimulateNetwork(...
    architecture, ...
    weights, ...
    data)
% TODO : Split error and output values calculation .
% Simulates network on a whole data set.
%%%%%%%%%%%%%%%%
Trace('Simulate network started ...', inf);
    architecture = PreprocessArchitecture(architecture);
    dataSize = size(data.input, 2);
    
    vtError = [];
    outputsSignals = cell(1, dataSize);

    for index = 1 : dataSize
        [itemError, itemSignal] = SimulateSingleNetworkRun(...
                        architecture, ...
                        weights, ...
                        data.input{index}, ...
                        data.expected{index} );
                 
        vtError = [vtError itemError];
        outputsSignals(index) = {GetOutputsSignal(itemSignal, architecture)};
    end

    
    error = mse(vtError);
    %% outputsSignals is up-to-date
        
Trace('Simulate network ended...', inf);

config = NetworkOptimizerConfiguration();
DO_PAINTING = config.doPainting;
if (DO_PAINTING)
    PAINT_DELAY = config.paintDelay;
    plotData = data;
    plotData.expected = outputsSignals;
    Draw2Spiral(plotData);
    pause(PAINT_DELAY);
end

return
end
