function [ result ] = InitializeSignal( architecture, inputValues )
% Initializes the network signal.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    neuronsCount = size(architecture.connections, 1);
    signal = inf(1, neuronsCount);
    
    inputsCount = size(architecture.inputs, 2);
    
    for index = 1 : inputsCount
       fcn = architecture.functions(index);
       input = architecture.inputs(index);
       signal(input) = fcn( inputValues(index) );
    end

    result = signal;
return
end
