function ...
    [result] = ...
SetInputRanges(...
    net, ...
    inputRangesLow, ...
    inputRangesUp)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

result = net;
numInputs = net.numInputs;

for inputIndex = 1 : numInputs
    result.inputs{inputIndex}.size = 1;
    low = inputRangesLow(inputIndex);
    up  = inputRangesUp(inputIndex);
    result.inputs{inputIndex}.range = [low up]; 
end



return
end

