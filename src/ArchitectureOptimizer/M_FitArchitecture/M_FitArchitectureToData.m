function [ resArchitecture ] = M_FitArchitectureToData( architecture , data )

    resArchitecture = architecture;
    
    resArchitecture.inputs  = M_FitInputs(architecture.inputs   , data.input);
    resArchitecture.outputs = M_FitOutputs(architecture.outputs , data.expected);
    

return
end
