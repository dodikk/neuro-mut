function [ result ] = M_FitInputs( inputs, data )
%
%
%%%%%%%%%%%%%

    inputsSize = size(inputs, 2);
    dataEntrySize = size(data(1:end, 1), 1);
    
    
    if (inputsSize >= dataEntrySize)
        result = inputs(1, 1:dataEntrySize);
    else
        rSize = dataEntrySize - inputsSize;
        
        beg = inputs(inputsSize) + 1;
        fin = beg + rSize - 1;
        
        rPatch = beg : 1 : fin; 
        result = [inputs rPatch];
    end

return
end
