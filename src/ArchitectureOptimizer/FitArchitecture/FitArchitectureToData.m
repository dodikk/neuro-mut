function [ resArchitecture ] = FitArchitectureToData( architecture , data )

    resArchitecture = architecture;
    
    resArchitecture.inputs = FitInputs(architecture.inputs , data.input);
    resArchitecture.outputs = FitOutputs(architecture.outputs , data.expected);
    

return
end
