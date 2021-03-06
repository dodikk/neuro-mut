function ...
    [ error, ...
      outputsSignals ...
    ] = ...
CheckedSimulateNetwork( ...
    localOptimizer, ...
    weights)
%
%
%%%%%%%%%%%%%%%%%%

    if WeightsInRange(...
           weights, ...
           localOptimizer.func.lowBorder.weights, ...
           localOptimizer.func.upBorder.weights ...
       )
   
       [error, outputsSignals] = ...
       SimulateNetwork( ...
           localOptimizer.func.architecture, ...
           weights, ...
           localOptimizer.func.data);
    else
       error = Inf;
       outputsSignals = [];
    end
    
    
return
end

