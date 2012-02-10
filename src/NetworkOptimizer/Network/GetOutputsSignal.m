function [ outputsSignal ] = GetOutputsSignal( signal, architecture )
   
    outputsCount = size(architecture.outputs, 2);
    outputsSignal = [];
    
    for outputIndex = 1 : outputsCount
      itemIndex = architecture.outputs(outputIndex);
      outputsSignal = [outputsSignal signal(itemIndex)];
    end

return
end
