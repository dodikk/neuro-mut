function [ result ] = M_FitOutputs( outputs, data )
%
%
%%%%%%%%%%%%%%%%%%%

    outputsSize = size(outputs, 2);
    dataEntrySize = size(data(1:end, 1), 1);
    
    
    if (outputsSize >= dataEntrySize)
        result = outputs(1, 1:dataEntrySize);
    else
        rSize = dataEntrySize - outputsSize;

        fin = outputs(1) - 1;
        beg = fin - rSize + 1;
        
        
        rPatch = beg : 1 : fin; 
        result = [rPatch outputs];
    end

return
end
