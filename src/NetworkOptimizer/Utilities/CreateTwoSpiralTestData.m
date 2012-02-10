function [ data, plotData ] = CreateTwoSpiralTestData(biasCount)
%
%
%%%%%%%%%%%%%%%%%%%%

low  = -6.5;
up   = +6.5;
step = 0.05;

len = (up - low) / step;
count = len * len;

in  = cell(1, count);
exp = cell(1, count);
inPlot = cell(1, count);

spacer = ones(1, biasCount);

inIndex = 1;
for xIndex = low : step : up
    for yIndex = low : step : up
       pItem = [xIndex yIndex];
       wItem = [pItem spacer];
       
       in{inIndex}  = wItem;
       exp{inIndex} = [0];
       inPlot{inIndex} = pItem;
       
       inIndex = inIndex + 1;
    end 
end

data.input = in;
data.expected = exp;

plotData.input = inPlot;
plotData.expected = exp;

return
end
