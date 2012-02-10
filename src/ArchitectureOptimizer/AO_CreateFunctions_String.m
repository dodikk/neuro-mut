function [result] = AO_CreateFunctions_String(vertexCount)

    result = cell(1, vertexCount);
    DEFAULT_CALLBACK = 'tansig';
    
    for index = 1 : vertexCount
		result{index} = DEFAULT_CALLBACK;
    end

return
end

