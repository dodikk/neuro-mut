function [pLow, pUp] = AO_CreateBorders(vertexCount, biases)

    low = ones(vertexCount) * (-10);
    up  = ones(vertexCount) * (+10);

    pLow.weights = AddBiasToLowBound(low, biases);
    pLow.error = inf;

    pUp.weights = AddBiasToUpBound(up, biases);
    pUp.error = inf; 

return
end