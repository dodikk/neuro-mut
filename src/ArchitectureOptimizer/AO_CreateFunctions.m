function [result] = AO_CreateFunctions(vertexCount)

    result = [];
    DEFAULT_CALLBACK = @tansig;
    
    for index = 1 : vertexCount
        result = [result DEFAULT_CALLBACK];
    end

return
end

